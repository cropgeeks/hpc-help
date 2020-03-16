Slurm Queue Policy
========================

Our Slurm setup runs with the following goals and constraints in mind:

* allow short jobs to run without having to wait more than a few hours
* do not permit many long jobs to take over the entire cluster for long periods
* try to divide the cluster equally among users
* keep all of the cluster’s processors as busy as possible all of the time

To do this, we use three queues/partitions:

.. list-table::
   :widths: 20 20 60
   :header-rows: 1

   * - Queue
     - Run-time Limit
     - Description
   * - ``short``
     - 6 hours   
     - This is a high priority queue for smaller jobs with thresholds set to allow smaller jobs to squeeze through that might have to wait in the other queues.
   * - ``medium``
     - 24 hours   
     - This is the default queue that all jobs will submit to unless otherwise requested.
   * - ``long``
     - No limit
     - This queue is for long running jobs.

Four nodes are dedicated to the short queue, eight to the medium, and all remaining nodes for the long queue.

.. note::
  All queues run with the same priority across all nodes. Only the time limits differ, with the short and medium queues automatically killing a job if it exceeds their limits.

In addition, Slurm attempts to divide slots equally among all users (our fair-share policy). For example, if user A has multiple jobs queued and running, and then user B queues new jobs, those new jobs will rise in priority above some of A’s jobs until the number of running jobs is approximately shared equally between the two users (although B’s jobs may still have to wait until some of the previous jobs finish).


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
  

.. important::

  Although gruffalo can automatically manage and prioritise jobs well - most of the time - you still need to ensure sensible job-allocation requests are made. Try to avoid submitting jobs that lock out the cluster, either by using too many slots simultaneously for an excessive amount of time, or by requesting resources far beyond those actually used (eg asking for 16 slots for a process that only uses 1 for the majority of its runtime or 100GB of memory for a job that only uses a fraction of that).
