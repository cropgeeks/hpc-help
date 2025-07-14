Getting Connected
=================

All interaction with ``gruffalo`` is handled via an encrypted communication channel, using the **Secure Shell (SSH)** protocol which enables a terminal prompt on ``gruffalo`` from which you can run commands, transfer files, submit jobs, or even run some graphical programs when used in conjunction with an X client.

If using Linux or macOS, then you'll already have an SSH client installed that you can access via a local terminal. If using Windows, then you may want to install one or more new programs in order to connect, good options include `MobaXterm <https://mobaxterm.mobatek.net/download-home-edition.html>`_, `WSL <https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux>`_ (Windows 10+ only), `Cygwin/mintty <https://www.cygwin.com/>`_ or `PuTTY <https://www.chiark.greenend.org.uk/~sgtatham/putty/>`_. Since 2018 there has also been a built-in ssh client in Windows 10 and above which can be run from the Command Prompt or Windows Power Shell, by simply using the command ``ssh`` much like Linux or Mac.


Authentication options
----------------------

Regardless of the client you use to connect, we support two primary methods of SSH authentication:

- **password authentication**
- **key authentication** (with 2FA)

Using passwords is only possible if connecting from one of our :doc:`organizations`, either directly while onsite or via VPN, whereas you can use keys to connect from any location, although it does involve additional initial setup.

We recommend - where possible - that you first establish a working connection using your password before attempting key-based authentication.

.. note::
  With many staff working from home due to the COVID pandemic, you may need to skip straight to the key-based remote access instructions.


Password authentication
-----------------------

The following links will guide you through getting connected to ``gruffalo`` using password authentication. Pick the guide most appropriate to the type of SSH client you're using (either terminal/command-line or graphical):

- :doc:`ssh-terminal-pw`
- :doc:`ssh-graphical-pw`


Key authentication (with 2FA)
-----------------------------

To connect from remote addresses, we require using a strong cryptographic authentication instead of a password. For this authentication method you need to generate an **SSH key pair**.

.. note::
  SSH key-based authentication *also* requires occasional two-factor authentication (2FA) verification via the use of one-time codes. Information on registering an app to generate these codes will have been sent to you with your account details.

Again, we have seperate guides depending on the client type you're using:

- :doc:`ssh-terminal-keys`
- :doc:`ssh-graphical-keys`

.. important::
  You can see why it's critical that we enforce key use for remote access by looking at last seven days' worth of rogue access attempts on our login tracker: https://cropdiversity.ac.uk/botplot


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
