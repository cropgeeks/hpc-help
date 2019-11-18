Slurm
=====

Cluster jobs are managed using the **Slurm Workload Manager** (https://slurm.schedmd.com/).

Slurm is responsible for accepting, scheduling, dispatching, and managing the execution of jobs submitted to the cluster. At the most basic level, you put the commands you want to run into a script file, submit that script to the cluster's queue (of jobs), and Slurm will then select a node for it to run on once it reaches the front of the queue. There is also the capability to run interactive sessions on a node.

Once you have logged into ``gruffalo`` using ssh you are connected to the login server. To carry out any computational work you now need to request either than interactive session or a batch job using SLURM, so that the computationally intensive workloads all run on the compute nodes and not on the login server itself.

.. important::
  All data analysis programs and computational workloads **must** be run on the compute nodes through SLURM and not directly on the login server - ``gruffalo`` - as it does not have the resources to support such work. Failure to follow this procedure may negatively affect others users of the system, disrupt the functioning of the HPC itself and result in your programs and / or account being suspended by the administrators.

Choosing a job partition (queue)
--------------------------------

SLURM is configured to allow requests to be made to one of three different job queues, called partitions by SLURM, each of which has slightly different rules about what jobs or sessions can be run and which compute nodes they can run on. The ``short`` partition allows jobs to run of up to 1 hour, the ``medium`` partition allows jobs of up to 1 day, and the ``unlimited`` queue has no time limit.

To identify what resources are currently available use SLURM's sinfo command, which will list the available compute nodes and which partition(s) they can be accessed from:

  $ sinfo

With no options added this command will show the following type of output:

  $ PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
  $ unlimited    up   infinite      1    mix compute02
  $ unlimited    up   infinite      1  alloc compute01
  $ unlimited    up   infinite      2   idle compute[03-04]
  $ medium       up 1-00:00:00      1    mix compute02
  $ medium       up 1-00:00:00      1  alloc compute01
  $ medium       up 1-00:00:00      3   idle compute[03-05]
  $ short*       up    1:00:00      1    mix compute02
  $ short*       up    1:00:00      1  alloc compute01
  $ short*       up    1:00:00      4   idle compute[03-06]

