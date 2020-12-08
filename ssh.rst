Getting Connected
=================

All interaction with ``gruffalo`` is handled via an encrypted communication channel, using the **Secure Shell (SSH)** protocol which enables a terminal prompt on ``gruffalo`` from which you can run commands, transfer files, submit jobs, or even run some graphical programs when used in conjunction with an X client.

If using Linux or macOS, then you'll already have an SSH client installed that you can access via a local terminal.

If using Windows, then you'll have to install one or more new programs in order to connect, good options include `MobaXterm`_, `WSL`_ (Windows 10 only), `Cygwin/mintty`_ or `PuTTY`_.

.. _`MobaXterm`: https://mobaxterm.mobatek.net/download-home-edition.html
.. _`Cygwin/mintty`: https://www.cygwin.com/
.. _`WSL`: https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux
.. _`PuTTY`: https://www.putty.org/

No matter which of the above programs you use there are two basic methods of authenticating available: If you're connecting from onsite at one of our :doc:`organizations` you can usually authenticate using the username and password we'll give you when your account is created. If you are connecting from outside a recognised partner's network you will have to authenticate using a preinstalled ssh key instead, which you must setup up yourself following the instructions here: :doc:`remote-access`. This is a security measure designed to stop hackers being able to guess passwords.

Authenticating with Username and Password using a Terminal Program
-------------------------------------------------------------------

To connect to the system this way, you first need to be onsite at one of our :doc:`organizations` so that your IP is recognised (otherwise you'll need to use the sshkey method explained here: :doc:`remote-access`).

If connecting from Linux, MacOS or from a Windows program that provides a terminal interface fire up your local terminal application and then connect to ``gruffalo`` by issuing the following command::

  $ ssh <username>@gruffalo.cropdiversity.ac.uk

Remembering to replace ``<username>`` with the actual username you have been assigned.

.. note::
  Always provide your username in lowercase characters.

If you are connecting for the first time with your current laptop or PC, then you'll need to accept ``gruffalo's`` public SSH host key, which should match one of the six fingerprint values shown below::

  RSA     SHA256 : 27bXQAwDYqyvNIMujn9d5bE9elgk+KF3UJMNjRAuNKA
  ECDSA   SHA256 : ORFcun5bSbLPQ8uCW/R1yqvXbfvhHGuDWkSzRhHARzY
  ED25519 SHA256 : x9XTBSIWPynrVFRcK1HGokuUTxXHgMFhijKoD6ptNuo
  ECDSA   MD5    : 97:49:1a:57:65:ac:3a:3b:07:5d:2b:d7:c3:f6:61:e3
  ED25519 MD5    : e0:95:5e:1d:3f:74:67:82:86:a0:be:9a:70:52:5c:f1
  RSA     MD5    : 71:ec:9c:2c:fb:60:7c:a7:76:33:a3:3a:4b:cc:e7:04

.. important::
  Do not connect if the host key is different as it could be a sign that the server has been compromised or that your connection is being interfered with. You should :doc:`contact-us` before proceeding.

If all is well, then accept the key by typing ``yes``.

You'll then be asked for your password. Enter it to continue, noting that Linux will not echo what you type to the screen.

If you're connecting for the very first time, you'll also have to change your password. The system will ask you to enter your current password **again**, before prompting you to enter a new password **twice**.

.. note::
  Our password policy requires passwords with a length of 12 or greater, containing at least 3 of the following 5 classes: lowercase characters; uppercase characters; digits; special characters, such as comma (,), period (.), asterisk (*); other UTF-8 characters.

You can make subsequent connections faster, by editing your local ``~/.ssh/config`` file to include the following lines::

  Host gruffalo
    Hostname gruffalo.cropdiversity.ac.uk
    User <username>

You'll then be able to connect using just ``ssh gruffalo``.

Authenticating with Username and Password using a Graphical Program
-------------------------------------------------------------------

Rather than typing the ssh command into a terminal, many programs offer a graphical interface where you can setup your connection, including a shortcut for later reuse. Let's look at MobaXterm and Putty on Windows as an example (other programs would be similar). To connect with just your username and password in this way, you still need to be onsite at one of our :doc:`organizations` so that your IP is recognised (otherwise you'll need the sshkey method explained here: :doc:`remote-access`).

Launch MobaXterm and click on the Session icon in the top left corner. Next select SSH as your session type. Now a dialog should appear where you can enter Basic SSH settings.

.. image:: media/mobaxterm.png

For "Remote host" enter ``gruffalo.cropdiversity.ac.uk``. Click the "Specify username" option and enter your username in the box. Leave the "Port" as 22 (you can also try 443 if you find that 22 is being blocked by your organisation's firewall). Click OK.

MobaXterm should now try to connect to ``gruffalo``. Th first time you connect you may be asked to confirm the ssh host key fingerprint, which should match one of the values shown above. Next you should be asked to enter your password, which you can then enter, it is normal for nothing to appear on the screen as you enter the password. All being well you'll then be logged in to gruffalo and be able to run commands. MobaXterm will also store a shortcut to allow faster connection in future, which will appear in the Sessions tab on the left of the main screen. If instead you are denied access try the sshkey method (:doc:`remote-access`).

If using Putty instead of MobaXterm it's very similar:

.. image:: media/putty.png

For "Host Name or IP address" enter: gruffalo.cropdiversity.ac.uk, for "Port" enter: 22, connection type: SSH. You may wish to save this information for next time by entering a name and pressing Save. Then click Open.
