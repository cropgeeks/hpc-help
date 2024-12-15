Cluster Changes
===============

Crop Diversity HPC has moved from its previous location in Aberdeen, to a new data centre in Dundee. A lot has changed, not least the addition of new hardware totalling almost £3 million, including new storage, networking infrastructure, backup capacity, and of course CPU and GPU worker nodes.

.. important::
  There have been many other changes to the cluster as well, and you must read everything below to ensure you're fully up to date.


A new network
-------------

Connection details remain the same - ``gruffalo.cropdiversity.ac.uk`` - but we're on a new network (``143.234.127.224/27``), and you *may* get SSH key warnings when connecting to ``gruffalo`` for the first time. If you were previously able to connect without SSH keys (ie password only) while using your institute's VPN, you'll need to let your IT team know this new address range so they can update your VPN's split tunnelling rules.


Debian Linux
------------

We've switched from running `Rocky Linux <https://rockylinux.org/>`_ (a Red Hat clone) to `Debian <https://www.debian.org/>`_. The licence and upgrade paths for Rocky are becoming ever more restrictive, and we felt the time was right for a move. Day to day, you're unlikely to notice much difference, but keep an eye out for potential (and subtle) differences in some of the basic command-line tools you use. Our domain controller ``glados`` will continue running Red Hat, and some of the cluster's additional virtual machines (mainly those running Docker) have still to switch over, but that'll happen soon.

.. note::
  We're running Debian 12 ("Bookworm"), which uses v6.1 of the Linux kernel.


New compute hardware
--------------------

You'll now see tens of additional nodes, 1000s of additional CPU cores, and hundreds of thousands of additional GPU cores. Most of this kit (from 2023 and 2024) has 128 cores per node, and either 256 GB or 384 GB of memory.

We've added 39 **Harry Potter** (2023) compute nodes alongside nine GPU nodes, each with four Nvidia A100s. A further 12 **Buffy the Vampire Slayer** (2024) compute nodes are complemented with six GPU nodes containing two Nvidia L40S cards each.

There are three additional high-memory nodes: ``voldemort`` (4 TB, which was running on the old cluster), and ``potter`` and ``weasley``, each with 2 TB. One of the 2023 GPU nodes (``hedwig``) also has 1 TB of memory.

Full details are on the :doc:`system-overview`.


New storage
-----------

The cluster's primary storage capacity is now **5.2** PB (raw, unformatted), with an expectation of around **3.7 - 4.8 PB** usable (formatted, with variations due to file system compression).

This storage has *replaced* not extended existing capacity. It's much faster (newer hardware, better networking, etc), so we didn't want to bottleneck it by merging old and new. Instead, the old array will be repurposed as an archive facility in the new year.

- ``/mnt/shared`` remains as the primary location for important project data (``/mnt/shared/projects``) and temporary/intermediate working data (``/mnt/shared/scratch``) and is running the parallel file system `BeeGFS <https://www.beegfs.io/c/>`_
- ``/home`` is now on a **new** - and separate - partition with 35 TB of NVMe SSD capacity, running NFS which is significantly better for small-file performance

Still in development, we're also building three very high-performance scratch nodes, utilising NVMe flash storage, to provide an additional storage tier for active job data. This'll be similar to ``$TMPDIR``, which is local to each node, fast, but limited in capacity. This new tier will be shared (ie visible from any node), high capacity, and hopefully *even* faster than the main networked storage.

Alongside the new storage is 1.3 PB in additional backup capacity, plus a further 3.2 PB (storage) and 2.6 PB (backup) to be added when needed; we're just keeping it off to save energy for now.


Fair share policies
-------------------

We're proud to have a cluster free of many of the rules and restrictions you may experience elsewhere, however, this freedom can have a negative impact when a small number of users misuse the system. To ensure everything can be kept as open as possible, we need to promote the good behaviours exhibited by the majority and will therefore be placing restrictions on users who are either storing a large **number** of files or continue to allocate their jobs **inefficiently**. 

More details on job allocation will be provided in the new year, but in the first instance, anyone with the following `disk usage <https://cropdiversity.ac.uk/intranet/diskusage/>`_ will be limited in their ability to run jobs:

- more than 250,000 files in ``/home`` or ``projects`` will see your simultaneous job count limited to just **3**
- more than 1 million files in ``/home`` or ``projects`` will see your simultaneous job count limited to just **1**

High file counts severely impact our ability to take backups in a timely manner, and usually don't corelate to ``projects`` being solely for the storage of known, structured/understood, and well-maintained data, **not** temporary/intermediate data that should be kept in ``scratch``. If you've got important high-file count data, then tar.gz it - it can always be extracted to ``scratch`` when needed.

.. note::
  Exceptions to these limits can be made with reasonable justification; simply :doc:`contact-us` and we'll be happy to discuss.

Remember to keep an eye on your weekly reports to track how you're doing, but note that any limits applied to you will be calculated and/or adjusted daily.


Scratch auto-purge
------------------

Continuing the drive for better efficiency and fair-use, ``scratch`` will now be automatically purged of files **older than 90 days**, once per month.

At one point, ``scratch`` on the old system was holding close to a billion files (totalling nearly a petabyte) with much of it left neglected for months, sometimes years at a time. We simply can't allow this to continue. With properly maintained data (tar/gzipped in high-file count cases), there is no problem storing large amounts of data in ``projects`` (we have the capacity after all, just bear in mind the limits mentioned in the previous section) leaving ``scratch`` for its **actual** purpose of storing temporary/intermediate data used while jobs are being prepared, running, or tidied up.

.. warning::
  Do not attempt to abuse this by modifying the timestamps of your files to make this a permanent location for storage as it's unfair to others, and you may lose your privilege to use the service as a result.

To give you time to prepare for this, changing your workflows, tidying existing data, etc, auto-purging of ``scratch`` will not take place before February 2025.


Scratch...is gone?
------------------

As mentioned above, ``scratch`` on the old system was becoming unmaintainable and this carried through to our attempts to clone it to the new storage. The daily churn was simply too high and the cluster would've ended up offline for weeks if a full copy was taken.

This means ``/mnt/shared/scratch`` starts empty, but your data still exists on the old system and *can* be recovered if needed (but note the comment above about how much of it was neglected). If you require this:

- :doc:`contact-us` with a quick message asking for access, and if possible, an estimate of the amount of data you need to transfer.
- You'll be granted limited access to the old system where you should **sort out**, **tidy up**, and finally .tar.gz the data you need *before* transfer. If you attempt to copy millions of individual files over the internet it'll take forever; don't even try!
- The old system can be reached at ``<username>@143.234.80.231`` where you can then ``scp/rsync`` files to ``gruffalo`` (the new one).

The old head node (now called ``old-gruffalo``) has had its memory and CPU count boosted to assist with tarring/zipping files, and also knows that the new cluster can be reached via ``gruffalo``.

.. note::
  Those of you using ``/mnt/destiny/sandbox`` on the old system will find that data at ``/mnt/shared/sandbox``. Please move to ``scratch`` and/or tidy up and store important data in ``projects`` ASAP as this area will not be kept for much longer.


A new location for bioconda (and apps)
--------------------------------------

There's now a new location for installing apps - ``/mnt/apps/users/<username>`` - that can be used for installing :doc:`bioconda`, as well as the storage of any other tools or packages you download or compile. Again, this is an NVMe SSD (on NFS) based system and will hopefully alleviate the performance issues we've seen to date with conda. We've added a symlink to this location from your home folder too: ``/home/<username>/apps``.

.. warning::
  Remember, you must use the cluster's own ``install-bioconda`` script when installing bioconda.

Under the hood, this script will install `miniforge <https://github.com/conda-forge/miniforge>`_ bundled with bioconda. Custom installations of miniforge, bioconda, micromamba, anaconda, etc to anywhere other than your ``apps`` folder are not allowed and **will be deleted** if found.

Also related to apps, those installed system-wide can now be found at ``/mnt/apps/system`` and any shared databases (eg NCBI) have moved to ``/mnt/shared/datasets``.


Updates to SLURM
----------------

The job scheduling engine (SLURM) has been updated to **v24.05.4**. Full release notes `are available <https://slurm.schedmd.com/archive/slurm-24.05.4/release_notes.html>`_ but as with the change to Debian, it's unlikely you'll notice anything significantly different in day-to-day usage.

.. note::
  The job ID counter has been reset to zero. We were approaching 24 million completed jobs on the previous cluster, so this should help with ID readability (for a while at least).

SLURM has not been integrated with MPI at this time as it saw very little use on the old cluster. We'll revisit if the situation changes, but most MPI-enabled tasks run just as well (if not better due to no network overhead) as multicore SMP jobs due to the very high core counts the compute nodes have.


Queue changes
-------------

With new hardware, the numbers of nodes (and hence cores) per queue has changed, but the overall split is approximately 50% allocated to ``long``, 30% to ``medium``, and 20% to ``short``.

.. important::
  As before, you can access a maximum of 256 cores per queue at a time. Any subsequent jobs will queue until your usage allows for more to start running. All queues apart from ``himem`` also have a maximum (simultaneous) memory limit of 256 GB.

These limits mean you can run 1x 256 GB job, or 2x 128 GB, or 4x 64 GB, all the way up to 256x 1 GB jobs, with all further submissions queueing until enough resources free up for more to start.

On the ``gpu`` queue, the GRES names for requesting specific GPU types have been simplified, and are now:

 - Lovelace L40S cards: ``l40s``
 - Ampere A100 cards: ``a100``
 - Quadro RTX cards: ``rtx8000``
 - Tesla V100 cards: ``v100``

For the ``himem`` queue, a new minimum allocation of **32 GB** will be required. This isn't enforced just yet, but once implemented jobs requesting less will fail to start on this queue.


GPU drivers and CUDA toolkit
----------------------------

Just a small note for this one, but all the GPU nodes are now running Nvidia driver **v565.57.01** on CUDA **12.7**. The CUDA *development* toolkit is no longer installed by default, so if you need it, simply install via ``conda install cuda``.


Missing compute hardware
------------------------

The older (2019) **MCU** nodes have been moved to Dundee, but haven't yet been reintegrated into the cluster. It's likely they'll form a new *high-throughput* queue, allowing for array jobs with very high simultaneous core counts, but low memory allocation (eg 1024 active cores at 1 GB each). Ideas for what to call this queue can be discussed in Slack.


Better UPS coverage
-------------------

Our new data centre allows us to run more of the cluster on Uninterruptible Power Supplies (UPS), meaning less of the cluster should go offline on the rare occasion a power-cut happens. Core infrastructure (storage and virtual machines) has always been protected, but we'll now have nodes from the ``short``, ``medium``, ``long``, and ``himem`` queues also covered.

.. note::
  It's unlikely we'll ever UPS protect the GPU nodes. They simply draw too much power.


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>


JHI archive
-----------

Finally, the node that hosts JHI's archive is still syncronising recent changes and hasn't yet moved to Dundee. That'll happen shortly.