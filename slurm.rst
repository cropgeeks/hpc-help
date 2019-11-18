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

Viewing the Current Job Queues
------------------------------
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

Requesting an Interactive Session
---------------------------------
To run an interactive SLURM session with a default resource allocation use the following command::

  $ srun --pty bash

If the resources are not immediately available the command will abort, otherwise you will be logged into a compute node using a default resource allocation available. Please remember to type exit top log out when done.

To request a specific set of resources use the following type of command::

  $ srun --partition medium --time 0-02:00:00 --mem 10G --cpus-per-task 10 --pty bash

In this example we request the medium partition with a maximum session time of 2 hours (the time format is DAYS-HOURS:MINUTES:SECONDS), 10 gigabytes of memory (use K for kilobytes, M for megabytes, G for gigabytes and T for terabytes), and 10 CPUs (ie threads). SLURM has the concept of tasks, which can be useful when running MPI jobs, but are often not required for common bioinformatics jobs, therefore we have not requested multiple tasks and implicitly accepted the default of a single task. Therefore 10 CPUs per task means we simply have 10 CPUs in total (there is no plain --cpus option in SLURM).

Submitting a Job Script
-----------------------
Most long running jobs should be handled using a job script which is submitted to the appropriate partition using the sbatch command. Here is an example of a simple SLURM job script containing the resource request information inside the script itself::

  #!/usr/bin/env bash
  #SBATCH --partition=short
  #SBATCH --time=0-00:01:00
  #SBATCH --mem=1G
  #SBATCH --cpus-per-task=1
  echo Starting job...
  sleep 20
  echo Finished!

This is a normal bash shell script with the SLURM options inserted near the top using the #SBATCH prefix. The exact same options is were used with srun are available for SLURM scripts. In this case we asked for 1 minute of run time on the short partition with 1 gigabyte of meory and 1 CPU. After the SLURM options normal bash commands can be used. Assuming the script is saved to a file called slurm_script.sh in the current directory we would submit the script using:

  $ sbatch slurm_script.sh

Cancelling a Job
----------------
To cancel one of your jobs from the queue use scancel::

  $ scancel <jobid>

Where ``<jobid>`` is the job id number of your job.

Job Information During and After Completion
-------------------------------------------
In order to check on your job while running use the scontrol command::

  $ scontrol show job <jobid>

Which will show various details about jobs while they are running, such as the current memory usage and the time the job would be killed for overrunning its timelimit.

After a job has completed your can also use the sacct command::

  $ sacct -j <jobid>

Will show some basic information. For more details try::

  $  sacct -j <jobid> --format JobID,JobName,User,ReqMem,MaxVMSize,MaxRSS,NodeList,AllocCPUS,TotalCPU,State,Start,End

MaxRSS is the maximum real memory used by the job and MaxVMSize is the maximum it requested for itself but did not necessarily fill up, and includes any swap usage.

