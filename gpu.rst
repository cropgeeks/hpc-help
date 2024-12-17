GPU Processing
==============

The cluster contains three nodes with **Nvidia GPU** co-processors to accelerate CPUs for general-purpose scientific and engineering computing.

- ``aragog`` ``buckbeak`` ``crookshanks`` ``dobby`` ``fawkes`` ``hedwig`` ``peeves`` ``pigwidgeon`` and ``nagini`` contain quad Ampere A100 cards, each with 80 GB of dedicated GPU memory
- ``angel`` ``anya`` ``darla`` ``drusilla`` ``lorne`` and ``spike`` contain dual L40S cards, each with 48GB of dedicated GPU memory
- ``thanos`` contains dual Tesla V100 cards, each with 32 GB of dedicated GPU memory (only available via himem queue)
- ``jaws`` contains a single Tesla V100 card with 16 GB of dedicated GPU memory (currently unavailable)
- ``twiki`` contains dual Quadro RTX 8000 cards, each with 48 GB of dedicated GPU memory (currently unavailable)

.. warning::
  As of June 2023 ``thanos`` is no longer part of the ``gpu`` queue but its GPUs remain accessible for now. The ``jaws`` and ``twiki`` nodes are currently not available.

The Ampere cards each have 6,912 **CUDA** processing cores and 432 **Tensor** cores. 
The L40S cards each have 18,176 **CUDA** processing cores and 568 **Tensor** cores.
The Tesla cards each have 5,120 **CUDA** processing cores and 640 **Tensor** cores. 
The RTX cards have 4,608 **CUDA** processing cores and 576 **Tensor** cores. 

CUDA is Nvidia's parallel computing platform and API for general GPU processing, whereas Tensor cores are specifically intended to speed up the training of neural networks.

More information about the cards is available at https://www.nvidia.com/en-us/data-center/a100/, https://www.nvidia.com/en-gb/data-center/l40s/ https://www.nvidia.com/en-gb/data-center/tesla-v100/, and https://www.nvidia.com/en-gb/design-visualization/quadro/rtx-8000/.

To access the GPUs, you must both submit to the ``gpu`` Slurm partition and specify how many GPUs you require. For example, to run a basic interactive job::

  $ srsh --partition=gpu --gpus=1

.. note::
  Slurm is configured to allocate GPU resources at the level of whole GPUs (rather than CUDA cores), therefore you can request ``--gpus=1`` (all nodes), ``--gpus=2`` (``twiki``, ``pigwidgeon`` and ``nagini``), or ``--gpus=3|4`` (``pigwidgeon`` and ``nagini`` only).

See also Slurm's documentation on `Generic Resource Scheduling <https://slurm.schedmd.com/gres.html#Running_Jobs>`_.

You can also specify the exact type of GPU you need, for example to request a single RTX8000 card::

  $ srsh --partition=gpu --gpus=rtx_8000:1

The possible cards are defined as follows:

- ``v100-pcie-16g`` - Tesla V100 16 GB 
- ``v100-pcie-32g`` - Tesla V100 32 GB 
- ``rtx_8000`` - Quadro RTX 8000 48 GB
- ``a100-sxm4-80gb`` - Ampere A100 80GB

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

Whenever you run a job on a GPU node, your path will be modified to include Nvidia's CUDA platform. This will be required if compiling any programs from source, for example using the ``nvcc`` compiler. Most of the system's CUDA files can be found at ``/usr/local/cuda/bin``.


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>
