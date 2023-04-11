Compiling Software
==================

If :doc:`bioconda` doesn't maintain a pre-built version of an application you're interested in (and assuming it's open-source) you may need to resort to compiling it yourself. Every application is different, so although we can't provide instructions for every case, this page contains some pointers that should help you tackle many of the compilation jobs you're likely to encounter.

.. note::
  While we're always happy to try and help you compile third-party applications, please do try to have a go yourself before requesting help. If nothing else, it's often a good way to learn some fancy new tricks for Linux!

.. warning::
  Before installing any software, please remind yourself of our :doc:`data-storage` which, in short, says applications should only be kept in your ``$APPS`` folder.

tdlr::

  $ ./configure --prefix=$APPS/application_name/version
  $ make
  $ make install

or::

  $ mkdir build
  $ cd build
  $ cmake .. && make


Compiler versions (a.k.a. changing gcc)
---------------------------------------

Enterprise Linux distributions are designed to be around for a long time (10 years in the case of Rocky Linux) and have to maintain ABI/API compatibility over that lifetime, so that developers can create programs on day 1 of the release that will work as long as the distribution is supported. Over time though, this means the programming language versions included are getting very old compared to those that are available in "cutting edge" Linux distributions.

At the time of writing, the version of gcc (GNU C Compiler) installed on our cluster is::

  $ gcc --version
  gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-4)

However, we can take advantage of an *Application Stream* built into RHEL/Rocky called ``GCC Toolset`` to temporarily enable different environments with newer versions of developer tools, such as updated versions of gcc.

Toolsets currently installed include::

  toolset-9   (gcc 9.2.1) 
  toolset-10  (gcc 10.3.1)
  toolset-11  (gcc 11.2.1)

To activate and work with a different toolset, use the ``scl enable`` command, as follows::

  $ scl enable gcc-toolset-11 bash
  $ gcc --version
  gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1)

.. note::
  In previous versions of RHEL/Rocky this feature was called Software Collections Libraries, hence the ``scl`` command that's still in use.


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
