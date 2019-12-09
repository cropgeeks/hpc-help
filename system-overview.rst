System Overview
===============

You can monitor the current state of the cluster at https://ganglia.cropdiversity.ac.uk

.. note::
  Everything listed below is connected together over a super-fast 25-gigabit fibre optic network. 

Compute cluster
---------------

The tables below lists the various batches of hardware the make up the current cluster, with each set of nodes named something 'fun' on a (geeky) thematic basis.

- **Year**: 2019 (October)
- **Theme**: Marvel Cinematic Universe
- **Hardware**: Dell PowerEdge C6420 (48x) and R940xa (1x)
- **CPUs/GPUs**: 2nd-Gen Intel Xeon Scalable (Cascade Lake) / Nvidia Tesla
- **Capacity**: 3,200 (hyperthreaded) CPU cores, 10,240 Cuda cores, and 1,280 Tensor cores

==============  ==============================  ============  ======  ============
Name            CPUs                            GPUs          Memory  Disk
==============  ==============================  ============  ======  ============
abomination     2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
antman          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
blackpanther    2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
blackwidow      2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
captainamerica  2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
captainmarvel   2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
crossbones      2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
doctorstrange   2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
drax            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
ego             2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
falcon          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
gamora          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
ghost           2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
groot           2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
hawkeye         2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
heimdall        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
hela            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
hulk            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
ironman         2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
kaeciliu        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
killmonger      2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
loki            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
malekith        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
mandarin        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
mantis          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
mysterio        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
nebula          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
odin            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
quicksilver     2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
redskull        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
rocket          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
ronan           2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
scarletwitch    2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
spiderman       2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
starlord        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
taserface       2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
thanos          4x Gold 6242 @2.8Ghz 16C/32T    2x V100 32GB  3.0 TB  1.3 TB (SSD) 
thor            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
ultron          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
valkyrie        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
vision          2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
vulture         2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
warmachine      2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
wasp            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
whiplash        2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
wintersolider   2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
wong            2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
yellowjacket    2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
yondu           2x Silver 4216 @2.1Ghz 16C/32T                192 GB  1.3 TB (SSD)
==============  ==============================  ============  ======  ============


- **Year**: 2019 (March)
- **Theme**: Bond Villians
- **Hardware**: Dell PowerEdge R640 (2x) and R740 (1x)
- **CPUs/GPUs**: 1nd-Gen Intel Xeon Scalable (Skylake) / Nvidia Tesla 
- **Capacity**: 160 (hyperthreaded) CPU cores, 5,120 Cuda cores, and 640 Tensor cores

==============  ==============================  =============  ======  ============
Name            CPUs                            GPUs           Memory  Disk
==============  ==============================  =============  ======  ============
jaws            2x Silver 4116 @2.1GHz 12C/24T  1x V100 16GB   192 GB  900 GB (SSD)
oddjob          2x Gold 6132 @2.6GHz 14C/28T                   384 GB  1.3 TB (SSD)
nicknack        2x Gold 6132 @2.6GHz 14C/28T                   384 GB  1.3 TB (SSD)
==============  ==============================  =============  ======  ============


- **Year**: 2017
- **Theme**: Battlestar Galactica
- **Hardware**: Dell PowerEdge R630 (3x)
- **CPUs**: Intel E5 v4 (Broadwell)
- **Capacity**: 168 (hyperthreaded) CPU cores

==============  ==============================  =============  ======  ============
Name            CPUs                            GPUs           Memory  Disk
==============  ==============================  =============  ======  ============
apollo          2x E5-2680 v4 @2.4GHz 14C/24T                  1.5 TB  370 GB (SSD)
boomer          2x E5-2680 v4 @2.4GHz 14C/24T                  256 GB  370 GB (SSD)
starbuck        2x E5-2680 v4 @2.4GHz 14C/24T                  256 GB  370 GB (SSD)
==============  ==============================  =============  ======  ============

Storage and backup
------------------

The BeeGFS storage array runs alongside the cluster, however the backup system is located in another location for redundancy.

- **Year**: 2019 (October)
- **Theme**: Back to the Future
- **Hardware**: Dell PowerEdge R740xa (4x), MD1400 (4x), R640 (1x), and ME484 (1x)
- **CPUs**: 2nd-Gen Intel Xeon Scalable (Cascade Lake)
- **Capacity**: 1.5 PB (storage) and 1.0 PB (backup)

==============  ==============================  ======  ============
Name            CPUs                            Memory  Disk
==============  ==============================  ======  ============
delorean        2x Silver 4208 @2.1G 8C/16T      32 GB  240 GB (SSD)
delorean (exp)                                          1.0 PB (HDD)
metadata        2x Silver 4208 @2.1G 8C/16T     192 GB  3.8 TB (SSD)
beegfs 1        2x Silver 4210 @2.2G 10C/20T     96 GB  288 TB (HDD)
beegfs 2        2x Silver 4210 @2.2G 10C/20T     96 GB  288 TB (HDD)
beegfs 3        2x Silver 4210 @2.2G 10C/20T     96 GB  288 TB (HDD)
beegfs 4        2x Silver 4210 @2.2G 10C/20T     96 GB  288 TB (HDD)
beegfs 1 (exp)                                          144 TB (HDD)
beegfs 2 (exp)                                          144 TB (HDD)
beegfs 3 (exp)                                          144 TB (HDD)
beegfs 4 (exp)                                          144 TB (HDD)
==============  ==============================  ======  ============



Virtual infrastructure
----------------------

The rest of the infrastructure runs on VMWare ESXi hosts, with various virtual machines (VMs) for handling web servers and applications, databases, domain control, monitoring, remote access, etc. Although they have a small amount of local disk, the VMs primarily use a separate Storage Area Network (SAN) for data.

- **Year**: 2019 (October)
- **Hardware**: Dell PowerEdge R640 (2x)
- **CPUs**: 2nd-Gen Intel Xeon Scalable (Cascade Lake)

==============  ==============================  ======  ============
Name            CPUs                            Memory  Disk
==============  ==============================  ======  ============
???             2x Gold 6242 CPU @2.8G 16C/32T  384 GB  240 GB (SSD)
???             2x Gold 6242 CPU @2.8G 16C/32T  384 GB  240 GB (SSD)
==============  ==============================  ======  ============
