:nosearch:
:orphan:

Account Management
==================

.. warning::
  The Crop Diversity HPC Account Management portal provides access to sensitive account-management functions associated with your HPC account. You are responsible for ensuring that access to this portal and your account credentials remains secure.

  - **Keep your access secure:** Never share your access link, session or credentials with anyone else. Do not leave the portal accessible on an unattended or shared computer.
  - **Unauthorised access:** Any unauthorised access to, or misuse of, the portal or its functions is strictly prohibited and may result in suspension of access and further investigation.
  - **Activity monitoring and auditing:** For security purposes, all access to the portal and actions performed within it are logged. This includes the originating IP address, timestamps and details of the operations performed. These records may be reviewed when investigating security incidents or suspected misuse.

By continuing, you acknowledge that you are authorised to access the portal and agree to use it responsibly and in accordance with the applicable HPC usage and security policies.

.. raw:: html

    <p><form id="form" action="/api/auth/login" method="POST"
        onsubmit="return submitForm(event)">
        <input type="submit" value="Continue" id="button"/>
    </form></p>

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
            "Authorization": `Bearer ${token}`,
            "Accept": "application/json"
          },
          credentials: "same-origin"
        });

        if (response.status === 200)
          window.location.href = "idpa-portal.html";
        else if (response.status === 401)
          window.location.href = "idpa-login.html?expired";
        else
          window.location.href = "idpa-login.html?error";
      }
      catch (error)
      {
        window.location.href = "idpa-login.html?error";
      }
    }

    const url = new URL(window.location.href);
    let token = url.searchParams.get("token");

    if (token)
    {
      console.log("got token: " + token);

      // Remove the token from the visible URL.
      url.searchParams.delete("token");
      history.replaceState(null, "", url.pathname + url.search + url.hash);
    }
    else
      window.location.href = "idpa-login.html?expired";

    
  </script>
