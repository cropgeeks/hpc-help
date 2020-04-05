Tools & Applications
====================

In addition to the usual selection of Linux and Bash utilities (tar, wget, rsync, htop, pigz, etc) the following applications are available system-wide:

- Development tools and compilers (git, svn, gcc, etc) - see :doc:`compiling`
- :doc:`openmpi`
- :doc:`singularity`
- Slurm - see :doc:`slurm-overview`

In general though, and in order to keep the cluster lean and mean, we *don't* system install applications (or libraries) as it's easier for users to manage their own specific needs using tools like :doc:`bioconda` and :doc:`singularity`, however for cases where this isn't possible we still aim to make certain applications available (usually under ``/mnt/shared/apps``) where they're visible to all nodes of the cluster.

.. note::
  To run applications not located on the default path, you must provide the full path to the executable in question, eg ``/mnt/shared/apps/java/13.0.2/bin/java``. This is usually the case when multiple versions exist.

Aspera
------

- ``/mnt/shared/apps/aspera/3.9.2``
- On default path: ``yes``

The **Aspera** client can be used to efficiently download very large data sets from remote clients (often sequencing centres).

Bioconda
--------

- ``$APPS/conda`` (once installed)
- On default path: ``yes``

:doc:`bioconda` is a package manager that specializes in providing bioinformatics software. We have a custom install script to handle its installation for you which can be run using::

  $ install-bioconda

.. warning::
  In order to maintain compatibility with the system's backup and data policies, you should not attempt to install Bioconda using any other method than the script listed above.

Databases
---------

- ``/mnt/shared/apps/databases``
- On default path: ``n/a``

We maintain several popular bioinformatics :doc:`database-mirrors` which are accessible over the high-performance storage network from any node in the cluster.

Java
----

- ``/mnt/shared/apps/java``
- On default path: ``no``

Updated versions of the **Java JDK** are available here. CentOS 8 ships with JDK 8 by default, although you can also get other versions via :doc:`bioconda` too.
