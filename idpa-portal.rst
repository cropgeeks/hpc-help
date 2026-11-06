:nosearch:
:orphan:

Account Management Portal
=========================

Use the Account Management Portal to manage your HPC account, including resetting your password, managing SSH keys, and accessing multi-factor authentication (MFA) options.

.. raw:: html

  <p>Currently logged in as: <code class="docutils literal notranslate">
    <span class="pre" id="userDetails">Verifying your session...</span></code>
    - <a href="" onclick="logout(event)">Log out</a>
  </p>

.. note::
  Password authentication is only possible when accessing the cluster on a trusted network. Connections from everywhere else require your account to have at least one public SSH key associated with it, and MFA registered via an authenticator app.

🔐 Reset password
~~~~~~~~~~~~~~~~~

This allows you to generate a new temporary HPC password and receive it by email. You'll be asked to change it when you next log in via SSH.

.. raw:: html

  <p>
  <center>
  <form action="/api/password-reset" method="POST"
      onsubmit="return resetSetting(event, 'password');">
    <button type="submit">Confirm Password Reset</button>
  </form>
  </center>
  </p>

  <div id="password-error" style="display: none;">
    <div class="admonition error">
      <p class="admonition-title">Password reset failed</p>
      <p>The server encountered an unexpected condition that prevented it from fulfilling the request. Please try again, or <a href="contact-us.html">Contact Us</a> if still encountering errors.</p>
    </div>
  </div>

  <div id="password-ok" style="display: none;">
    <div class="admonition tip">
      <p class="admonition-title">Password reset</p>
      <p>Your password has been reset - please check your email for details.</p>
    </div>
  </div>

----

🗝️ Manage SSH keys
~~~~~~~~~~~~~~~~~~

These are the public keys currently registered to your HPC account:

.. raw:: html

  <ul id="sshKeys" style="font-size: 0.75em; font-family: monospace; overflow-wrap: anywhere;">
    <li>Loading SSH keys...</li>
  </ul>
  
  <p><a href="#" id="showAddKeyForm"><small>Add new key...</small></a></p>

  <form id="addSSHKeyForm" action="/api/keys/add" method="POST"
    onsubmit="return addSSHKey(event);" style="display: none;">
    <p>
      <label for="newSSHKey">To add a new public key, paste it below and then click Add key:</label>
      <textarea id="newSSHKey" name="key" rows="4" required
          placeholder="ssh-ed25519 AAAA... or ssh-rsa AAAA..."
          style="width: 100%; box-sizing: border-box; font-family: monospace;"></textarea>
    </p>
    <p>
      <button type="submit">Add key</button>
    </p>
  </form>

  <div id="key-add-error" style="display: none;">
    <div class="admonition error">
      <p class="admonition-title">Key update failed</p>
      <p>The server encountered an unexpected condition that prevented it from fulfilling the request. Check the following before re-submitting:</p><ul><li>You pasted your public key, not your private key</li><li>The key is complete, in OpenSSH format, and on a single line</li><li>It starts with a supported key type, such as ssh-ed25519 or ssh-rsa</li><li>You haven't accidentally copied extra text or omitted part of the key</li><li>The key may already be registered to your account</li></ul><p>Please try again, or <a href="contact-us.html">Contact Us</a> if still encountering errors.</p>
    </div>
  </div>

  <div id="key-delete-error" style="display: none;">
    <div class="admonition error">
      <p class="admonition-title">Key update failed</p>
      <p>The server encountered an unexpected condition that prevented it from fulfilling the request. Please try again, or <a href="contact-us.html">Contact Us</a> if still encountering errors.</p>
    </div>
  </div>

----

🛡️ Reset multi-factor authentication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This allows you to reset your MFA settings and scan a new QR code into an authenticator app. You'll receive the details by email.

.. raw:: html

  <p>
  <center>
  <form id="resetMfaForm" action="/api/mfa-reset" method="POST"
      onsubmit="return resetSetting(event, 'mfa');">
    <button type="submit">Confirm MFA Reset</button>
  </form>
  </center>
  </p>

  <div id="mfa-error" style="display: none;">
    <div class="admonition error">
      <p class="admonition-title">MFA reset failed</p>
      <p>The server encountered an unexpected condition that prevented it from fulfilling the request. Please try again, or <a href="contact-us.html">Contact Us</a> if still encountering errors.</p>
    </div>
  </div>

  <div id="mfa-ok" style="display: none;">
    <div class="admonition tip">
      <p class="admonition-title">MFA reset</p>
      <p>Your MFA settings have been reset - please check your email for details.</p>
    </div>
  </div>

----

📂 Reset Samba password
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use this option to reset your password for Samba and receive it by email.

.. raw:: html

  <p>
  <center>
  <form action="/api/samba-reset" method="POST"
      onsubmit="return resetSetting(event, 'samba');">
    <button type="submit">Confirm Samba Reset</button>
  </form>
  </center>
  </p>

  <div id="samba-error" style="display: none;">
    <div class="admonition error">
      <p class="admonition-title">Password reset failed</p>
      <p>The server encountered an unexpected condition that prevented it from fulfilling the request. Please try again, or <a href="contact-us.html">Contact Us</a> if still encountering errors.</p>
    </div>
  </div>

  <div id="samba-ok" style="display: none;">
    <div class="admonition tip">
      <p class="admonition-title">Password reset</p>
      <p>Your password has been reset - please check your email for details.</p>
    </div>
  </div>

.. note::
  :doc:`samba` is only available if directly connecting to the cluster from the JHI network, or via Tailscale. It uses its own authentication scheme, separate from your normal cluster password.

.. raw:: html

  <script>
    async function logout(event)
    {
      event.preventDefault();

      fetch('/api/auth/logout', { method: 'POST' })
        .finally(() => { window.location.href = '/idpa-login.html'; });
    }

    // This is used for both password, mfa, and samba reset options
    async function resetSetting(event, setting)
    {
      event.preventDefault();

      const settings = {
        password: {
          confirmation: 'Are you sure you want to reset your HPC password?',
          successId: 'password-ok',
          errorId: 'password-error'
        },
        mfa: {
          confirmation: 'Are you sure you want to reset your MFA settings?',
          successId: 'mfa-ok',
          errorId: 'mfa-error'
        },
        samba: {
          confirmation: 'Are you sure you want to reset your Samba password?',
          successId: 'samba-ok',
          errorId: 'samba-error'
        }
      };

      const config = settings[setting];

      if (!confirm(config.confirmation))
        return;

      const form = event.currentTarget;
      const button = form.querySelector('button[type="submit"]');
      const success = document.getElementById(config.successId);
      const error = document.getElementById(config.errorId);

      button.disabled = true;
      success.style.display = "none";
      error.style.display = "none";

      try
      {
        const response = await fetch(form.action, {
          method: 'POST',
          headers: {
            'Accept': 'application/json'
          }
        });

        if (response.status === 401)
        {
          window.location.replace("idpa-login.html?expired");
          return;
        }

        else if (response.ok)
          success.style.display = "block";
        
        else
          throw new Error(`${response.status}`);
      }
      catch (error)
      {
        document.getElementById(config.errorId).style.display = "block";
      }
      finally
      {
        button.disabled = false;
      }
    }

    function renderSSHKeys(keys)
    {
      const list = document.getElementById("sshKeys");
      list.replaceChildren();

      if (!keys.length)
      {
        const empty = document.createElement("li");
        empty.textContent = "No SSH keys registered.";
        list.appendChild(empty);
        return;
      }

      keys.forEach((key, index) => {
        const row = document.createElement("div");
        row.className = "ssh-key-row";

        const item = document.createElement("div");
        item.className = "ssh-key-item";

        const value = document.createElement("div");
        value.className = "ssh-key-value";
        value.textContent = key;
        item.appendChild(value);

        const button = document.createElement("button");
        button.type = "button";
        button.className = "ssh-key-delete";
        button.textContent = "❌";
        button.title = "Delete SSH key";
        button.setAttribute("aria-label", "Delete SSH key");

        button.addEventListener("click", async () => {
          if (!confirm("Are you sure you want to delete this SSH key?"))
            return;

          button.disabled = true;
          document.getElementById("key-add-error").style.display = "none";
          document.getElementById("key-delete-error").style.display = "none";

          try
          {
            const response = await fetch(`/api/keys/delete/${index}`, {
              method: "DELETE",
              headers: {
                "Accept": "application/json"
              }
            });

            if (response.status === 401)
            {
              window.location.replace("idpa-login.html?expired");
              return;
            }

            if (response.ok)
              await getUser();
            else
              throw new Error(`${response.status}`);
          }
          catch (error)
          {
            document.getElementById("key-delete-error").style.display = "block";
            button.disabled = false;
          }
        });

        row.appendChild(item);
        row.appendChild(button);
        list.appendChild(row);
      });
    }

    async function addSSHKey(event)
    {
      event.preventDefault();

      const form = event.currentTarget;
      const button = form.querySelector('button[type="submit"]');
      const textarea = document.getElementById("newSSHKey");
      const publicKey = textarea.value.trim();

      document.getElementById("key-add-error").style.display = "none";
      document.getElementById("key-delete-error").style.display = "none";
      button.disabled = true;

      try
      {
        const response = await fetch(form.action, {
          method: "POST",
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"
          },
          body: new URLSearchParams({
            key: publicKey
          })
        });

        if (response.status === 401)
        {
          window.location.replace("idpa-login.html?expired");
          return;
        }

        if (!response.ok)
          throw new Error(`${response.status}`);

        textarea.value = "";
        form.style.display = "none";
        document.getElementById("showAddKeyForm").style.display = "inline";

        await getUser();
      }
      catch (error)
      {
        document.getElementById("key-add-error").style.display = "block";
      }
      finally
      {
        button.disabled = false;
      }
    }

    async function getUser()
    {
      try
      {
        const response = await fetch("/api/user", {
          method: "GET",
          headers: {
            "Accept": "application/json"
          }
        });

        if (response.status === 401)
        {
          window.location.replace("idpa-login.html?expired");
          return;
        }

        if (!response.ok)
        {
          window.location.replace("idpa-login.html?error");
          return;
        }

        const user = await response.json();

        document.getElementById("userDetails").textContent = user.username + " (" + user.email +")";      
        renderSSHKeys(user.sshKeys);
      }
      catch (error)
      {
        window.location.replace("idpa-login.html?error");
      }
    }
    
    window.addEventListener("DOMContentLoaded", getUser);

    // Setup the "add key" click functionality
    const showLink = document.getElementById('showAddKeyForm');
    const form = document.getElementById('addSSHKeyForm');

    showLink.addEventListener('click', (event) => {
      event.preventDefault();
      form.style.display = 'block';
      showLink.style.display = 'none';
    });

  </script>
