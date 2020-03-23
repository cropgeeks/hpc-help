Tools & Applications
====================

In general, we don't install many applications (or libraries) system-wide as it's easier for users to manage their own specific needs using tools like :doc:`bioconda` and :doc:`singularity`, however for cases where this isn't possbile we aim to make certain applications available under ``/mnt/shared/apps`` where they will be visible to all nodes of the cluster.


Aspera
------

``/mnt/shared/apps/aspera/3.9.2``

The **Aspera** client can be used to efficiently download very large data sets from remote clients (often sequencing centres).

Bioconda
--------

``/mnt/shared/apps/conda/install-bioconda``

Although installed separately for each user, :doc:`bioconda` has a custom install script to handle its installation for you which can be run using::

  $ install-bioconda

.. warning::
  In order to maintain compatibility with the system's backup and data policies, you should not attempt to install Bioconda using any other method than the script listed above.

Databases
---------

``/mnt/shared/apps/databases``

We maintain several popular bioinformatics :doc:`database-mirrors` which are accessible over the high-performance storage network from any node in the cluster.
