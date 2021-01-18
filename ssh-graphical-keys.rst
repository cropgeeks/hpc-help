Graphical Clients Connection Guide (Keys)
=========================================

To connect from remote addresses, we require using a cryptographic authentication instead of a password. For this authentication method you need to generate an **SSH key pair**.

SSH key pairs consist of two individual parts: a **private** and a **public** key. The private key must always be kept secret, much like a password. The public part, however, may be transported (as the name says) publicly and will be installed on ``gruffalo``. Your private key will then be used to verify your access.

The following steps will show you how to generate a key pair and register it with us.


Generating a key pair
---------------------

`MobaXterm <https://mobaxterm.mobatek.net/download-home-edition.html>`_ and `PuTTY <https://www.putty.org/>`_ are two Windows programs that you can use to connect to the HPC, both also include tools for SSH key generation. The key generation tools are very similar, so we will use MobaXterm as the example but PuTTYgen (a tool included with the PuTTY bundle) is almost identical.

Launch MobaXterm, click on the Tools icon, then on MobaKeyGen. This will launch the MobaXterm SSH Key Generation tool. Select the Ed25519 key type (other types should also work but this is the best type), then click Generate. Move your mouse about to create random input for the key! We strongly recommend using a passphrase to protect your private key, so choose a new passphrase and enter it into the Key passphrase box and also retype it into the Confirm passphrase box. Your key is now ready to save. Click "Save public key" and choose a place to save the public key that you will later need to email to us. Then finally click "Save private key" and choose a place to save your private key which you should keep safe and not share with anyone. Once both files are saved you can close the tool by clicking on the X at the top right of the dialog.

The public key should contain something looking like this::

  ---- BEGIN SSH2 PUBLIC KEY ----
  Comment: "ed25519-key-20201203"
  AAAAC3NzaC1lZDI1NTE5AAAAIHJSF2tDtfI8ePZuEGarAl/8v0ntn3G803x8mVqA
  qS8k
  ---- END SSH2 PUBLIC KEY ----

You now need to send us your key (see :doc:`contact-us`), attaching only the public key file. You can either attach the file or copy-paste its contents (the public key does not need to be kept secret from anyone). Once we confirm your public key has been added to the system it may take 30 minutes or so for the system to update itself, then you should be able to log in using it.

To do so you need to login using your private key instead of your ordinary account password. In MobaXterm click the Session icon, select SSH, then enter gruffalo.cropdiversity.ac.uk as the remote host, enter your username in the username box and leave the port as 22 (or try 443 if you suspect your local firewall is blocking port 22). Next click on the "Advanced SSH settings", select the "Use private key" option, then click on the small white icon in order to browse to and select your private key file, whereever you chose to save it. Finally click OK. MobaXterm should now ask you for the passphrase you used to protect your private key and then try to login to the HPC. If it works you should then be logged in to gruffalo.

To use PuTTYgen make sure you installed this tool from the PuTTY bundle, launch PuTTYgen, eg by searching "puttygen" in the start menu search box and then follow the same steps as described above for the MobaKeyGen tool. For further assistance you can view the following video demonstration of the entire process using MobaXterm.

.. raw:: html

   <video controls width="320" height="240"> <source src="_static/sshkeygen_mobaxterm.mp4" type="video/mp4"></video><br>


Additional notes
----------------

Many locations, including other institutions or public locations (airports, cafes, etc) may restrict which ports outgoing internet traffic can use, often locking it down to just a small subset that is enough for email and basic web access.

SSH uses port 22 by default, but if you find your connection to ``gruffalo`` being blocked, it'll also accept connections on port 443, which is normally used for encrypted web traffic and therefore usually available. Simply modify your client's connection details to use Port 443 instead of 22.

.. note::
  Only the most evil of deep-packet inspection (DPI) firewalls are likely to block SSH over port 443, so if you're going to connect remotely a lot it's probably worth setting port 443 as your default.
