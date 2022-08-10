---
layout: default
title: Batch API
parent: API Specification
grand_parent: Documentation
nav_order: 1
---

# Batch API
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
Batch API can be used to work with running Batch extensions in the M3 Business Engine. This API can retrieve a unique ID or reference ID of running jobs.

## Features
Usage of Batch API is depended on another API, because Batch is working in the background. In below examples, data from a Batch extension is being retrieved using both the Batch API and the Logger API.

### batch.getJobId()
Returns the value of a unique job id for each batch extension execution. The id in this case is being generated automatically in UUID format (ex. 2147c32b-4471-48d2-8083-2f28add463d1).
<br>


Example:
```groovy
  public class EXT005 extends ExtendM3Batch {
    private final LoggerAPI logger
    private final BatchAPI batch
  
  public EXT005(LoggerAPI logger, BatchAPI batch) {
    this.logger = logger
    this.batch = batch
  }
  
  public void main() {  
    logger.info("Uuid:" + batch.getJobId().get()) // batch.getReferenceId().get() if there is a need to retrieve an ID as a String type value for usage
    // Batch work result is being saved in the Log file
  }
}
```
<br>
The result of the program should be available inside the log file as "Uuid: 2147c32b-4471-48d2-8083-2f28add463d1" (Randomly generated UUID number).

### batch.getReferenceId()
Returns the value of an optional reference id sent by user when submitting the batch extension. Reference IDs are in UUID format (ex. 2147c32b-4471-48d2-8083-2f28add463d1). 

Example:
```groovy
  public class EXT005 extends ExtendM3Batch {
    private final LoggerAPI logger
    private final BatchAPI batch
  
  public EXT005(LoggerAPI logger, BatchAPI batch) {
    this.logger = logger
    this.batch = batch
  }
  
  public void main() {  
    logger.info("Uuid:" + batch.getReferenceId()) 
    // Batch work result is being saved in the Log file
  }
}
```
<br>
The result of the program should be available inside the log file as "Uuid: 2147c32b-4471-48d2-8083-2f28add463d1" (Inputed UUID number from another extension).

## Considerations and Guidelines
It is a very good practice to learn about [Batch Extension](../../../examples/Batch-extension) first to understand the full potential of the Batch API.
