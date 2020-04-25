Server Monitoring
=================

Real-time metrics
-----------------

You can view real-time metrics (load, network activity, etc) for all of the cluster's servers by clicking on the following link:

https://ganglia.cropdiversity.ac.uk
  
  |ganglia|

The graphs are split into three sections: the **HPC** nodes, the **Storage** servers, and other **System** (management, domain-control etc) servers.


Disk-usage summaries
--------------------

TODO

Public servers
--------------

We remotely monitor the status of various public-facing servers using UptimeRobot.

https://status.cropdiversity.ac.uk/

  |uptimerobot|
  

.. |ganglia| image:: media/ganglia.png
.. |uptimerobot| image:: media/uptimerobot.png


Login attempts
--------------

You can see where in the world people are logging into ``gruffalo`` using the map below:

https://cropdiversity.ac.uk/botplot

  |botplot|

.. |botplot| image:: media/botplot.png

Each pin represents a location where one or more IP addresses have attempted to log in (tracked over the last seven days). Successfull logins are coloured green, and unsuccessfull logins are coloured red, with the opacity of the pin fading over time, ie, more solid pins represent more recent attempts.
