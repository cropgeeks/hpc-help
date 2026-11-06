Account Management
==================

.. raw:: html

    <div id="expired-warning" style="display: none;">
      <div class="admonition warning">
        <p class="admonition-title">Warning</p>
        <p>Your session has expired or is invalid. Please log in again using the form below.</p>
      </div>
    </div>

    <div id="error-warning" style="display: none;">
      <div class="admonition error">
        <p class="admonition-title">Internal server error</p>
        <p>The server encountered an unexpected condition that prevented it from fulfilling the request. Please try again, or <a href="contact-us.html">Contact Us</a> if still encountering errors.</p>
      </div>
    </div>

If you've forgotten your HPC password, need to update SSH keys, or reset your MFA details, you can use the form below to request access to our Account Management portal.

.. raw:: html

    <p><form id="form" action="/api/auth/request" method="POST"
        onsubmit="return submitForm(event)">
        <label for="email">Email address:</label>
        <input type="email" size="35" id="email" name="email" required />
        <input type="submit" value="Submit" id="button"/>
    </form></p>

.. note::
  Ensure you use the email address associated with your HPC account for this to work.

.. raw:: html

  <script>
    async function submitForm(event)
    {
      event.preventDefault();

      const form = event.target;
      document.getElementById("button").disabled = true;

      try
      {
        const response = await fetch(form.action, {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: new URLSearchParams(new FormData(form)).toString()
        });

        if (response.status === 200)
          window.location.href = "idpa-email.html";
        else
          document.getElementById("error-warning").style.display = "block";
      }
      catch (error)
      {
        document.getElementById("error-warning").style.display = "block";
      }
      finally
      {
        document.getElementById("button").disabled = false;
      }
    }

    const url = new URL(window.location.href);
    const expired = url.searchParams.has("expired");
    const error = url.searchParams.has("error");

    if (expired)
    {
       url.searchParams.delete("expired");
       history.replaceState(null, "", url.pathname + url.search + url.hash);

       document.getElementById("expired-warning").style.display = "block";
    }
    else if (error)
    {
      url.searchParams.delete("error");
      history.replaceState(null, "", url.pathname + url.search + url.hash);

      document.getElementById("error-warning").style.display = "block";
    }
  </script>
