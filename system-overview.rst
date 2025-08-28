System Overview
===============

You can monitor the current state of the cluster using:

- https://www.cropdiversity.ac.uk/top - job/allocation based overview
- https://ganglia.cropdiversity.ac.uk - detailed stats per node

.. note::
  Everything listed below is connected together over a super-fast 100-gigabit fibre optic network.
  
Compute cluster
---------------

The tables below list the various batches of hardware the make up the current cluster, with each set of nodes named something 'fun' on a (geeky) thematic basis.

- **Year**: 2024
- **Theme**: Buffy the Vampire Slayer
- **Hardware**: Dell PowerEdge R6625 (12x) and R7625 (6x)
- **CPUs/GPUs**: 4th-Gen AMD EPYC (Genoa) / Nvidia Lovelace
- **Capacity**: 1,152 CPU cores (2,304 threads), 109,056 Cuda cores, and 3,408 Tensor cores

==============  =======================  =============  ======  ============
Name            CPUs                     GPUs           Memory  Disk
==============  =======================  =============  ======  ============
angel           2x 9334 @2.7Ghz 32C/64T  2x L40S 48 GB  384 GB  1.9 TB (SSD)
anya            2x 9334 @2.7Ghz 32C/64T  2x L40S 48 GB  384 GB  1.9 TB (SSD)
buffy           2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
cordelia        2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
darla           2x 9334 @2.7Ghz 32C/64T  2x L40S 48 GB  384 GB  1.9 TB (SSD)
dawn            2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
doyle           2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
drusilla        2x 9334 @2.7Ghz 32C/64T  2x L40S 48 GB  384 GB  1.9 TB (SSD)
faith           2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
fred            2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
giles           2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
gunn            2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
lorne           2x 9334 @2.7Ghz 32C/64T  2x L40S 48 GB  384 GB  1.9 TB (SSD)
spike           2x 9334 @2.7Ghz 32C/64T  2x L40S 48 GB  384 GB  1.9 TB (SSD)
tara            2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
wesley          2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
willow          2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
xander          2x 9334 @2.7Ghz 32C/64T                 384 GB  1.9 TB (SSD)
==============  =======================  =============  ======  ============

- **Year**: 2023
- **Theme**: Harry Potter
- **Hardware**: Dell PowerEdge R6525 (39x) and XE8545 (9x)
- **CPUs/GPUs**: 3rd-Gen AMD EPYC (Milan) / Nvidia Ampere
- **Capacity**: 2,496 CPU cores (4,992 threads), 248,832 Cuda cores, and 15,552 Tensor cores

==============  =======================  ================  ======  ============
Name            CPUs                     GPUs              Memory  Disk
==============  =======================  ================  ======  ============
aragog          2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
black           2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
buckbeak        2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
carrow          2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
chang           2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
crabbe          2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
crookshanks     2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
delacour        2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
diggory         2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
dobby           2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
dumbledore      2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
dursley         2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
fawkes          2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
filch           2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
flitwick        2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
goyle           2x 7543 @2.8Ghz 32C/64T                    512 GB  1.7 TB (SSD)
granger         2x 7543 @2.8Ghz 32C/64T                    512 GB  1.7 TB (SSD)
greyback        2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
grindelwald     2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
gryffindor      2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
hagrid          2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
hedwig          2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     1.0 TB  1.7 TB (SSD)
hufflepuff      2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
karkaroff       2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
krum            2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
lestrange       2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
lockhart        2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
longbottom      2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
lovegood        2x 7543 @2.8Ghz 32C/64T                    512 GB  1.7 TB (SSD)
lupin           2x 7543 @2.8Ghz 32C/64T                    512 GB  1.7 TB (SSD)
malfoy          2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
mcgonagall      2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
moody           2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
nagini          2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
ollivander      2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
peeves          2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
pettigrew       2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
pigwidgeon      2x 7543 @2.8GHz 32C/64T  4x A100 80 GB     512 GB  1.7 TB (SSD)
potter          2x 7543 @2.8Ghz 32C/64T                    2.0 TB  1.7 TB (SSD)
quirrell        2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
ravenclaw       2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
slughorn        2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
slytherin       2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
snape           2x 7543 @2.8Ghz 32C/64T                    256 GB  1.7 TB (SSD)
tonks           2x 7543 @2.8Ghz 32C/64T                    512 GB  1.7 TB (SSD)
umbridge        2x 7543 @2.8Ghz 32C/64T                    512 GB  1.7 TB (SSD)
voldemort       2x 7543 @2.8GHz 32C/64T                    4.0 TB  1.7 TB (SSD)
weasley         2x 7543 @2.8Ghz 32C/64T                    2.0 TB  1.7 TB (SSD)
==============  =======================  ================  ======  ============


- **Year**: 2021
- **Theme**: Buck Rogers
- **Hardware**: Dell PowerEdge R7525 (2x)
- **CPUs/GPUs**: 2nd-Gen AMD EPYC (Rome) / Nvidia Quadro
- **Capacity**: 80 CPU cores (160 threads), 9,216 Cuda cores, and 1,152 Tensor cores

==============  =======================  ================  ======  ============
Name            CPUs                     GPUs              Memory  Disk
==============  =======================  ================  ======  ============
buck            2x 7502 @2.5GHz 32C/64T                    2.0 TB  1.3 TB (SSD)
twiki           2x 7252 @3.1GHz 8C/16T   2x RTX 8000 48GB  256 GB  900 GB (SSD)
==============  =======================  ================  ======  ============


- **Year**: 2019 (October)
- **Theme**: Marvel Cinematic Universe
- **Hardware**: Dell PowerEdge C6420 (48x) and R940xa (1x)
- **CPUs/GPUs**: 2nd-Gen Intel Xeon Scalable (Cascade Lake)
- **Capacity**: 1,600 CPU cores (3,200 threads)

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
thanos          4x Gold 6242 @2.8Ghz 16C/32T                  3.0 TB  1.3 TB (SSD) 
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
- **CPUs/GPUs**: 1st-Gen Intel Xeon Scalable (Skylake) / Nvidia Tesla 
- **Capacity**: 80 CPU cores (160 threads), 5,120 Cuda cores, and 640 Tensor cores

==============  ==============================  =============  ======  ============
Name            CPUs                            GPUs           Memory  Disk
==============  ==============================  =============  ======  ============
jaws            2x Silver 4116 @2.1GHz 12C/24T  2x V100 32GB   192 GB  1.3 TB (SSD)
oddjob          2x Gold 6132 @2.6GHz 14C/28T                   384 GB  1.3 TB (SSD)
nicknack        2x Gold 6132 @2.6GHz 14C/28T                   384 GB  1.3 TB (SSD)
==============  ==============================  =============  ======  ============


- **Year**: 2017 (EOL)
- **Theme**: Battlestar Galactica
- **Hardware**: Dell PowerEdge R630 (3x)
- **CPUs**: Intel E5 v4 (Broadwell)
- **Capacity**: 84 CPU cores (168 threads)

==============  ==============================  =============  ======  ============
Name            CPUs                            GPUs           Memory  Disk
==============  ==============================  =============  ======  ============
apollo          2x E5-2680 v4 @2.4GHz 14C/24T                  1.5 TB  370 GB (SSD)
boomer          2x E5-2680 v4 @2.4GHz 14C/24T                  256 GB  370 GB (SSD)
starbuck        2x E5-2680 v4 @2.4GHz 14C/24T                  256 GB  370 GB (SSD)
==============  ==============================  =============  ======  ============

Storage, backup, and archive
----------------------------

The BeeGFS storage array runs alongside the cluster, however the backup and archive systems are located in another location for redundancy.

- **Year**: 2019 (October)
- **Theme**: Back to the Future / Discworld
- **Hardware**: Dell PowerEdge R740xa (4x), MD1400 (4x), R640 (1x), and ME484 (1x)
- **CPUs**: 2nd-Gen Intel Xeon Scalable (Cascade Lake)
- **Capacity**: 1.7 PB (storage) and 1.0 PB (backup)

===============  ==============================  ======  ============
Name             CPUs                            Memory  Disk
===============  ==============================  ======  ============
delorean         2x Silver 4208 @2.1GHz 8C/16T   256 GB  1.0 PB (HDD)
librarian        2x Silver 4208 @2.1GHz 8C/16T   192 GB  3.8 TB (SSD)
rincewind        2x Silver 4210 @2.2GHz 10C/20T  96 GB   432 TB (HDD)
twoflower        2x Silver 4210 @2.GHz 10C/20T   96 GB   432 TB (HDD)
death            2x Silver 4210 @2.2GHz 10C/20T  96 GB   432 TB (HDD)
luggage          2x Silver 4210 @2.GHz 10C/20T   96 GB   432 TB (HDD)
===============  ==============================  ======  ============

- **Year**: 2023
- **Theme**: Destiny / Back to the Future
- **Hardware**: Dell PowerEdge R7525 (5x), ME5084 (5x), and ME5024 (1x)
- **CPUs**: 3rd-Gen AMD EPYC (Milan)
- **Capacity**: 5.2 PB (storage) and 1.3 PB (backup)

===============  =======================  ======  ============
Name             CPUs                     Memory  Disk
===============  =======================  ======  ============
cayde            2x 7313 @3.0GHz 16C/32T  256 GB  46 TB (SSD)
docbrown         2x 7313 @3.0GHz 16C/32T  256 GB  1.3 PB (HDD)
ikora            2x 7313 @3.0GHz 16C/32T  256 GB  46 TB (SSD)
shaxx            2x 7313 @3.0GHz 16C/32T  256 GB  2.6 PB (HDD)
zavala           2x 7313 @3.0GHz 16C/32T  256 GB  2.6 PB (HDD)
===============  =======================  ======  ============

- **Year**: 2024
- **Theme**: Destiny / Back to the Future
- **Hardware**: Dell PowerEdge R7525 (3x), ME5084 (4x)
- **CPUs**: 3rd-Gen AMD EPYC (Milan)
- **Capacity**: 3.2 PB (storage) and 1.3 PB (backup)

===============  =======================  ======  ============
Name             CPUs                     Memory  Disk
===============  =======================  ======  ============
---              2x 9124 @3.0GHz 16C/32T  192 GB  1.6 PB (HDD)
---              2x 9124 @3.0GHz 16C/32T  192 GB  1.6 PB (HDD)
marty            2x 7313 @3.0GHz 16C/32T  256 GB  1.3 PB (HDD)
===============  =======================  ======  ============

Virtual infrastructure
----------------------

The rest of the infrastructure runs on VMWare ESXi hosts, with various virtual machines (VMs) for handling web servers and applications, databases, domain control, monitoring, remote access, etc. Although they have a small amount of local disk, the VMs primarily use a separate Storage Area Network (SAN) with 30 TB of capacity.

- **Year**: 2019 (October) and 2023
- **Hardware**: Dell PowerEdge R640 (2x), R7525 (2x), and ME5024 (1x)
- **CPUs**: 2nd-Gen Intel Xeon Scalable (Cascade Lake) and 3rd-Gen AMD EPYC (Milan)

==============  ==============================  ======  ============
Name            CPUs                            Memory  Disk
==============  ==============================  ======  ============
hpcvmh01        2x Gold 6242 @2.8G 16C/32T      384 GB  240 GB (SSD)
hpcvmh02        2x Gold 6242 @2.8G 16C/32T      384 GB  240 GB (SSD)
hpcvmh03        2x 7543 @2.8G 16C/32T           512 GB  480 GB (SSD)
hpcvmh04        2x 7543 @2.8G 16C/32T           512 GB  480 GB (SSD)
==============  ==============================  ======  ============


.. raw:: html
   
   <script defer data-domain="cropdiversity.ac.uk" src="https://plausible.hutton.ac.uk/js/plausible.js"></script>



