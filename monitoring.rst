Monitoring & Tracking
=====================

Real-time metrics
-----------------

You can view a real-time overview of the cluster's status, job allocations, and power draw by clicking on the following link:

https://www.cropdiversity.ac.uk/top

  |top|

For a more detailed look at server load and network metrics etc, use Ganglia:

https://ganglia.cropdiversity.ac.uk
  
  |ganglia|

The Ganglia graphs are split into three sections: the **HPC** nodes, the **Storage** servers, and other **System** (management, domain-control etc) servers.


Disk-usage summaries
--------------------

TODO

Public servers
--------------

We remotely monitor the status of various public-facing servers using UptimeRobot.

https://status.cropdiversity.ac.uk/

  |uptimerobot|
  

.. |top| image:: media/top.png
.. |ganglia| image:: media/ganglia.png
.. |uptimerobot| image:: media/uptimerobot.png


Login attempts
--------------

You can see where in the world people are logging into ``gruffalo`` using the map below:

https://cropdiversity.ac.uk/botplot

  |botplot|

.. |botplot| image:: media/botplot.png

Each pin represents a location where one or more IP addresses have attempted to log in (tracked over the last seven days). Successfull logins are coloured green, and unsuccessfull logins are coloured red, with the opacity of the pin fading over time, ie, more solid pins represent more recent attempts.
