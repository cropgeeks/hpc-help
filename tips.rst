Tips & Tricks
=============

Here are some handy tips and tricks that can make working with Linux - especially on the command line - that little bit easier.

Special keys
------------

Typing long file or directory names is annoying, but luckily there’s an easier way. You only need to type part of a name and then hit the ``TAB`` key – the Bash shell will autocomplete the rest of it for you. You can also use ``HOME`` to jump the cursor to the start of a line, and ``END`` to jump to the end of a line.

History
-------
The ``UP`` and ``DOWN`` arrow keys can be used to scroll backwards and forwards through recently entered commands. Resubmit a command by hitting ``ENTER``, or even edit and then resubmit – this is great for when you’ve mistyped a long path and need to try again without having to retype everything.

You can also use the ``history`` command to display a recent history of everything you’ve typed::

  $ history
  1  cd /
  2  ll
  3  cd /mnt
  4  ls -l
  5  pwd
 
If you see an entry you want to re-run, use ``!`` (called *bang* in the Linux world), followed by the number of the command as shown by ``history``, eg ``!5``.  You can use ``!!`` on its own to instantly repeat the previous command.

Clearing the screen
-------------------

If you want to clear the screen of all text and move the cursor back to the top of your view, you can use the ``clear`` command. But if even that sounds like too much to type, ``CTRL+L`` will do it too.

Running multiple commands
-------------------------

If you want to run a bunch of commands one after another, but don't want to wait on each one finishing first, then you could write (and run) a script containing all of the commands. But that's a lot of work for just a few commands, which can just as easily be run this way::

  $ make; make install;

You can also string two commands together with the ``&&`` operator, which ensures that the command following ``&&`` only runs if the one before it succeeded, such as::

  $ make && make install

Following log files
-------------------

While ``head`` and ``tail`` can be used to look at the top or bottom of a file respectively, you can also use ``tail`` to *follow* along with a log file as it's being created. This is great for watching the output of a program as it runs, for example::

  $ tail -f logfile.txt

You can finish watching with a ``CTRL+C``.

Interactive programming and data analysis using a JupyterLab server
-------------------------------------------------------------------

JupyterLab is the next-generation web-based user interface for `Project Jupyter <https://jupyter.org/documentation>`_. It allows you to work with documents such as Jupyter notebooks, python scripts, text editors, terminals, etc through a flexible, integrated, web front end. This is particularly useful if you want to do interactive coding on a cluster node rather than locally, functioning like an IDE with plugins for a range of languages. Most of the time you won't need to do this; coding can be done locally and then run on the cluster when ready, however for some use-cases (e.g. deep learning model development) interactive development on significant hardware is particualrly important.

In order to run JupyterLab on a cluster node, first build a ``conda`` environment with jupyterlab installed, connect to a cluster node, and activate the conda environment::

  $ conda create --name jupyterlab jupyterlab
  $ srsh
  $ conda activate jupyterlab

Running jupyterlab is straight-forward, however in order to allow a connect from our local web browser to the server on the cluster node we will need to route things through an SSH tunnel. For that, we will need to know the port that we want to access. We don't strictly have to specify a port when running the server but since the default is a fixed number (8888) if ever two or more users try to run jupyter labs on the same cluster node they will all try to bind to this same port and an error will result. To avoid this it is highly recommended to specified a random port number with the ``--port`` option, eg 12345. Pick a random number between 8000 and 65000 (don't go outside of this range), then it's very unlikely someone else with pick the same port as you on the same compute node. We need to specify the ``--ip 0.0.0.0`` switch to allow JupyterLab to accept connections from other locations, and we want to tell it not to try to spawn a browser of its own with ``--no-browser``::

  $ jupyter-lab --no-browser --ip 0.0.0.0 --port 12345

This will produce a few lines of output while it starts up, then ultimately provide you with something similar to::

  Or copy and paste one of these URLs:
  http://n19-32-192-hela.hpc.hutton.ac.uk:12345/?token=c4fc5b7c965fd5cc9940fcaed065d822483c6015c947a9cc
  or http://127.0.0.1:12345/?token=c4fc5b7c965fd5cc9940fcaed065d822483c6015c947a9cc

This then gives us the URL we will point our browser to - ``http://127.0.0.1:12345/?token=c4fc5b7c965fd5cc9940fcaed065d822483c6015c947a9cc`` in this case - but it'll be different each time you start jupyterlab.

First though, we need to route our browser through an SSH tunnel for this port. To do that, in a local terminal (not on the cluster) we need to log into the cluster and enable port listening on the right port and pointing to the right host (in this example it was ``hela``)::

  $ ssh -L12345:hela:12345 username@gruffalo.cropdiversity.ac.uk

Now all we need to do is paste the URL (``http://127.0.0.1:12345/?token=c4fc5b7c965fd5cc9940fcaed065d822483c6015c947a9cc``) into our browser, and away we go!
