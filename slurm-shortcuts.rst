Slurm - Shortcuts and Aliases
=============================

Some of the Slurm commands can be a little clunky, especially if you start modifying their display output (using the ``-o`` parameter that many of them support), so to help you out, we've created these additional aliases and shortcuts that are available systemwide for everyone to use.

srsh
~~~~

Starts a *remote shell* (ie, an interactive job) on a compute node. This is equivalent to ``srun --pty bash`` but still allows for providing additional resource parameters (queue, cpus, etc), which wouldn't be accepted by a normal alias in this specific use case::

  $ srsh --partition=short

snodes
~~~~~~

Lists the current state of the nodes, but with additional CPU allocation information (allocated/idle/other/total). This is equivalent to ``sinfo -o '%24N %.6D %.9P %.6t %.14C' -N``::

  $ snodes
  NODELIST                  NODES PARTITION  STATE  CPUS(A/I/O/T)
  n19-04-008-cortana            1     debug   idle        0/4/0/4
  n19-32-192-ghost              1     short   idle      0/64/0/64
  n19-32-192-groot              1     short   idle      0/64/0/64
  ...

sjobacct
~~~~~~~~

Provides historical post-job information (memory and CPU usage) for a job (with the ``-j <jobID>``) or all recent jobs if no arguments are given. This is equivalent to ``sacct --format=JobId,ReqMem,MaxRSS,AllocCPUS,TotalCPU,State,Elapsed --units=G``::

  $ sjobacct -j 1000
         JobID     ReqMem     MaxRSS  AllocCPUS   TotalCPU      State    Elapsed
  ------------ ---------- ---------- ---------- ---------- ---------- ----------
  630_369          3.91Gn                    32  00:00.026  COMPLETED   00:01:01
  630_369.bat+     3.91Gn      0.00G         32  00:00.025  COMPLETED   00:01:01
  630_369.ext+     3.91Gn      0.00G         32   00:00:00  COMPLETED   00:01:01

sjobstat
~~~~~~~~

Provides (limited) information on the maximum memory use of an active job. This is equivalent to ``sstat --format=JobId,MaxRSS``::

  $ sjobstat -j 1000
         JobID     MaxRSS
  ------------ ----------
  637874.0         11580K
