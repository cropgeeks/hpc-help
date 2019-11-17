GPU Processing
==============

The cluster contains two nodes (``jaws``) and (``thanos``) with **Nvidia Tesla V100 GPU** co-processors to accelerate CPUs for general-purpose scientific and engineering computing.

- ``jaws`` contains a single card with 16GB of dedicated GPU memory
- ``thanos`` contains dual cards, each with 32GB of dedicated GPU Memory

Each card has 5,120 **CUDA** processing cores and 640 **Tensor** cores. CUDA is Nvidia's parallel computing platform and API for general GPU processing, whereas Tensor cores are specifically intended to speed up the training of neural networks.

You can find more information about the V100 by visiting https://www.nvidia.com/en-gb/data-center/tesla-v100/.

.. note::
  Eventually we may create a dedicated Slurm queues to handle GPU jobs, but for now access is via the normal CPU queues.

Whenever you login or run a script on a GPU node, your path will be modified to include Nvidia's cuda platform. This will be required if compiling any programs from source, for example using the ``nvcc`` compiler. Most of the system's cuda files can be found at ``/usr/local/cuda/bin``.

To see the current state (and power usage) of the Tesla card, run::
  
  $ nvidia-smi

  +-----------------------------------------------------------------------------+
  | NVIDIA-SMI 418.39       Driver Version: 418.39       CUDA Version: 10.1     |
  |-------------------------------+----------------------+----------------------+
  | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
  | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
  |===============================+======================+======================|
  |   0  Tesla V100-PCIE...  Off  | 00000000:3B:00.0 Off |                    0 |
  | N/A   29C    P0    35W / 250W |     25MiB / 16130MiB |      4%      Default |
  +-------------------------------+----------------------+----------------------+
  
  +-----------------------------------------------------------------------------+
  | Processes:                                                       GPU Memory |
  |  GPU       PID   Type   Process name                             Usage      |
  |=============================================================================|
  |    0     29056      C   ./bandwidthTest                               14MiB |
  +-----------------------------------------------------------------------------+
