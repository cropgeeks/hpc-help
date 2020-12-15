Counting CPUs
=============

Throughout this documentation we'll refer to **CPUs**, but what exactly do we *mean* by a CPU? And if we then state that a compute node has, for example, 32 of them, it's important to be clear on what that means too.

All modern computers contain a CPU - the central processing unit (or processor) - that ultimately allows it to *do stuff*. A compute cluster is no different, and the nodes within it also contain CPUs; the more of them we have, the more CPUs we have, and therefore the more tasks or jobs the cluster can process simultaneously, gaining incredible speed ups versus running them on a single computer.

But most CPUs have multiple processor **cores**, and these can also be **multi-threaded** to create additional virtual or logical CPUs (often called *hyperthreading*). So if we have a CPU with **16** cores, and each core can run **2** threads, then we can process **32** threads - and hence jobs - at a time  (16 x 2). So, while not technically accurate, this multiplication of cores*threads is how we count how many CPUs we have. It's what Slurm, our job scheduler uses (see :doc:`slurm-overview`), and it also mirrors what system tools like ``htop`` will show you when listing CPUs.

Finally, all of our compute nodes contain multiple CPUs (usually either 2 or 4) so a node's final CPU count will be **CPUs*cores*threads**.

.. note::
  When specifically talking about hardware - such as on the :doc:`system-overview` page - then we'll use the correct physical CPU count of a node, while also listing each CPU's cores/thread count too.