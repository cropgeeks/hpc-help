Linux Basics
============

.. tip::
  There are many (many) guides to using Linux that you can find on the wider internet, and it's well worth reading through them if you're new (or returning) to Linux. A good one to start with is https://bioinformaticsworkbook.org/Appendix/Unix/unix-basics-1.html.

About Linux
-----------

Linux is a free, open-source operating system (OS) that's been in development since the early 90s. There are many - often subtly - different versions of Linux, known as *distributions*, and on this cluster all of our nodes are running a distribution called **Rocky Linux 8**.

We use Linux not just because it's free, but because it's also very powerful and very easy to control via scripts which makes it ideal for use in a multi-node computing cluster with thousands of CPUs. Almost all of the top super computers and clusters in the world are likely to be running some variant of Linux.

The terminal/shell
------------------

While you can install full Windows-like desktop graphical environments for Linux, you'll find most compute clusters run *headless*, that is, there are no monitors, keyboards or mice attached to any of the nodes. That means all interaction with the system takes place via remote connections that allow you to issue commands and run programs using a terminal, or *shell* interface.

.. note::
  The core of the Linux OS is called the *kernel*. The shell (which wraps around a kernel) provides a way of communication with the kernel.

The shell is a text-based interface, and just like there are many different distributions of Linux, there are also many different types of shell you can use. One of the most common, and the one installed to your user account by default, is called **Bash**.
