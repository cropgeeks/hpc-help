Slurm - Queue Policies & Advice
===============================

Our Slurm setup runs with the following goals and constraints in mind:

* allow short jobs to run without having to wait more than a few hours
* do not permit many long jobs to take over the entire cluster for long periods
* try to divide the cluster equally among users
* keep all of the cluster’s processors as busy as possible all of the time

To do this, we primarily use three main queues/partitions called ``short``, ``medium`` and ``long`` (referring to their runtime), with ``medium`` being the default queue that jobs will go to unless you specify otherwise:

.. list-table::
   :widths: 10 10 25 20 60
   :header-rows: 1

   * - Queue
     - CPUs
     - Max RAM
     - Time Limit
     - Description
   * - ``short``
     - 384
     - 192 GB
     - 6 hours
     - This is a high priority queue for smaller jobs with thresholds set to allow smaller jobs to squeeze through that might have to wait in the other queues
   * - ``medium``
     - 768
     - 192 GB
     - 24 hours
     - This is the default queue that all jobs will submit to unless otherwise requested
   * - ``long``
     - 2,032
     - 192 - 384 GB
     - No limit
     - This queue is for long running jobs

There are also two special queues that should only be used for jobs that require large amounts of memory or access to :doc:`gpu`:


.. list-table::
   :widths: 10 10 25 20 60
   :header-rows: 1

   * - Queue
     - CPUs
     - Max RAM
     - Time Limit
     - Description
   * - ``himem``
     - 296
     - 1.5 - 3.0 TB
     - No limit
     - This queue is for jobs requiring a very large amount of RAM
   * - ``gpu``
     - 48
     - 70 GB
     - No limit
     - This queue is for jobs requiring GPUs

.. important::
  If you have a job that will last more than 21 days, we ask that you :doc:`contact-us` beforehand to discuss its requirements. We reserve the right to **terminate any long running job** that we believe is negatively affecting the cluster, running inefficiently, and/or impacting other users.

.. note::
  All queues run with the same priority across all nodes. Only the time limits differ, with the ``short`` and ``medium`` queues automatically killing a job if it exceeds their limits. GPUs can only be accessed from the ``gpu`` queue, and large RAM requests can only run on the ``himem`` queue.

.. note::
  The maximum amount of memory you can request (per node) will be a few GB less than shown above, because Slurm reserves some allocation for the rest of the operating system.

Specifying queues
-----------------

.. note::
  No special options are required to submit to the ``medium`` queue.

To submit to the ``short`` queue, use::

  sbatch --partition=short myscript.sh

Or to submit to the ``long`` queue, use::

  sbatch --partition=long myscript.sh

To submit to the high memory (``himem``) queue, use::

  sbatch --partition=himem myscript.sh

To submit to the ``gpu`` queue, where ``n`` specifies how many GPUs you want to use::

  sbatch --partition=gpu --gpus=[n] myscript.sh

For more details on accessing the GPUs, see :doc:`gpu`.

To get a job list for an individual queue rather than all queues, use the ``-p`` or ``--partition`` option for ``squeue``, for example::

  squeue --partition=short

Fair share policy
-----------------

The cluster uses a fair share policy that is applied according to computational time (ie time is allocated fairly with all users having equal share).

When you submit your first job it'll go to the end of the queue, but the scheduler will quickly move it higher up the queue if other users with jobs running also have waiting jobs ahead of you in that queue. This is because Slurm attempts to divide the available CPUs equally among all users (our fair-share policy). For example, if user A has multiple jobs queued and running, and then user B queues new jobs, those new jobs will rise in priority above some of A’s jobs until the number of running jobs is approximately shared equally between the two users (although B’s jobs may still have to wait until some of the previous jobs finish).

These rules apply to both interactive and sbatch jobs.


Additional advice and guidance
------------------------------

Below are some additional questions you may have about using the cluster in a sensible - and fair - manner. Don't hesitate to :doc:`contact-us` if you're unsure though.

Can I use the entire cluster at once?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It depends.

While there are currently no limits to prevent you from submitting a job that uses every CPU across one or more queues, you first need to ask yourself how sensible that would be? Consider:

- how long the job will last? Short running tasks allow others' jobs to rise in priority above yours (the fair-share policy), so submitting a 10,000 jobs that only last a few minutes each will 'hog' the cluster much less than just a few tens or hundreds of jobs that last for hours and hours.
- how busy is the cluster? If it's 2am and no-one else is using the cluster, then it's less likely to be detrimental to anyone else.
- how much you value your friendship with other cluster users? Seriously. This is a shared resource, and while it's here to be used, it's not here to be abused.


Which queue/partition should I use?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It depends.

Based purely on historical observation and anecdotal evidence, a significant number of jobs seem to complete OK within 24 hours (so the default medium queue is probably fine), but obviously the bigger your job or data sets that you want to process, the more likely it is to overrun and therefore be safer on the long queue. However, if the long queue is busy, you may then have to wait longer for your job to start. Note though, that each task of an array job has its own time allocation, so you could still successfully run a week-long job on the medium queue if each of its subtasks completes in less than 24 hours.

If it's an interactive job, then you're probably better off running it on the short queue.


Where should I write data to?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It depends.

During a job, you should almost always be writing output data to one of the scratch locations, however there's a choice of storage locations each with their own pros and cons:

Shared network **BeeGFS scratch space** (``$SCRATCH`` or ``/mnt/shared/scratch/$USER``) is accessible from any node and may be where your data is already residing. It's a parallel storage array and reasonably fast when dealing with very large sequential reads or writes - so great for stream reading from multiple large .bam files for instance - but not so good if your job has to read or write hundreds or millions of very tiny files. As part of the main storage array it also has plenty of free space.

**Node-specific scratch space** (``$TMPDIR``) is local to each node and uses an array of SSDs for performance so it can be much faster than BeeGFS for certain use cases, but each node's capacity is limited (see :doc:`system-overview` for details) and you need to copy your data there first.

.. note::
  ``$TMPDIR`` is automatically created - and destroyed! - as part of a job submission, so it's up to you to copy any input data here as the first step of an sbatch submission, and to copy data out again at the end.


How much CPU/memory should I allocate to a job?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It depends.

Although ``gruffalo`` can automatically manage and prioritise jobs well - most of the time - you still need to ensure sensible job-allocation requests are made.

Try to avoid submitting jobs that lock out too much of the cluster at once, either by using too many CPUs simultaneously for an excessive amount of time, or by requesting resources far beyond those actually used (eg asking for 16 CPUs for a process that only uses one for the majority of its runtime, or 100 GB of memory for a job that only uses a fraction of that). Over-allocation of resources negatively affects both other users and additional jobs of your own.

However, if you under-allocate on memory, the cluster will kill jobs that try to go beyond their requested allocation. It may therefore be tempting to just over-allocate everything for every job, asking for all the CPUs or all the memory, but this is easily spotted and we'll take action if we notice your jobs continually requesting resources significantly beyond what they're using. Jobs requesting more resources also tend to take longer to run as they must wait until all those resources become available if the cluster is busy. It may just take a little trial and error until you get confortable with how much to request for a given job or data set.

Finally, you should also take :doc:`green-computing` into account. A single node running 32 tasks uses **far less energy** than 32 nodes running 1 task each. If you over-allocate resources, then more nodes need to be online to meet your requirements, which wastes power if they're not being used effectively.
