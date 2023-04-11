Green Computing
===============

Green computing attempts to lower the carbon footprint of computing via environmentally responsible and eco-friendly use of computers and their resources.

.. centered::
  |logo|

.. |logo| image:: media/green-computing.png

We have attempted to *greenify* our compute cluster by allowing idle nodes to power down when not in use, **saving energy** by lowering the electrical demand of the cluster, which in turn reduces load on its cooling systems, saving yet more energy and hence money. 

By intelligently monitoring job submissions, nodes can be automatically powered up again as and when they are needed.

.. important::
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


When will nodes power up/down?
------------------------------

Nodes power down **fifteen minutes** after their last job completes, but power up again **whenever** Slurm allocates them a new job.

It takes 3 or 4 minutes for a node to resume operation, and jobs obviously won't start running on it until it's ready. ``squeue`` may show your job's status as ``CF`` (configuring) during this process.

- **Batch jobs** - if you've submitted a batch job, then you don't need to do anything different; it'll queue and start once the node is ready
- **Interactive jobs** - if you've submitted an interactive job, your terminal prompt waits (for 3 or 4 minutes) until the node is ready, then logs you in


How much energy will this save?
-------------------------------

The answer to that very much depends on what the cluster is doing. If it's busy most of the time - with nodes allocated and processing jobs - then it won't make much of a difference, but if nodes are idle for long periods of time (eg overnight or at weekends) then the potential energy savings are obviously greater.

.. note::
  You can see live metrics (showing our savings so far) by visiting https://cropdiversity.ac.uk/top.


Our commitment to Green Computing
---------------------------------

In addition to the policy outlined above, when specifying and building the cluster we attempted to select processors with excellent *performance per watt* metrics, which improves the general efficiency of the HPC.

The vast majority of the compute nodes also use special four-node chassis units that allow power and cooling to be shared between the nodes, further reducing the energy demands of the cluster.

Finally, the `James Hutton Institute <https://www.hutton.ac.uk>`_, where the Crop Diversity HPC is located, only sources electricity that is backed by Renewable Energy Generation Obligation (REGO) certificates. This is a scheme that supports mechanisms for large-scale renewable electricity projects in the UK.

What can I do to help?
----------------------

How you allocate and run jobs also has an impact on how energy efficient the system can be.

- **Don't over allocate resources** - a single node running 32 tasks uses far less energy than 32 nodes running 1 task each, so if you over-allocate resources then more nodes need to be online to meet your requirements, ultimately wasting energy.
- **Don't leave idle interactive jobs running** - nodes can only be fully powered down when all their jobs are finished, which can't happen if you've started an interactive job and left it idle after your task is finished.


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
