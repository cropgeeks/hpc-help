:orphan:

Two Factor Authentication (2FA)
===============================

You can use this page to set up 2FA for your account. You'll need a 2FA app that serves time-based one-time passwords (TOTP) - some apps confirmed to work are Google Authenticator (`Android <https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2>`_ or `Apple <https://apps.apple.com/gb/app/google-authenticator/id388497605>`_), `Microsoft Authenticator <https://www.microsoft.com/en-gb/account/authenticator>`_, `Duo Mobile <https://duo.com/product/multi-factor-authentication-mfa/duo-mobile-app>`_, and `Authy <https://authy.com/>`_, but other TOTP apps are also likely to work.

While using one of these apps on a smartphone is preferred, you'll also find TOPT apps available for Windows, macOS, or Linux, or as browser extensions.

To link your account with an app, simply scan the QR code below into your app, or enter the details manually:

.. raw:: html

  <p><img id="qrcode" src=""></p>
  <p id="details"></p>
  <script>
    const url = new URL(window.location.href)
    const token = url.searchParams.get('token')
    const label = url.searchParams.get('label')
    document.getElementById("details").innerHTML = "Account name: <b>Crop Diversity HPC (" + label + ")</b>" +
     "<br>Token: <b>" + token + "</b>"
    document.getElementById("qrcode").src  = "https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=otpauth://totp/"
      + label + "%3Fsecret%3D" + token + "%26issuer%3DCrop%2520Diversity%2520HPC"
  </script>

Once the account is linked, the app should display a 6-digit code that changes every 30 seconds, and the system will occasionally prompt you for a code when logging in from an non-trusted IP address. You SSH public key must also be associated with your HPC account.
