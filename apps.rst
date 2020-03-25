Tools & Applications
====================

In general, we don't install many applications (or libraries) system-wide as it's easier for users to manage their own specific needs using tools like :doc:`bioconda` and :doc:`singularity`, however for cases where this isn't possbile we aim to make certain applications (usually available under ``/mnt/shared/apps``) where they will be visible to all nodes of the cluster.


Aspera
------

``/mnt/shared/apps/aspera/3.9.2``

The **Aspera** client can be used to efficiently download very large data sets from remote clients (often sequencing centres).

Bioconda
--------

``$APPS/conda`` (once installed)

:doc:`bioconda` is a package manager that specializes in providing bioinformatics software. We have a custom install script to handle its installation for you which can be run using::

  $ install-bioconda

.. warning::
  In order to maintain compatibility with the system's backup and data policies, you should not attempt to install Bioconda using any other method than the script listed above.

Databases
---------

``/mnt/shared/apps/databases``

We maintain several popular bioinformatics :doc:`database-mirrors` which are accessible over the high-performance storage network from any node in the cluster.

Java
----

``/mnt/shared/apps/java``

Updated versions of the **Java JDK** are available here. CentOS 8 ships with JDK 8 by default, although you can also get other versions via :doc:`bioconda` too.
