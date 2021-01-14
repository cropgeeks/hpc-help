Terminal Clients Connection Guide (Passwords)
=============================================

To connect to the system this way, you first need to be onsite at one of our :doc:`organizations` so that your IP address is recognised.

Open your local terminal application and then connect to ``gruffalo`` by issuing the following command::

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

If all is well, then accept the host key by typing ``yes``.

You'll then be asked for your password. Enter it to continue, noting that Linux will not echo what you type to the screen.

If you're connecting for the very first time, you'll also have to change your password. The system will ask you to enter your current password **again**, before prompting you to enter a new password **twice**.

.. note::
  Our password policy requires passwords with a length of 12 or greater, containing at least 3 of the following 5 classes: lowercase characters; uppercase characters; digits; special characters, such as comma (,), period (.), asterisk (*); other UTF-8 characters.

You can make subsequent connections faster, by editing your local ``~/.ssh/config`` file to include the following lines::

  Host gruffalo
    Hostname gruffalo.cropdiversity.ac.uk
    User <username>

You'll then be able to connect using just ``ssh gruffalo``.
