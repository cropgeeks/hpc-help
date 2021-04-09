Guest Accounts
==============

If you have been allocated a guest account on the Crop Diversity HPC system the method you need to use to connect is a slightly different from a normal user account. Guest accounts are temporary accounts created to give limited access to the system for the training or similar purposes. You will gave access to your own home folder and scratch folder locations but not to the shared projects folders. For running jobs you'll have access to compute servers on the ``debug`` queue only.

As with a normal user account you must log in to the main login server called ``gruffalo`` using the **Secure Shell (SSH)**.

If using Linux or macOS, then you'll already have an SSH client installed that you can access via a local terminal. If using Windows, then you'll have to install one or more new programs in order to connect, good options include `MobaXterm <https://mobaxterm.mobatek.net/download-home-edition.html>`_, `WSL <https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux>`_ (Windows 10 only), `Cygwin/mintty <https://www.cygwin.com/>`_ or `PuTTY <https://www.putty.org/>`_.

Key Authentication
------------------
We require guest accounts to authenticate using an ssh key file we will send to you. There are two versions of the private key, due to the putty program requiring a different file format than all the other programs, so you'll get two files to allow you to use putty if you wish. The private keys files will be called guestxxx_key (generic format) and guestxxx_key_putty.ppk (putty format), where xxx is replaced by a number. Both private key files are protected by a passphrase that you must type in when connecting, which we'll also provide to you.

It is vital that you keep the private key file and the passphrase safe while you guest account is active, as otherwise hackers could use them to gain unauthorised access to the system. Only store the key files in a secure location on your computer, and never on a shared network drive accessible to others. Do not save the passphrase in a file on the same computer as the private key file.

Once your guest account expires, such as after the training sessions are finished, all the files created on the system will be wiped and the private key will be revoked so that it no longer grants access.

Connecting Using the ssh command
================================
On a Mac or Linux computer, or on Windows using the Ubuntu App, Cygwin, Mobaxterm etc you have access to a command line environment providing the ``ssh`` command which will allow you to connect to Crop Diversity using the provided private key file. The command required to connect is::

 ssh -i path/to/guestxxx_key guestxxx@gruffalo.cropdiversity.ac.uk

where you must replace ``path/to/guestxxx_key`` with the full path to the location you saved the generic private key file. On Mac or Linux make sure only your user has permissions to read the private key file or the command will refuse to run. You can fix this using the command ``chmod og-wrx guestxxx_key``.

The first time you connect you may be asked to confirm you trust the identify of the remote server, by checking its finger print. See `here <ssh-terminal-pw>`_ for the correct finger print values.

You will then be prompted to enter the passphrase (a kind of password) which you will have been provided with separately.

Connecting Using MobaXterm's Graphical Interface
================================================
MobaXterm also allows you to connect using a graphical interface without having to type in the ssh command manually. Do this as following::

 Session -> SSH ->
    Basic SSH settings:
        Remote host: gruffalo.cropdiversity.ac.uk
        Specify username: guestxxx
    Advanced SSH settings:
        Use private key: browse and select guestxxx_key

As with the command line method you may be asked to verify the server's fingerprint (see `here <ssh-terminal-pw>`_). You will also have to enter the passphrase we provided you with.

Connecting Using Putty
======================
Similary Putty allows you to connect using a graphical interface::

 Session:
    Hostname: gruffalo.cropdiversity.ac.uk
 Connection -> SSH -> Auth
    Private key file for authentication: browse and select guestxxx_key_putty.ppk
