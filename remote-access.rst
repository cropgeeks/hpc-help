Remote Access
=============

.. warning::
  If you exceed three failed remote authentication attempts (within a 10 minute window) the system will block your IP address from further attempts for the next 30 minutes.

The cluster can be accessed via SSH (see :doc:`ssh`) with only password authentication so long as you are connecting via a :doc:`organizations` network address.

To connect from remote addresses, we require using a cryptographic authentication instead of a password. For this authentication method you need to generate an **SSH key pair**.

.. important::
  You can see why it's critical that we enforce key use for remote access by looking at the number of rogue access attempts on our login tracker at https://cropdiversity.ac.uk/botplot.

SSH key pairs consist of two individual parts: a **private** and a **public** key. The private key must always be kept secret, much like a password. The public part, however, may be transported (as the name says) publicly and will be installed on ``gruffalo``. Your private key will then be used to verify your access.

The following steps will show you how to generate a key pair and how to install it. If you already have a key pair, you can skip straight to the `installing`_ section.

.. _installing: #installing-your-public-key


Generating a key pair using commandline tools
---------------------------------------------

.. note::
  Use your own PC/laptop to generate your key pair - don't run these instructions on ``gruffalo``.

The tool **ssh-keygen** can be used to generate an SSH key pair. For further details about its usage, please refer to the *ssh-keygen(1)* manual page.

.. _`Ed25519`: https://en.wikipedia.org/wiki/EdDSA

If no parameter is specified on execution, ssh-keygen will create an RSA key, but `Ed25519`_ keys are a better choice for ``gruffalo``, and can be generated using the following command::

  $ ssh-keygen -t ed25519

This will walk you through setting a location to store the keypair (stick with the default) and setting a passphrase for the private key::

  Generating public/private ed25519 key pair.
  Enter file in which to save the key (/home/dvader/.ssh/id_ed25519):
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in /home/dvader/.ssh/id_ed25519
  Your public key has been saved in /home/dvader/.ssh/id_ed25519.pub
  The key fingerprint is:
  SHA256:EQNnu/70ehGip3Ki1ghuqFTsEB7JpzDubsgzKTx0uTs dvader@localhost
  The key's randomart image is:
  +--[ED25519 256]--+
  |      ..=        |
  |. .    o +       |
  |o= .    o        |
  |+.*      o. .    |
  | = o.   S. . .   |
  |..=o   .. . .    |
  |==oo.o  .o.  .   |
  |*OoEo + oo ..    |
  |=o+o+. +  oo.    |
  +----[SHA256]-----+

.. important::
  It is **critical** that you protect your private key with a passphrase, and ideally ensure the disk it's kept on is encrypted and that no-one else is ever given access to it. Remember, it's *your* private key. Only the public half will be installed on ``gruffalo``.

The keypair will be written to ``~/.ssh/`` on your local machine and consists of two files: the private key file and the public key-file::

  ~/.ssh/id_ed25519
  ~/.ssh/id_ed25519.pub

Your public key
~~~~~~~~~~~~~~~

Your public key - ``id_ed25519.pub`` - must be installed on the cluster to allow you remote access. It contains text that will be similar to the below::

  ssh-ed25519 AAARF3NzaC1lZDI1NTE5VVAAICJeEIONzSuv1GSKcvNmSSDUIB2zHB9byh8sAh4vnDha [comment]

.. warning::
  If you provided a custom name for your key, you may find it wasn't created within ``~/.ssh``. You can either rename/move the file to match the above listings, or use the ``ssh -i`` option to let SSH know where to find your private key.


Generating a key pair using MobaXterm or PuttyGen
-------------------------------------------------

`MobaXterm`_ and `PuTTY`_ are two Windows programs that you can use to connect to the HPC, both also include tools for ssh key generation. The key generation tools are very similar, so we will use MobaXterm as the example but Puttygen (a tool included with the Putty tools bundle) is almost identical.

Launch MobaXterm, click on the Tools icon, then on MobaKeyGen. This will launch the MobaXterm SSH Key Generation tool. Select the Ed25519 key type (other types should also work but this is the best type), then click Generate. Move your mouse about to create random input for the key! We strongly recommend to use a password to protect your private key, so choose a new password and enter it into the Key passphrase box and also retype it into the Confirm passphrase box. Your key is now ready to save. Click "Save public key" and choose a place to save the public key that you will later need to email to us. Then finally click "Save private key" and choose a place to save your private key which you should keep safe and not share with anyone. Once both files are saved you can close the tool by clicking on the X at the top right of the dialog.

.. _`MobaXterm`: https://mobaxterm.mobatek.net/download-home-edition.html
.. _`PuTTY`: https://www.putty.org/

The public key should contain something looking like this::

  ---- BEGIN SSH2 PUBLIC KEY ----
  Comment: "ed25519-key-20201203"
  AAAAC3NzaC1lZDI1NTE5AAAAIHJSF2tDtfI8ePZuEGarAl/8v0ntn3G803x8mVqA
  qS8k
  ---- END SSH2 PUBLIC KEY ----

Go to your email program and send an email to us at help@cropdiversity.ac.uk, attaching only the public key file. You can either attach the file or copy-paste the file contents into the email itself (the public key does not need to be kept secret from anyone). Once we confirm your public key has been added to the system it may take 30 minutes or so for the system to update itself, then you should be able to log in using it.

To do so you need to login using your private key instead of your ordinary account password. In MobaXterm click the Session icon, select SSH, then enter gruffalo.cropdiversity.ac.uk as the remote host, enter your username in the username box and leave the port as 22 (or try 443 if you suspect your local firewall is blocking port 22). Next click on the "Advanced SSH settings", select the "Use private key" option, then click on the small white icon in order to browse to and select your private key file, whereever you chose to save it. Finally click OK. MobaXterm should now ask you for the passphrase you used to protect your private key and then try to login to the HPC. If it works you should then be logged in to gruffalo.

To use Puttygen make sure you installed this tool from the putty tool bundle, launch puttygen, eg by searching "puttygen" in the start menu search box and then follow the same steps as described above for the MobaKeyGen tool. For further assistance you can view the following video demonstration of the entire process using MobaXterm.

.. raw:: html

   <video controls width="320" height="240"> <source src="_static/videos/sshkeygen_mobaxterm.mp4" type="video/mp4"></video><br>

Installing your public key
--------------------------

.. note::
  If you are working from home or away from a :doc:`organizations` network, then you won't be able to install your public key using these instructions. Instead, you can email it to us (see :doc:`contact-us` and we'll get it installed for you.

To install your public key, visit https://ipa.cropdiversity.ac.uk

.. warning::
  Depending on your browser, you may initially see a popup box prompting for your username and password. Ignore it, hitting Cancel or Escape until you see the screen below.

Log in using your username and password.

.. image:: media/freeipa-login.png

It should default to showing you the details of your account, so scroll down until you see the section marked **SSH public keys**:

.. image:: media/freeipa-keys1.png

Next, click ``Add`` and then paste your *public* key into the box that appears:

.. image:: media/freeipa-keys2.png

Close the popup by pressing ``Set``, then scroll back to the top of the page and select ``Save`` to confirm your changes.

Connecting remotely
-------------------

You can now test your key by attempting to connect to ``gruffalo`` and issuing a command. You should be asked for your private key's *passphrase* rather than your user account's *password*::

  $ ssh <username>@gruffalo.cropdiversity.ac.uk whoami
  Enter passphrase for key '/home/dvader/.ssh/id_ed25519': [Passphrase]
  dvader

If you manage to log in successfully, then you should be good to connect from anywhere. Excellent!

.. tip::
  If have problems, try connecting with ``ssh -vvv`` which will produce lots of debug output and may give some hints as to where things are going wrong.


Additional notes
----------------

Many locations, including other institutions or public locations (airports, cafes, etc) may restrict which ports outgoing internet traffic can use, often locking it down to just a small subset that is enough for email and basic web access.

SSH uses port 22 by default, but if you find your connection to ``gruffalo`` being blocked, it'll also accept connections on port 443, which is normally used for encrypted web traffic and therefore usually available. You can tell SSH to connect this way by passing ``-p 443`` as an extra parameter, or by editing your ``~/.ssh/config`` file to include the following::

  Host gruffalo
    Hostname gruffalo.cropdiversity.ac.uk
    Port 443
    Username <username>

.. note::
  Only the most evil of deep-packet inspection (DPI) firewalls are likely to block SSH over port 443, so if you're going to connect remotely a lot it's probably worth setting port 443 as your default.
