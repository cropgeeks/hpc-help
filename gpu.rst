GPU Processing
==============

The cluster contains two nodes (``jaws``, not yet setup) and (``thanos``, available now) with **Nvidia Tesla V100 GPU** co-processors to accelerate CPUs for general-purpose scientific and engineering computing.

- ``jaws`` contains a single card with 16GB of dedicated GPU memory
- ``thanos`` contains dual cards, each with 32GB of dedicated GPU Memory

Each card has 5,120 **CUDA** processing cores and 640 **Tensor** cores. CUDA is Nvidia's parallel computing platform and API for general GPU processing, whereas Tensor cores are specifically intended to speed up the training of neural networks.

You can find more information about the V100 by visiting https://www.nvidia.com/en-gb/data-center/tesla-v100/.

To access the GPUs submit to the ``gpu`` SLURM partition. SLURM is configured to allocate GPU resources at the level of whole GPUs (rather than CUDA cores), therefore for ``thanos`` you can request one or both of the GPUs, and for ``jaws`` you can request a single GPU. ``thanos`` is also the high memory node, therefore it has two partitions, one for high memory jobs and one for GPU jobs. Currently the gpu partition has 70G of RAM assigned to it and 16 cpus, therefore the maximum resources you can allocate to a single GPU job are::

  --partition=gpu --mem=70G --cpus-per-task=16 --gpus=2

See also the SLURM documentation, (although as we only have one type of GPU at present there is little need to do anything more than just ask for one or two GPUs): https://slurm.schedmd.com/gres.html#Running_Jobs

Whenever you run a job on a GPU node, your path will be modified to include Nvidia's cuda platform. This will be required if compiling any programs from source, for example using the ``nvcc`` compiler. Most of the system's cuda files can be found at ``/usr/local/cuda/bin``.

To see the current state (and power usage) of the Tesla card, run::

  $ nvidia-smi

  +-----------------------------------------------------------------------------+
  | NVIDIA-SMI 440.33.01    Driver Version: 440.33.01    CUDA Version: 10.2     |
  |-------------------------------+----------------------+----------------------+
  | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
  | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
  |===============================+======================+======================|
  |   0  Tesla V100-PCIE...  Off  | 00000000:25:00.0 Off |                    0 |
  | N/A   28C    P0    36W / 250W |      0MiB / 32510MiB |      0%      Default |
  +-------------------------------+----------------------+----------------------+
  |   1  Tesla V100-PCIE...  Off  | 00000000:C8:00.0 Off |                    0 |
  | N/A   27C    P0    37W / 250W |      0MiB / 32510MiB |      0%      Default |
  +-------------------------------+----------------------+----------------------+

  +-----------------------------------------------------------------------------+
  | Processes:                                                       GPU Memory |
  |  GPU       PID   Type   Process name                             Usage      |
  |=============================================================================|
  |  No running processes found                                                 |
  +-----------------------------------------------------------------------------+
