Compiling Software
==================

If :doc:`bioconda` doesn't maintain a pre-built version of an application you're interested in (and assuming it's open-source) you may need to resort to compiling it yourself. Every application is different though, so although we can't provide instructions for every case, this page contains some pointers that should help you tackle many of the compilation jobs you're likely to encounter.

.. note::
  While we're always happy to try and help you compile third-party applications, please do try to have a go yourself before requesting help. If nothing else, it's often a good way to learn some fancy new tricks for Linux!

tdlr::

  $ ./configure --prefix=###########/application_name/version
  $ make
  $ make install

or::

  $ mkdir build
  $ cd build
  $ cmake .. && make


Compiler versions (a.k.a. changing gcc)
---------------------------------------

Enterprise Linux distributions are designed to be around for a long time (10 years in the case of CentOS) and have to maintain ABI/API compatibility over that lifetime, so that developers can create programs on day 1 of the release that will work as long as the distribution is supported. Over time though, this means the programming language versions included are getting very old compared to those that are available in "cutting edge" Linux distributions.

At the time of writing, the version of gcc (GNU C Compiler) installed on our cluster is::

  $ gcc --version
  gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-16)

However, we can take advantage of a RHEL/CentOS feature called ``Software Collection Libraries`` (SCL) to temporarily enable a different environment that gives access to newer versions of various developer tools, such as updated versions of gcc.

SCLs currently installed include::

  devtoolset-3
  devtoolset-4
  devtoolset-6
  devtoolset-7

More information on what's included in each SCL is available at https://wiki.centos.org/SpecialInterestGroup/SCLo/CollectionsList.

To activate and work within an SCL, use the ``scl enable`` command, as follows::

  $ scl enable devtoolset-7 bash
  $ gcc --version
  gcc (GCC) 7.2.1 20170829 (Red Hat 7.2.1-1)
