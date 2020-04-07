Slurm - Shortcuts and Aliases
=============================

Some of the Slurm commands can be a little clunky, especially if you start modifying their display output (using the ``-o`` parameter that many of them support), so to help you out, we've created these additional aliases and shortcuts that are available systemwide for everyone to use.

srsh
~~~~

Starts a *remote shell* (ie, an interactive job) on a compute node. This is equivilent to ``srun --pty bash`` but still allows for providing additional resource parameters (queue, cpus, etc), which wouldn't be accepted by a normal alias in this specific use case::

  $ srsh --partition=short

snodes
~~~~~~

Lists the current state of the nodes, but with additional CPU allocation information (allocated/idle/other/total). This is equivilent to ``sinfo -o '%24N %.6D %.9P %.6t %.14C' -N``::

  $ snodes
  NODELIST                  NODES PARTITION  STATE  CPUS(A/I/O/T)
  n19-04-008-cortana            1     debug   idle        0/4/0/4
  n19-32-192-ghost              1     short   idle      0/64/0/64
  n19-32-192-groot              1     short   idle      0/64/0/64
  ...
