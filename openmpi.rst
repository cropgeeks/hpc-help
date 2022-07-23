OpenMPI
=======

Many programs require a **Message Passing Interface** (MPI) to communicate between processes running on different CPUs across different physical hosts. On our cluster, OpenMPI 4.1.4 is available for use in these cases.

You can give it a quick test to confirm everything is in order by running::

  $ srun -N 2 -n 2 mpirun hostname
  n19-32-192-hela
  n19-32-192-hela
  n19-32-192-hulk
  n19-32-192-hulk  

  
How to submit MPI jobs
----------------------

.. warning::
  OpenMPI is integrated with Slurm (see :doc:`slurm-overview`) and jobs should **always** be submitted via Slurm, rather than by calling ``mpirun`` directly.

Let's look at a simple example of submitting an MPI program via Slurm, using MPI's take on the familiar Hello World programming example. Place the following into a file called ``hellompi.c``::

  #include <stdio.h>
  #include <stdlib.h>
  #include <mpi.h>
  
  int main(int argc, char *argv[], char *envp[]) {
    int numprocs, rank, namelen;
    char processor_name[MPI_MAX_PROCESSOR_NAME];
  
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Get_processor_name(processor_name, &namelen);
  
    printf("Process %d on %s out of %d\n", rank, processor_name, numprocs);
  
    MPI_Finalize();
  }

And then compile as follows::

  $ mpicc hellompi.c -o hellompi

This uses OpenMPI to compile the source code into a binary called ``hellompi``.

We can then use a Slurm script for submission to the cluster. In ``run.sh`` we place::

  #!/bin/bash

  #SBATCH --ntasks=128

  # Run the hellompi program with mpirun. The -n flag is not required;
  # mpirun will automatically figure out the best configuration from the
  # Slurm environment variables.
  mpirun ./hellompi

And then submit with ``sbatch run.sh``. You should end up with an output file similar to the following::

  $ tail slurm-[id].out
  Process 81 on n19-32-192-loki out of 128
  Process 74 on n19-32-192-killmonger out of 128
  Process 58 on n19-32-192-kaecilius out of 128
  Process 46 on n19-32-192-ironman out of 128
  Process 20 on n19-32-192-hulk out of 128
  Process 126 on n19-32-192-mandarin out of 128
  Process 111 on n19-32-192-malekith out of 128
  Process 83 on n19-32-192-loki out of 128
  Process 65 on n19-32-192-killmonger out of 128
  Process 70 on n19-32-192-killmonger out of 128

You can also wrap MPI jobs directly using ``srun`` as follows::

  $ srun -N 4 -n 4 ./hellompi
  Process 0 on n19-32-192-hulk out of 4
  Process 1 on n19-32-192-ironman out of 4
  Process 2 on n19-32-192-kaecilius out of 4
  Process 3 on n19-32-192-killmonger out of 4

.. tip::
  When using ``srun`` to execute MPI programs, you don't need to use ``mpirun``.
