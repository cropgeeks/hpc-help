Singularity
===========

The following description is taken from the `Singularity`_ web site:

.. _`Singularity`: https://sylabs.io/docs/

  Singularity enables users to have full control of their environment. Singularity containers can be used to package entire scientific workflows, software and libraries, and even data. This means that you don’t have to ask your cluster admin to install anything for you - you can put it in a Singularity container and run. Did you already invest in Docker? The Singularity software can import your Docker images without having Docker installed or being a superuser. Need to share your code? Put it in a Singularity container and your collaborator won’t have to go through the pain of installing missing dependencies. Do you need to run a different operating system entirely? You can “swap out” the operating system on your host for a different one within a Singularity container. As the user, you are in control of the extent to which your container interacts with its host. 

  
.. warning::
  Singularity is a new technology, and changes often. Although we've attempted to provide some basic instructions on getting up and running with containers, your best source of up-to-date information should always be the Singularity website itself. But do let us know if the info provided here is wrong or out of date too!
  
  
Running containers
------------------

.. note::
  Pre-built container images are usually found at ``/mnt/shared/apps/singularity/images``, located in a folder structure related to the app(s) that they contain. Most will have a ``.simg`` extension (singularity image).

 
Apps
~~~~

To get basic information about the apps in a container, use the ``help`` command::

  $ singularity help <container name>
  
For example::

  $ singularity help /mnt/shared/apps/singularity/images/r/3.4.2/r.simg
  This container hosts two apps: 'R' and 'Rscript'
    singularity run --app R r.simg
    singularity run --app Rscript r.simg


Find out which apps (if any) have been defined for a container by running ``singularity apps``, for example::

  $ singularity apps /mnt/shared/apps/singularity/images/r/3.4.2/r.simg
  R
  Rscript
  
You can then run the app in question by using ``run --app <app name>``. All other options or parameters that you want to pass to the actual program should be appended at the end, as in the ``--version`` example below::

  $ singularity run --app R /mnt/shared/apps/singularity/images/r/3.4.2/r.simg --version
  R version 3.4.2 (2017-09-28) -- "Short Summer"
  Copyright (C) 2017 The R Foundation for Statistical Computing
  Platform: x86_64-redhat-linux-gnu (64-bit)
  
  
Shell
~~~~~

To fully step inside of a container, start Singularity with the ``shell`` command::

  $ singularity shell <container name>
  
For example::

  $ cd /mnt/shared/apps/singularity/images/r/3.4.2/
  $ singularity shell r.simg
  Singularity: Invoking an interactive shell within container...

  Singularity r.simg:~>

By default, your home folder will be mapped into the container, so you'll be able to see your files from within it, even though the container has no knowledge of the rest of our system. Other mount points can be created using the ``bind`` option::

  $ cd /mnt/shared/apps/singularity/images/r/3.4.2/
  $ singularity shell --bind /mnt/shared/:/narnia r.simg
  Singularity r.simg:~> ls /narnia/
  apps  cluster  home  projects  scratch

You can do anything inside of the container that you would do normally outside of it...changing directories, running programs, etc::

  Singularity r.simg:~> df -h
  Filesystem      Size  Used Avail Use% Mounted on
  singularity     1.0M     0  1.0M   0% /
  
  Singularity r.simg:~> pwd
  /mnt/shared/apps/singularity/images/r/3.4.2
  
  Singularity r.simg:~> R --version
  R version 3.4.2 (2017-09-28) -- "Short Summer"
  Copyright (C) 2017 The R Foundation for Statistical Computing
  Platform: x86_64-redhat-linux-gnu (64-bit)

  
Using aliases
-------------

Wrapping applications in Singularity obviously makes the commands required to launch them a little verbose, so it's worthwhile setting up aliases for commonly used ones. This is very simple, for example::

  $ alias R='singularity run --app R /mnt/shared/apps/singularity/images/r/3.4.2/r.simg'

Type ``R`` (along with any parameters), and the command wrapped inside of the quotes runs::

  $ ./R --version
  R version 3.4.2 (2017-09-28) -- "Short Summer"
  Copyright (C) 2017 The R Foundation for Statistical Computing
  Platform: x86_64-redhat-linux-gnu (64-bit)

.. note::
  An alias only persists for the life of the terminal session you have open, but define them in your ``~/.bashrc`` file and they'll be available for use every time you log on.
  

Building containers
-------------------

For help with building containers, it's best to check the official documentation: http://singularity.lbl.gov/docs-build-container

.. warning::
  You'll need root/admin access to perform most build operations - basically the ability to run ``sudo singularity [options...]`` - which isn't available on ``gruffalo``, so you'll need to run builds off-cluster (see below). However, *anything* you build, regardless of what it contains, should be runnable on the cluster - (usually) with no questions asked.

If you can't run Singularity on your own PC/laptop, please :doc:`contact-us` and if we decide there's enough demand we may build a special Singularity *sandbox* machine where all users have been granted the necessary ``sudo singularity`` rights.

Any Singularity images you copy to the cluster should be kept in your ``$APPS`` folder.
