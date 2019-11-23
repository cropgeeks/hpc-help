Service Level Agreement
=======================

This resource is managed by teams from JHI and NIAB. While we will endeavour to ensure it is available and online as much as possible, there are certain scenarios - listed below - that could affect system uptime, and some of these are unfortunately beyond our control.


Maintenance and patching
------------------------

Like any computing system, our HPC resource relies on operating systems and software that will need updates or patches from time to time. Many of these can be applied silently in the background and will have no noticeable affect, but there are certain cases - particularly with regards to the parallel storage array - where we may need to take the entire system offline to ensure we can update it safely and correctly.

.. important:: 
  If we plan any major upgrades or changes that require the system to be taken offline, we will communicate them to you with as much notice (ie at least several weeks) as is possible.


Cyber Essentials Plus
---------------------

The James Hutton Institute has Cyber Essentials Plus certification, which places certain obligations upon us in terms of how we manage and run IT infrastructure. One key area concerns the patching of systems when vulnerabilities are fixed; we are expected to apply patches described as 'critical' or 'high risk' within 14 days of an update being released.

.. important:: 
  We `may` have to take components offline for patching at short notice if we deem it necessary.

In reality (and based on prior experience) this is likely to be very rare, but you should be aware that it `could` happen and should plan any very long running jobs accordingly.


Hardware failure
----------------

#$%@ happens, it's a fact of life. While there is a certain level of redundancy built into the system, failures of one or more key components could affect the uptime of the system.

.. important::
  Our agreement with Dell should see any failed hardware replaced 'next working day', however the severity of any failure will ultimately dictate how long it'll take to get the system (or any failed sub-system) up and running again.


Power failure
-------------

The majority of our hardware is protected by uninterruptable power supply (UPS) units that can maintain power in the event of an external power failure, however, the cluster's electrical-draw when running at full capacity is significant and it may drain UPS capacity before the backup generator can take over.

.. important::
  The system may automatically shut itself down (in order to protect critical file systems and disks) if we experience an unexpected loss of power.

Obviously, any running jobs will be terminated without warning if this were to happen.
