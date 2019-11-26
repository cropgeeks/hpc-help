Data Storage & Management Policy
================================

.. warning
  Please note that this is an evolving policy and may change at any time.


Storage at-a-glance
-------------------
* The cluster has approximately 1.5 PB of storage available
* Most user-accessible folders are found under ``/mnt/shared``
* You must contact an administrator when starting a new project
* All important project data should be kept in ``/mnt/shared/projects``
* Intermediate working data should be kept on a **scratch** drive
* Please restrict data in ``/home`` to small and/or miscellaneous files; total usage here should be under 10 GB

You can check on your data usage using the :doc:`monitoring` page.


Data management
---------------

There are multiple storage tiers suitable for holding user data, so it's important that you pick the right one. Selecting the wrong option can negatively affect performance, available capacity, and backup policies, so choose wisely!

.. list-table::
   :widths: 25 25 25 25
   :header-rows: 1

   * - Storage tier
     - Path
     - Type
     - Use for
   * - Project data
     - ``/mnt/shared/projects``
     - networked (beegfs)
     - all primary data
   * - Non-project data
     - ``$HOME``
     - networked (beegfs)
     - random/misc files
   * - Shared scratch
     - ``/mnt/shared/scratch``
     - networked (beegfs)
     - temporary files
   * - Local scratch
     - ``/tmp``
     - local to node (ssd)
     - temporary files
   * - Applications
     - ``$APPS``
     - networked (beegfs)
     - software downloads

.. important::
  With multiple tiers of storage in use, it's important to be aware that only ``/mnt/shared/projects`` and ``$HOME`` are backed up. See the :doc:`backups` page for more details.

The variable storage tiers are described in more detail below.

  
Project data
~~~~~~~~~~~~

All important Institute-related project data should be stored in ``/mnt/shared/projects``.

This location holds subfolders for the :doc:`organizations` (eg ``/mnt/shared/projects/jhi``) and there may be further (local) guidelines on how you should structure your data below this point.

Please email ########## when starting a new project, or to request help with moving existing data into the correct folder structure.


Non-project data
~~~~~~~~~~~~~~~~

Everyone has a ``$HOME`` folder located at ``/home/<username>``. Although backed up, it's not suitable for storing large data sets and should be restricted to small and/or miscellaneous files only – perhaps common scripts you find handy across multiple projects or random files that don’t really "fit" anywhere else.

.. important::
  Your total usage within ``$HOME`` should be less than 10 GB.


Temporary data
~~~~~~~~~~~~~~

There are several temporary or "scratch" drive areas you can use.


Shared scratch
^^^^^^^^^^^^^^

``/mnt/shared/scratch`` - **visible to all nodes** - can be used for intermediate and/or working data, and especially for large throwaway files which either do not need to be kept or can easily be regenerated. A folder is created here automatically for each user; you can structure your data however you see fit.

.. note::
  ``/mnt/shared/scratch`` is part of the same BeeGFS filesystem as ``/home`` and ``/mnt/shared/projects``, so moving files between these locations should be super-quick.


Local scratch
^^^^^^^^^^^^^

``/tmp`` - **unique to each node** - can also be used for temporary data, and as this is local storage on the actual node where your job is running it'll be *significantly* faster for all file-based operations. The only downside is that you have to copy your data here first, and that might take longer than just running the job from shared scratch.

It's also important to be aware of the differences between local scratch drives, as the different nodes may have different capacities. Check the :doc:`system-overview` page for more details.

  
Applications
^^^^^^^^^^^^

``$APPS`` (which maps to ``/mnt/shared/scratch/<username>/apps`` is a special area that **must** be used for all downloaded (ie external) software applications – either in binary or compiled-from-source form. You can also store :doc:`singularity` containers here too.
  
.. tip::
  If something was a pain to install or compile, keep some notes about it in ``/home`` where they'll be safely backed up in case you ever need to repeat the process. 
