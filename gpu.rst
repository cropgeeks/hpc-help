GPU Processing
==============

The cluster contains many nodes with **Nvidia GPU** co-processors to accelerate CPUs for general-purpose scientific and engineering computing.

It has nodes with:

- **4x Ampere A100 (80 GB)** - 9 nodes in total
- **2x Lovelace L40S (48 GB)** - 6 nodes in total
- **2x Quadro RTX 8000 (48 GB)** - 1 node in total
- **2x Tesla V100 (32 GB)** - 1 node in total

The Ampere cards each have 6,912 **CUDA** processing cores and 432 **Tensor** cores. 
The L40S cards each have 18,176 **CUDA** processing cores and 568 **Tensor** cores.
The Tesla cards each have 5,120 **CUDA** processing cores and 640 **Tensor** cores. 
The RTX cards have 4,608 **CUDA** processing cores and 576 **Tensor** cores. 

CUDA is Nvidia's parallel computing platform and API for general GPU processing, whereas Tensor cores are specifically intended to speed up the training of neural networks.

More information about the cards is available at https://www.nvidia.com/en-us/data-center/a100/, https://www.nvidia.com/en-gb/data-center/l40s/ https://www.nvidia.com/en-gb/data-center/tesla-v100/, and https://www.nvidia.com/en-gb/design-visualization/quadro/rtx-8000/.

To access the GPUs, you must both submit to the ``gpu`` Slurm partition and specify how many GPUs you require. For example, to run a basic interactive job::

  $ srsh --partition=gpu --gpus=1

.. note::
  Slurm is configured to allocate GPU resources at the level of whole GPUs (rather than CUDA cores), therefore you can request ``--gpus=1``, ``--gpus=2``, or ``--gpus=3|4`` depending on the GPU type requested.

See also Slurm's documentation on `Generic Resource Scheduling <https://slurm.schedmd.com/gres.html#Running_Jobs>`_.

You can also specify the exact type of GPU you need, for example to request a single RTX8000 card::

  $ srsh --partition=gpu --gpus=rtx8000:1

The possible cards are defined as follows:

- ``a100`` - Ampere A100 80 GB
- ``l40s`` - Lovelace L40S 48 GB
- ``rtx_8000`` - Quadro RTX 8000 48 GB
- ``v100`` - Tesla V100 32 GB 

To see the current state (and power usage) of the GPUs, run ``nvidia-smi``, eg::

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

.. note::
  While CUDA drivers exist on all GPU nodes, there is no CUDA toolkit installed. If you need this, eg for compiling, you should add it yourself via :doc:`bioconda`, using ``conda install cuda``.


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>

