:nosearch:
:orphan:

Confirm Password Reset
======================

Please click the button below to confirm you want to reset your HPC password.

.. raw:: html

  <p>
  <form id="resetForm" action="https://help.cropdiversity.ac.uk/scripts/passwords/reset.sh" method="get">
    <input type="hidden" id="token" name="token" value=""/>
    <input type="submit" value="Confirm Password Reset"/>
  </form>
  </p>

  <script>
    const url = new URL(window.location.href)
    const token = url.searchParams.get('token')

    document.getElementById("token").value = token

  </script>


.. raw:: html

   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>

