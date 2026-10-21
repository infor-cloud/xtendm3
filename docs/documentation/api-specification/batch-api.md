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
**Since**: `0.23` <br>
**Context**: Any <br>
**Category**: Generic  
---

## Description
The Batch API can be used to work with running Batch extensions in the M3 Business Engine. This API can retrieve a unique ID or reference ID of running jobs. <br>
This API can only be injected into Batch type extensions.

## Methods
Methods available for the Batch API.

### getJobId()
Returns the value of a unique job id for each batch extension execution. The id in this case is being generated automatically in UUID format (ex. 2147c32b-4471-48d2-8083-2f28add463d1).
<br>

**Returns:**
* String - unique Batch job ID

**Example:**
```groovy
public class EXT005 extends ExtendM3Batch {
  private final LoggerAPI logger;
  private final BatchAPI batch;
  
  public EXT005(LoggerAPI logger, BatchAPI batch) {
    this.logger = logger;
    this.batch = batch;
  }
  
  public void main() {  
    String jobID = batch.getJobId();
    logger.debug("Job ID:" + jobID);

    ...
  }
}
```

### getReferenceId()
Returns the value of an optional reference id sent by user when submitting the batch job. Reference IDs are in UUID format (ex. 2147c32b-4471-48d2-8083-2f28add463d1). 

**Returns:**
* Optional<String> - selected reference ID

**Example:**
```groovy
public class EXT005 extends ExtendM3Batch {
  private final LoggerAPI logger;
  private final BatchAPI batch;
  
  public EXT005(LoggerAPI logger, BatchAPI batch) {
    this.logger = logger;
    this.batch = batch;
  }
  
  public void main() {  
    String referenceID = batch.getReferenceId();
    logger.debug("Reference ID:" + referenceID);

    ...
  }
}
```

## Considerations and Guidelines
Good practice to learn about [Batch Extension](../../../examples/Batch-extension) first to understand the full potential of the Batch API.
