File Transfers
==============

Here are some tips to help you get your data transferred to and from the cluster's file system.

.. important::
  When considering your **source** or **destination** in the text below, remember that ``gruffalo`` - because it's accessible from anywhere (see :doc:`ssh`) - can be both, but your local client may be firewalled and therefore only able to act as a source.

Command line options
--------------------

There are several tools you could use, but two of the most common are ``scp`` (secure copy) which acts very similar to the normal ``cp`` (copy) command, and ``rsync`` which synchronizes files and folders between a source and a destination. In either case, data is transferred over an SSH connection so you should factor in SSH's encryption overheads when comparing performance.

Both of these tools have `many` options to tweak how they run (see the relevant man pages), but in general the basic syntax for either is::

  $ <command> /path/to/source user@host:/path/to/destination

scp
~~~

The ``scp`` command creates a copy of a file (or a directory and its contents if using the ``-r`` option), copying from the source to the destination. For example, to transfer files to ``gruffalo`` from your local client::

  $ scp -r /path/to/source <username>@gruffalo.cropdiversity.ac.uk:/path/to/destination

.. note::
  Pay attention to the ``:`` after the hostname. Miss it out and you'll end up with a local copy of your file *named* after your destination, rather than copying it *to* your destination.

The ``/path/to/destination`` is optional. If you don't include it, copied files will end up in your home folder on the destination. If you don't provide the full path to the source, then ``scp`` should be executed in the directory containing the source file/directory.

rsync
~~~~~

``rsync`` also copies files over a network connection (employing a special `delta transfer algorithm`_ to make things a bit faster) but supports resuming an interrupted transfer with its ``-P`` flag. It's also great for keeping two folders synchronized because it only copies files not already on the destination, or that it detects are different between source and destination.

.. _`delta transfer algorithm`: https://rsync.samba.org/tech_report

A common way of synchronizing folders is::

  $ rsync -avP --delete /path/to/source <username>@gruffalo.cropdiversity.ac.uk:/path/to/destination

``-avP`` enables archive mode, verbose output, and resumable transfers, whereas ``--delete`` *removes* any files on the destination path that are no longer in the source, so use with caution!

.. note::
  Pay attention to whether you have a trailing slash (``/``) on the source or not. No slash means you want to copy the directory *and* its contents, whereas including a slash means you only want to copy the contents.

Here is a short video demonstration of using rsync to import a folder of data from another Linux server external to Crop Diversity.

.. raw:: html

   <video controls width="320" height="240"> <source src="_static/rsync_example.mp4" type="video/mp4"></video><br>


Graphical options
-----------------

How to use the various graphical file transfer programs that are available is beyond the scope of this help, but you'll have many options to pick from regardless of which platform you use. Most of them utilise the same underlying SSH mechanism as the ``scp`` and ``rsync`` tools described above.

.. important::
  Remember that any graphical tool you use needs to access your private key if connecting to ``gruffalo`` away from a :doc:`organizations` network.

Here are a few recommended clients to get you started:

- `SSHFS`_ - all platforms, although it can be a little tricky to set up, especially on Windows
- `FileZilla`_ - all platforms
- `MobaXterm`_ - Windows only, but enables a graphical file browser in addition to normal SSH functionality
- `WinSCP`_ - Windows only

.. _`SSHFS`: https://en.wikipedia.org/wiki/SSHFS
.. _`MobaXterm`: https://mobaxterm.mobatek.net/download-home-edition.html
.. _`WinSCP`: https://winscp.net/eng/index.php
.. _`FileZilla`: https://filezilla-project.org/

.. note::
  JHI users can also enable :doc:`samba` for easy graphical file browsing.
