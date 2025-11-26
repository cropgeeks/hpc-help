Backups
=======

In addition to primary storage, the cluster has an additional 2.3 PB of capacity dedicated to storing backups.

.. important::
  Storage is expensive, and syncing backups is time consuming, so please read the :doc:`data-storage` and ensure your data is kept in the appropriate locations.


Retention policies
------------------

New or changed data is synced nightly to our backup servers - ``delorean`` and ``docbrown`` - and then snapshots are taken and kept for as long as the policy for that data dictates.

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


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>

