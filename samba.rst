Samba Access
============

.. note::
  We can't expose the ports Samba uses over the wider internet, so for now, access is only available if directly connecting to the cluster from the JHI network. We're actively looking at options to improve this.

Samba provides an easy way to connect to Linux storage systems - such as our primary BeeGFS file system - and view, copy, edit, delete, etc any files that you have access to. Within Windows, the cluster can simply be mapped as a network drive and accessed via Windows Explorer.


Account details
---------------

Samba uses its own authentication system, so you must first set a password for your account by visiting the following link and signing in with your Crop Diversity HPC username and password:

- `Create/Update Samba Password <https://help.cropdiversity.ac.uk/samba>`_


Connection details
------------------

The Samba server runs on ``narnia``, and should always be specified using double backslash notation::

  \\narnia.cropdiversity.ac.uk
  
You can either type this into Windows Search or Explorer's navigation bar. Either way, you'll then be asked for your username and the password you set above.

.. note::
  You may need to supply your username with a single backslash (eg ``.\username`` (dot backslash username) to ensure no existing domain information from your Window account is used.

The shares will appear in a new window that you can use to either browse or to right-click and map a network drive to.


Shared folders
--------------

Samba on ``narnia`` gives you access to (at least) the following shared folders:

* your private home directory at ``/home/<username>``
* the main shared storage directory at ``/mnt/shared``

Other folders may be visible as well, but note that some may have restricted access.


Access from macOS
-----------------

To access the shares from macOS, use the Finder’s menu to select Go, Connect to Server and enter ``smb://narnia.cropdiversity.ac.uk`` (or ``cifs://narnia.cropdiversity.ac.uk``) as the server address. You'll also need to supply your credentials (as detailed above) and decide which share to connect to.
