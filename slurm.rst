Slurm
=====

Cluster jobs are managed using the **Slurm Workload Manager** (https://slurm.schedmd.com/).

Slurm is responsible for accepting, scheduling, dispatching, and managing the execution of jobs submitted to the cluster. At the most basic level, you put the commands you want to run into a script file, submit that script to the cluster's queue (of jobs), and Slurm will then select a node for it to run on once it reaches the front of the queue. There is also the capability to run interactive sessions on a node.

Once you have logged into ``gruffalo`` using ssh you are connected to the login server. To carry out any computational work you now need to request either than interactive session or a batch job using SLURM, so that the computationally intensive workloads all run on the compute nodes and not on the login server itself.

.. important::
  All data analysis programs and computational workloads **must** be run on the compute nodes through SLURM and not directly on the login server - ``gruffalo`` - as it does not have the resources to support heavy workloads. Failure to follow this procedure may negatively affect others users of the system, disrupt the functioning of the HPC itself and result in your programs and / or account being suspended by the administrators.

Choosing a job partition (queue)
--------------------------------

SLURM is configured to allow requests to be made to one of three different job queues, called partitions by SLURM, each of which has slightly different rules about what jobs or sessions can be run and which compute nodes they can run on. The ``short`` partition allows jobs of up to 1 hour, the ``medium`` partition allows jobs of up to 1 day, and the ``unlimited`` queue has no time limit. There are also limitations on which nodes can be access from which partition and whether interactive sessions are available or not. You should therefore make sure the partition you are requesting is suitable for the job you are running.

To identify what resources are currently available use SLURM's sinfo command, which will list the available compute nodes::

  $ sinfo

With no options added this command will show the following type of output::

  PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
  unlimited    up   infinite      1    mix compute02
  unlimited    up   infinite      1  alloc compute01
  unlimited    up   infinite      2   idle compute[03-04]
  medium       up 1-00:00:00      1    mix compute02
  medium       up 1-00:00:00      1  alloc compute01
  medium       up 1-00:00:00      3   idle compute[03-05]
  short*       up    1:00:00      1    mix compute02
  short*       up    1:00:00      1  alloc compute01
  short*       up    1:00:00      4   idle compute[03-06]

The compute nodes are listed against the partition(s) they can be accessed from. It also shows the partition time limits and the number of nodes broken down by whether they are completely unused (shown as "idle"), partially used by running jobs (mix) or completed occupied (alloc). Additional information about the compute nodes is available by giving further options to the command, such as the following command::

  $ sinfo -o "%20P %5D %6t %8z %10m %11l %N"

This will add a column called S:C:T for sockets, cores and threads on each node. The total number of available CPUs is the product of these three numbers: CPUs=sockets*cores*threads. SLURM is configured to manage each thread as a separate "CPU" for the purposes of resource allocation. It will also show the total node memory in megabytes. Further information is available using::

 $ scontrol show nodes | less

This will produce a detailed scrollable list which you can exiting by pressing q. Each node is listed separately showing CPUTot (total CPUS), CPUAlloc (how many are currently busy), FreeMem (unused memory) and AllocMem (memory currently in use) etc.

Monitoring Running Jobs
-----------------------
To see what jobs are currently running or queuing use the squeue command::

  $ squeue

The output shows the following columns::

  JOBID       a unique number identifying the job
  PARTITION   which partition (queue) the job is in
  NAME        the job's name
  USER        which user submitted the job
  ST          job state:
    PD (pending)
    R (running)
    CA (cancelled)
    CF (configuring)
    CG (completing)
    CD (completed)
    F (failed)
    TO (timeout)
    NF (node failure)
    SE (special exit state)
  TIME        how long it's been running for
  NODES       how many nodes it's been allocated
  NODELIST    list of nodes it's running on
  (REASON)    or the reason it's not yet able to run

To see just your own jobs use::

  $ squeue -u <username>

Where ``<username>`` is your actual username.

Running an interactive session using default a resource allocation use the following command::

  $ srun --pty bash

If resources are not immediately available the command will abort, otherwise you will be logged into a compute node using a default resource allocation available. Please remember to type exit top log out when done.

To request a specific set of resources use the following type of command::

  $ srun --partition medium --time 0-02:00:00 --mem 10G --cpus-per-task 10 --pty bash

In this example we request the medium partition with a maximum session time of 2 hours (the time format is DAYS-HOURS:MINUTES:SECONDS), 10 gigabytes of memory (use K for kilobytes, M for megabytes, G for gigabytes and T for terabytes), and 10 CPUs (ie threads). SLURM has the concept of tasks, which can be useful when running MPI jobs, but are often not required for common bioinformatics jobs, therefore we have not requested multiple tasks and implicitly accepted the default of a single task. Therefore 10 CPUs per task means we have simply have 10 CPUs in total (there is no plain --cpus option in SLURM).

