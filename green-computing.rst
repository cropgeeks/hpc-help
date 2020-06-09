Green Computing
===============

Green computing is the environmentally responsible and eco-friendly use of computers and their resources.

We have attempted to *greenify* our compute cluster by allowing idle nodes to power down when not in use, **saving energy** by lowering the electrical demand of the cluster, which in turn reduces load on its cooling systems, saving yet more energy and hence money. 

By intelligently monitoring job submissions, nodes can be automatically powered up again as and when they are needed.

.. note::
  This is still an experimental service, so please :doc:`contact-us` to report any problems or issues.


How to tell if a node is powered down
-------------------------------------

You can see which nodes are powered down by visiting https://cropdiversity.ac.uk/top or by querying Slurm::

  $ sinfo -N
  NODELIST                  NODES PARTITION  STATE
  n19-04-008-cortana            1     debug   idle
  n19-32-192-ghost              1     short   idle
  n19-32-192-groot              1     short  idle~
  n19-32-192-hawkeye            1     short  idle~
  n19-32-192-hela               1   medium*    mix
  n19-32-192-hulk               1   medium*    mix

Nodes that are powered down, but still available for running jobs, show as ``idle~``.

You may also see the following characters listed against node states in relation to power saving features:

- ``#`` the node is powering up or being configured
- ``%`` the node is powering down


When will nodes power down?
---------------------------

Nodes will power down fifteen minutes after their last job completes.


When will nodes power up?
-------------------------

A node will power up as soon as Slurm allocates a job to it.

It takes 3 or 4 minutes for a node to resume operation, so any jobs assigned to it won't start until it's ready. ``squeue`` may show your job's status as ``CF`` (configuring) during this process.

- **Batch jobs** - if you've submitted a batch job, then you don't need to do anything different; it'll queue and start once the node is ready
- **Interactive jobs** - if you've submitted an interactive job, your terminal prompt waits (for 3 or 4 minutes) until the node powers up, then logs you in

.. warning::
  Very occasionally, an interactive job may start before the node completes its network mappings (you'll see a ``bash-4.4$`` prompt if so) and if this happens, it's better to log off/cancel the job and resubmit.



How much energy will this save?
-------------------------------

The answer to that very much depends on what the cluster is doing. If it's busy most of the time - with nodes allocated and processing jobs - then it won't make much of a difference, but if nodes are idle for long periods of time (eg overnight or at weekends) then the potential for energy savings are obviously greater.

At the time of writing (June 2020) the cluster uses about 6 kW of energy just to be on, doing nothing, with approximately 4.5 kW being used by the compute nodes. For each node that is powered down, we can save at least 0.85 kW, which adds up to a kilowatt of energy - per node - every 12 hours or so.
