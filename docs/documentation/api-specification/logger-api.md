---
layout: default
title: Logger API
parent: API Specification
grand_parent: Documentation
nav_order: 3
---

# Logger API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Since**: `0.1.0`  
**Context**: Any  
**Category**: Generic  
---
## Description
This API provides capabilities for logging information of various severity levels from DEBUG to ERROR. The information that is logged can be seen by both network administrators and users directly in the Ming.le portal. The only requirement for viewing these logs is that the user has access to M3 Business Engine Jobs and the M3 Business Engine Logs from administration tools.


## Features

### Logging information
To log a message, simply use the method corresponding to the level you would like to use. For example to write with INFO
level you can write
```groovy
logger.info("Extension started")
```

You can also use the Groovy string (aka _gstring_) to perform string manipulation and replace parameter values in messages
as followed
```groovy
String user = program.getUser()
if (user != "DARTHVADER") {
  logger.warn("Extension cannot be run for ${user}, only Darth Vader is allowed!")
}
```

This will replace the parameter with its value in the string and it is a better way of handling messages.

## Considerations and Guidelines
For debugging, troubleshooting and understanding the runtime flow of extensions use logger to log important
actions and contexts in the scripts. Consider following points when using logger API:

* Log messages can be seen by users with M3BE-FndUser or M3BE-FndAdmin IFS roles along with M3BE-LogEnabler. Without
    these M3 Business Engine Jobs/Logs will not be visibile in Adminsistration tools and logs cannot be seen
* To see the logs, configure the logging on the job that is running now and extension is connected to in the M3 Business
    Engine Jobs adminstration tool
* Use INFO/WARN/ERROR levels very sparingly. Stick to debug as long as possible as debug logs are not turned on by
    default but the other three are and can result in exponential increase of log sizes on cloud environment
* Use Groovy string manipulation for better and more proper log messages
