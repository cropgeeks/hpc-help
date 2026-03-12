Backups
=======

In addition to primary storage, the cluster has an additional 2.3 PB of capacity dedicated to storing backups.

.. important::
  Storage is expensive, and syncing backups is time consuming, so please read the :doc:`data-storage` and ensure your data is kept in the appropriate locations.

.. warning::
  Our backups are **short-term safety nets**, not long-term archives. If you need data held securely for long periods of time, consider archiving it or maintaining your own backups as well.

Retention policies
------------------

New or changed data is synced nightly to our backup servers - ``delorean``, ``docbrown``, and ``marty`` - and then snapshots are taken and kept for as long as the policy for that data dictates.

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Location
     - Policy
   * - ``/mnt/shared/projects``
     - 30 daily snapshots
   * - ``$HOME``
     - 30 daily snapshots

Restoring backups
-----------------

Please :doc:`contact-us` with all queries regarding restoring data from backup.


Archived data
-------------

For data that is static (ie unchanging) or no-longer active (eg old projects) we can offer limited archiving facilities for longer-term storage. Your data must be suitably organised, with appropriate metadata and **no** intermediate files remaining. File/folder counts should be low. Your data will be moved to a READ-ONLY area, and duplicated across two file-systems (one in Dundee, one in Aberdeen).

.. important::
  Data in the archive is **not backed up**. The Dundee and Aberdeen instances are all the versions that'll exist, unless you also maintain local copies.

.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>


