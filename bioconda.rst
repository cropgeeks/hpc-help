Bioconda
========

Bioconda (https://bioconda.github.io) is a community managed set of packages providing bioinformatics software, with a repository of over 8,500 packages (as of August 2021) ready to install. It is part of the conda system which includes standard Linux/Unix tools as well.

Using conda allows you to pick and choose the software (and versions) that you want without any danger of clashing with anyone else's requirements, and as most packages require nothing more than running ``conda install <packagename>``, the process is incredibly easy.

Follow the instructions below to get up and running with Bioconda in just a few minutes.

.. warning::
  In order to maintain compatibility with the system's backup and data policies, you should not attempt to install Bioconda using any other method than the one listed here.

  
Installing Bioconda
-------------------

To install Bioconda, simply run: ``install-bioconda`` while logged into ``gruffalo``. This will automatically download the necessary files for you, install it to an appropriate area, and then setup the correct channels for finding software for you. By default, it'll install channel information for R, conda-forge,  Bioconda and the underlying Conda system itself.

.. important::
  You must log out and in again (or open a new shell window) before the changes made by the install script will take effect.

You should test that installation was successful::

  $ conda --version
  conda 4.10.3


Finding packages
----------------

There are several options for finding software packages that you can install:

* `browse the package list <https://anaconda.org/bioconda/>`_ online to see what’s available
* use ``conda search <packagename>``

For example::

  $ conda search samtools
  Fetching package metadata .................
  samtools                     1.3                           0  bioconda
                               1.3                           1  bioconda
                               1.3                           2  bioconda
                               1.3.1                         0  bioconda
                               1.3.1                         1  bioconda
                               1.3.1                         2  bioconda
                               1.3.1                         3  bioconda
                               1.3.1                         4  bioconda
                               1.3.1                         5  bioconda
                               1.4                           0  bioconda
                               1.4.1                         0  bioconda
                               1.5                           0  bioconda
                               1.5                           1  bioconda
                               1.5                           2  bioconda
                               1.6                           0  bioconda
							   
Once you know the name of the package (and optionally its version), you can query for more information using ``conda search <packagename> --info`` or ``conda search <packagename>=<version> --info``::

  $ conda search samtools=1.4 --info
  Fetching package metadata .................
  
  samtools 1.4 0
  --------------
  file name   : samtools-1.4-0.tar.bz2
  name        : samtools
  version     : 1.4
  build string: 0
  build number: 0
  channel     : bioconda
  size        : 981 KB
  arch        : x86_64
  has_prefix  : True
  license     : MIT
  md5         : ba63ece45b20644cbbb753e9ca0394c0
  noarch      : None
  platform    : linux
  requires    : ()
  subdir      : linux-64
  url         : https://conda.anaconda.org/bioconda/linux-64/samtools-1.4-0.tar.bz2
  dependencies:
      curl
      libgcc
      xz
      zlib

Importantly, this will tell you what dependencies the package may have, although conda will always resolve these for you automatically.
	  
.. note::
  If you don't specify a version (by using ``<packagename>=<version>``) then Bioconda will assume you're interested in the latest version, which is probably what you want most of the time anyway.


Installing packages
-------------------

To install, use ``conda install <packagename>``. For example::

  $ conda install samtools
  Fetching package metadata .................
  Solving package specifications: .
  
  The following NEW packages will be INSTALLED:
  
      bzip2:     1.0.6-1           conda-forge
      curl:      7.54.1-0          conda-forge
      krb5:      1.14.2-0          conda-forge
      libgcc:    7.2.0-h69d50b8_2
      libssh2:   1.8.0-1           conda-forge
      samtools:  1.6-0             bioconda
  
  Proceed ([y]/n)? y
  
  bzip2-1.0.6-1. 100% |#####################################| Time: 0:00:00 476.24 kB/s
  krb5-1.14.2-0. 100% |#####################################| Time: 0:00:01   3.07 MB/s
  libssh2-1.8.0- 100% |#####################################| Time: 0:00:00  26.50 MB/s
  libgcc-7.2.0-h 100% |#####################################| Time: 0:00:00  19.51 MB/s
  curl-7.54.1-0. 100% |#####################################| Time: 0:00:00   3.23 MB/s
  samtools-1.6-0 100% |#####################################| Time: 0:00:01 999.31 kB/s

To update an existing package at a later date (eg to its newest version), you can use::

  $ conda update samtools
  
.. note::
  At some point you will run into a conflict and/or find this process gets slower and slower. One recommendation is to use "environments" (see below). Another suggestion is ``conda install mamba`` and then use ``mamba install <packagename>``. Continuing the snake naming theme, `Mamba <https://mamba.readthedocs.io/>`__ is an alternative to the Conda installation tool which uses a different and faster approach to solving the dependency tree - hopefully that technique will be adopted into the standard conda tool at some point.


Listing packages
----------------

To retrieve a list of installed packages, use::

  $ conda list
  libssh2                   1.8.0                         1    conda-forge
  readline                  6.2                           2
  requests                  2.18.4           py36he2e5f8d_1
  samtools                  1.6                           0    bioconda
  setuptools                36.5.0           py36he42e2e1_0

This returns entries not only for Bioconda, but also for packages from repositories that Bioconda relies upon, such as conda and conda-forge. You can filter the list using::

  $ conda list | grep bioconda

  
Removing packages
-----------------

Removing packages is as simple as::

  $ conda remove samtools
  Fetching package metadata .................
  Solving package specifications: .

  The following packages will be REMOVED:
  
      samtools: 1.6-0 bioconda
  
  Proceed ([y]/n)? y

.. note::
  Removing a package doesn't remove its dependencies, so over time you may find your Bioconda install growing quite large, so run ``conda clean`` to tidy things up.


Environments
------------

While conda is good at resolving package dependencies, it's likely you'll (eventually) find a package you can't install because its dependencies clash with those of already-installed package (which often happens when packages rely on one of the major versions of Python (2 or 3)). Another problematic situation arises if you want to have multiple versions of the same package installed.

Both of these issues can be resolved using environments, which are best thought of as a standalone, isolated working copies of conda.

To use a separate environment, you first need to create it::

  $ conda create -n samtools-old

This environment is isolated from your main conda installation, so you need to activate it before use (note how the command prompt changes when this happens)::

  $ conda activate samtools-old
  (samtools-old) $

You can then proceed to install packages into your new environment::

  (samtools-old) $ conda install samtools=1.4

.. tip::
  You can merge creating a new environment and installing packages into it using just a single command: ``conda create -n samtools-old samtools=1.4``.
  
You can continue to install more packages into this environment if need be, and run scripts and analyses as normal. Once finished with an environment, return to a normal prompt (and your default conda environment) using::

  (samtools-old) $ conda deactivate

Here's how to get a list of all available environments::
  
  $ conda env list
  # conda environments:
  #
  samtools-old             /$APPS/conda/envs/samtools-old
  root                  *  /$APPS/conda

Conda refers to your base environment as ``root`` and marks the active one with a ``*``.

If you want to get rid of an environment, make sure it's not active, then run::

  $ conda remove --all -n samtools-old

.. note::
  One school of thought suggests installing every package into its own unique environment. While this certainly avoids any dependency clash problems, it can make things a little awkward if you have pipelines or scripts relying on multiple packages as you're then constantly running ``conda activate`` and ``conda deactivate``. Some people go further and suggest your base environment should include only the alternative installation tool ``mamba``, and everything else should go in environments. Ultimately though, it's up to you how you set up and manage Bioconda.

  
Removing Bioconda
-----------------

Conda and Bioconda are installed in ``$APPS/conda``. Simply delete this folder to remove Bioconda and any additional packages you've installed or environments you've created.


Bioconda and Slurm
------------------

When using the ``conda activate`` command in an ``sbatch`` job script you may encounter an error mesage::

  CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.

And subsequently when trying to use commands from the package you may get a ``command not found`` error.
  
You can work around this by using ``source activate <environment>`` instead.

.. note::
  If conda cannot be found on your ``$PATH`` then you'll need to provide its full path with the command, for example: ``source /full/path/to/conda/bin/activate <environment>``.
  
