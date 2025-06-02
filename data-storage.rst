Data Storage & Management Policy
================================

.. warning
  Please note that this is an evolving policy and may change at any time.


Storage at-a-glance
-------------------
* The cluster has approximately 5.2 PB of storage available
* Most user-accessible folders are found under ``/mnt/shared``
* You may need to contact an administrator when starting a new project
* All important project data should be kept in ``/mnt/shared/projects``
* Intermediate working data should be kept on a **scratch** drive
* Please restrict data in ``/home`` to small and/or miscellaneous files; total usage here should be under 15 GB

You can check your current data usage using the :doc:`monitoring` page.


Data management
---------------

There are three main locations for storing data on the system:

- NFS shared network storage
- BeeGFS shared network storage
- Node-specific local scratch storage

Where you decide to store data will have an effect on performance, available capacity, and backup policies, so it's important that you understand the differences between the storage locations and the folders they contain. These are described in more detail below.

.. note::
  Many of the locations listed here are automatically added (as symlinks) to your home folder.


NFS storage
-----------

This is a small array of fast, NFS-based storage that offers **35 TB** of capacity. Visible from all nodes of the cluster, it hosts the following areas:


User home folders
~~~~~~~~~~~~~~~~~

- **Path:** ``/home/<username>``
- **Shortcut:** ``$HOME``
- **Backed up:** yes

This is where your home folder is located (your Linux equivalent of *My Documents* on Windows). Athough backed up, it's not suitable for storing large data sets and should be restricted to small and/or miscellaneous files only – perhaps common scripts you find handy across multiple projects or random files that don’t really "fit" anywhere else.

We'd appreciate it if your total usage within ``$HOME`` can be kept to less than 15 GB.

.. warning::
  If you store more than 250,000 files or folders in ``$HOME`` you won't be able to run more than three jobs simultaneously. If you store over 1 million files or folders, the limit reduces to just one.


User applications
~~~~~~~~~~~~~~~~~

- **Path:** ``/mnt/apps/<username>``
- **Shortcut:** ``$APPS``
- **Backed up:** no

This is a special area that **must** be used for all downloaded (ie external) software applications – either in binary or compiled-from-source form. You can also store :doc:`singularity` containers here. If you install :doc:`bioconda`, it uses ``$APPS/conda`` for its data.
  
.. tip::
  If something was a pain to install or compile, keep some notes about it in ``/home`` where they'll be safely backed up in case you ever need to repeat the process. 


BeeGFS storage
--------------

The cluster's primary storage is a high-performance parallel file system running **BeeGFS**. This system, dsitributed across multiple servers and disk arrays, has **5.2 PB** of capacity offered as a single global namespace - ``/mnt/shared`` - that is visible from all nodes of the cluster.

It holds the following data:


Project data
~~~~~~~~~~~~

- **Path:** ``/mnt/shared/projects``
- **Shortcut:** ``$PROJECTS``
- **Backed up:** yes

All important Institute-related project data should be stored in ``/mnt/shared/projects``.

The Projects folder holds subfolders for the :doc:`organizations` (eg ``/mnt/shared/projects/jhi``) and there may be further (local) guidelines on how you should structure your data below this point.

Joint projects shared between multiple institutes are located in ``/mnt/shared/projects/joint``. Please :doc:`contact-us` if working on a joint project and access by multiple users is required.

.. warning::
  If you store more than 250,000 files or folders in ``$PROJECTS`` you won't be able to run more than three jobs simultaneously. If you store over 1 million files or folders, the limit reduces to just one.
  

Shared scratch
~~~~~~~~~~~~~~

- **Path:** ``/mnt/shared/scratch``
- **Shortcut:** ``$SCRATCH``
- **Backed up:** no

This area should be used for all intermediate and/or working data, and especially for large throwaway files which either do not need to be kept or can easily be regenerated. A folder is created here automatically for each user; you can structure your data below that however you see fit.

.. important::
  We do not have the capacity to maintain backups of intermediate/working data so it is **very important** that you store this kind of data on scratch.

It's also worth noting - especially when running large or complex jobs - that job performance can be significantly enhanced if you store scratch data using node-specific scratch storage instead. Despite its high-performance, BeeGFS is still a networked filesystem and certain file operations (particularly those involving high numbers of small files) will almost always perform better using local scratch space.

.. important::
  ``$SCRATCH`` is auto purged of all files and folders older than 180 days' old, once per month. You can use a tool like ``touch`` to update timestamps, but note that continual abuse of this facility to make ``$SCRATCH`` a permanent location for storage is unfair to others. Your usage is monitored and you **will** lose your privilege to use the service as a result.


Local scratch
-------------

Each node also has space for temporary working data, and because it's directly attached to the node where your job is running it can be *significantly* faster for most file-based operations. The only downside is that you may have to copy your data here first, and that might take longer than just running the job from shared scratch, although often you can leave your input files on shared scratch and only produce new output on local scratch. Either way, you'll need to remember to copy any results back to shared storage at the end of a job's run.

- **Path:** *dynamically generated*
- **Shortcut:** ``$TMPDIR``
- **Backed up:** no

.. note::
  The path for this location is only generated (and accessible via the ``$TMPDIR`` environment variable) once a Slurm job has started, and is unique to that job. 

.. warning::
  Bear in mind that these scratch drives are unique per node, which means any data stored there can only be seen by that node. The contents are automatically erased when the job ends, so you *must* copy any files you need to keep back to somewhere on shared storage as the final step in your job script.

It's also important to be aware of the differences between local scratch drives, as the different nodes may have different capacities. Check the :doc:`system-overview` page for more details.


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
