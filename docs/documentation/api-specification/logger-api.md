---
layout: default
title: Logger API
parent: API Specification
grand_parent: Documentation
nav_order: 3
---

# Logger API
{: .no_toc }

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
This API provides capabilities for logging information with different severity level from DEBUG to ERROR. <br>
The information that is logged can be seen by both network administrators as well as the user directly in the Ming.le portal. <br>
The only requirement for viewing these logs is that the user has access to the M3 Business Engine Jobs and M3 Business Engine Logs from the administration tools.

## Features
Logging API contains various features, or levels to send logs to.<br>
The log count is per program execution.<br>
Logs have a soft limit of 1000 lines and a hard limit of 2000 lines. All severity levels except DEBUG and TRACE count towards the soft limit, after soft limit has been surpassed all subsequent logs will be forwarded to DEBUG.<br>
<br>
**Examples:**<br>
The program starts writing to INFO severity level, after 1000 written lines the logs are written to DEBUG severity level until the sum of the two reach 2000 lines.<br>
The program starts writing to TRACE severity level, after 2000 written lines no more logs are written.<br>
<br>
**Exception**<br>
In the case that 'Future Logging' has been selected for a job, with option 'Log to File', the soft limit is increased to 10000 records and the hard limit to 20000 records.

### Severity Levels
* INFO: Soft limit, 1000 lines
* WARN: Soft limit, 1000 lines
* ERROR: Soft limit, 1000 lines
* DEBUG: Hard limit, 2000 lines
* TRACE: Hard limit, 2000 lines

### Example Code
To log a message, simply use the method corresponding to the level you would like to use. For example to write with INFO
level you can write:
```groovy
logger.info("Extension started");
```

You can also use the Groovy string (aka _gstring_) to perform string manipulation and replace parameter values in messages
as followed:
```groovy
String user = program.getUser();
if (user != "USERNAME") {
  logger.warn("Extension cannot be run for ${user}, only 'USERNAME' is allowed!");
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
