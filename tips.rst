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