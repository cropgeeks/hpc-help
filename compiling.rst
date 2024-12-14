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


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
