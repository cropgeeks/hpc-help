Backups
=======

In addition to the 1.5 PB of primary storage, the cluster has an additional 1.0 PB of capacity dedicated to storing backups.

.. important::
  Storage is expensive, and syncing backups is time consuming, so please read the :doc:`data-storage` and ensure your data is kept in the appropriate locations.


Retention policies
------------------

New or changed data is synced nightly to our backup server - ``delorean`` - and then snapshots are taken and kept for as long as the policy for that data dictates.

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Location
     - Policy
   * - ``/mnt/shared/projects``
     - 30 daily snapshots and 12 monthly snapshots
   * - ``$HOME``
     - 30 daily snapshots


Restoring backups
-----------------

Please :doc:`contact-us` with all queries regarding restoring data from backup.
