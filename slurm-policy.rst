Slurm - Queue Policies & Advice
===============================

Our Slurm setup runs with the following goals and constraints in mind:

* allow short jobs to run without having to wait more than a few hours
* do not permit many long jobs to take over the entire cluster for long periods
* try to divide the cluster equally among users
* keep all of the cluster’s processors as busy as possible all of the time

To do this, we use three queues/partitions:

.. list-table::
   :widths: 20 20 20 60
   :header-rows: 1

   * - Queue
     - CPUs
     - Run-time Limit
     - Description
   * - ``short``
     - 256
     - 6 hours   
     - This is a high priority queue for smaller jobs with thresholds set to allow smaller jobs to squeeze through that might have to wait in the other queues.
   * - ``medium``
     - 512
     - 24 hours   
     - This is the default queue that all jobs will submit to unless otherwise requested.
   * - ``long``
     - 1,024
     - No limit
     - This queue is for long running jobs.

Four nodes are dedicated to the short queue, eight to the medium, and all remaining nodes for the long queue.

.. note::
  All queues run with the same priority across all nodes. Only the time limits differ, with the short and medium queues automatically killing a job if it exceeds their limits.


Specifying queues
-----------------

.. note::
  No special options are required to submit to the medium queue.
  
To submit to the short queue, use::

  sbatch --partition=short myscript.sh
  
Or to submit to the long queue, use::

  sbatch --partition=long myscript.sh

To get a job list for an individual queue rather than all queues, use the ``-p`` or ``--partition`` option for ``squeue``, for example::

  squeue --partition=short


Fair share policy
-----------------

The cluster uses a fair share policy that is applied according to computational time (ie time is allocated fairly with all users having equal share).

When you submit your first job it'll go to the end of the queue, but the scheduler will quickly move it higher up the queue if other users with jobs running also have waiting jobs ahead of you in that queue. This isbecause Slurm attempts to divide slots equally among all users (our fair-share policy). For example, if user A has multiple jobs queued and running, and then user B queues new jobs, those new jobs will rise in priority above some of A’s jobs until the number of running jobs is approximately shared equally between the two users (although B’s jobs may still have to wait until some of the previous jobs finish).

These rules apply to both interactive and sbatch jobs.


Additional advice and guidance
------------------------------

Below are some additional questions you may have about using the cluster in a sensible - and fair - manner. Don't hesitate to :doc:`contact-us` if you're unsure though.

Can I use the entire cluster at once?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It depends.

While there are currently no limits to prevent you from submitting a job that uses every CPU across one or more queues, you first need to ask yourself how sensible that would be? Consider:

- how long the job will last? Short running tasks allow others' jobs to rise in priority above yours (the fair-share policy), so submitting a million jobs that only last a few minutes each will 'hog' the cluster much less than just a few tens or hundreds of jobs that last for hours and hours.
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

Try to avoid submitting jobs that lock out too much of the cluster at once, either by using too many slots simultaneously for an excessive amount of time, or by requesting resources far beyond those actually used (eg asking for 16 slots for a process that only uses 1 for the majority of its runtime, or 100GB of memory for a job that only uses a fraction of that). Over-allocation of resources negativily affects both other users and additional jobs of your own.

However, if you under-allocate, the cluster will kill jobs that go beyond their requested allocation, eg, if you ask for 4 cores but use 8, your job will be killed. It may therefore be tempting to just over-allocate everything for every job, asking for all the CPUs or all the memory, but this is easily spotted and we'll take action if we notice user jobs requesting all resources but not using them. It may just take a little trial and error until you get confortable with how much to request for a given job or data set.
