Slurm - Shortcuts and Aliases
=============================

Some of the Slurm commands can be a little clunky, especially if you start modifying their display output (using the ``-o`` parameter that many of them support), so to help you out, we've created these additional aliases and shortcuts that are available systemwide for everyone to use.

srsh
~~~~

Starts a *remote shell* (ie, an interactive job) on a compute node. This is equivilent to ``srun --pty bash`` but still allows for providing additional resource parameters (queue, cpus, etc), which wouldn't be accepted by a normal alias in this specific use case::

  $ srsh --partition=short
