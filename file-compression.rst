Working with Compressed Files
=============================

With storage space, and perhaps more importantly backup capacity, at a premium, it's important to ensure that disk space is not wasted by leaving lots of large uncompressed (usually text) files lying around. Compressing text files – sequence data in particular – usually results in space savings of between 50 and 90%, so it is certainly worth the effort!


Compressing files
-----------------

To compress one or more files of a given type, use::

  $ pigz *.txt

.. note::
  ``pigz`` is a multicore aware version of ``gzip`` and performs significantly faster when multiple CPUs or cores are available for use.
  
While multicore is great, you might be running this as part of a job submission that only requested say, 4 cores, so it's best to limit ``pigz`` in these cases::

  $ pigz -p 4

  
Decompressing files
-------------------

Ideally you shouldn’t have to decompress files (see below), but for completeness::

  $ pigz -d *.gz

  
Leaving files compressed
------------------------

Often, you never even need to decompress files, and one of the following three methods may work for input (or output) to an application, regardless of whether it's designed to support compressed files.


Support for compressed files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If a program supports compressed files as an input (or output), then simply feed it the name of your files, for example::

  $ ./program input.txt.gz output.txt.gz

Easy!
  
  
Pipes
~~~~~

If a program doesn't support compressed files directly, but does support input/output streams, then you can decompress/compress the data files on the fly by using pipes::

  $ ./program | pigz -cd input.txt.gz
  $ ./program | pigz -c > output.txt.gz

The first example takes ``input.txt.gz`` and decompresses it (with ``pigz``) before feeding the uncompressed data into the program. The second example is simply the reverse, taking any uncompressed output data and compressing into a file called ``output.txt.gz`` as it's generated.

  
Process substitution
~~~~~~~~~~~~~~~~~~~~

Process substitution can be used when you have a program that not only expects a file handle (rather than a stream) but also doesn’t support compressed files. The bash shell is able to *fake* a handle to the program that is actually formed from the output of another program, such as decompressing a file. At no point does the file actually exist in its decompressed form.

To use a compressed file as input via process substitution, run::

  $ ./program <(pigz -cd input.txt.gz)

To convert the output file of a program into a compressed file via process substitution, run::

  $ ./program >(pigz output.txt.gz)

.. note::
  Not every program will support this, unfortunately. For instance, if a program expects to take a file and use it to determine a working directory where it can write more files to, then the above will likely fail.
