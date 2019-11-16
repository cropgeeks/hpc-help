Frequently Asked Questions
==========================

What hardware is available on the HPC cluster?
----------------------------------------------

The cluster has 55 physical nodes, providing a total of 3,528 (hyperthreaded) Intel Xeon compute cores and 15,296 GB of memory. A 1.5 PB parallel storage array is complemented by a further petabyte of backup capacity. A full description is provided on the :doc:`system-overview` page.


How do I get an account on the system?
--------------------------------------

Please visit https://forms.gle/dKAp2aCy2YnG26SAA to request an account. Further details are available on the :doc:`user-accounts` page.


How do I connect to the cluster?
--------------------------------

The cluster’s head node (where you can submit jobs from) is called ``gruffalo``, and you'll need an SSH client to connect. SSH is built into Linux and macOS, whereas for Windows you'll need to install a separate client; WSL, Cygwin, and PuTTY are all good choices.

Connect to the system via ssh using::

  $ ssh <username>@gruffalo.cropdiversity.ac.uk

making sure to replace ``<username>`` with the username you were allocated when requesting an account. More detailed connection instructions are available on the :doc:`ssh` page.
 

How do I submit jobs to the cluster?
------------------------------------

The cluster uses the SLURM job scheduling system and all jobs should be submitted (from ``gruffalo``) to SLURM, where they will be allocated resources on one of the underlying compute nodes. More detailed instructions can be found on the :doc:`slurm` page.
  
What software is available?
---------------------------

In general, there is very little application software installed system-wide (check ``/mnt/apps`` for details), as you are expected to manage and maintain your own - individual - software repositories using tools like :doc:`bioconda` and :doc:`singularity`. However, if you get stuck installing applications, then don't hestitate to get in touch.

How should I manage my data?
----------------------------


Can I access the cluster when off site?
---------------------------------------

Yes. Access to the cluster via a username/password combination is available if you are connected via a :doc:`organizations` network address, but for other locations you must first enable your account for SSH public key authentication, described in more detail on the :doc:`remote-access` page.


Is training available to help me with Linux or using the cluster?
-----------------------------------------------------------------

Why "gruffalo"?
---------------

The name ``gruffalo`` goes way back to the early days of HPC at the Scottish Crop Research Institute (that merged with the Macaulay Land Use Institute to become the James Hutton Institute in 2011). Our first cluster - circa 2004 - used this name, and we've carried it on ever since, upgrading and/or rebuilding it across a range of hardware and software (RHEL, Fedora, CentOS) generations.