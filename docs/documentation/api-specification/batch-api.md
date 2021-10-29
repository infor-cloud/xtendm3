---
layout: default
title: Batch API
parent: API Specification
grand_parent: Documentation
nav_order: 1
---

# Batch API
{: .no_toc }

![](/assets/images/warning-24px.svg)

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
Batch API can be used to work with Batch extensions running in the M3 Business Engine. This API can retrieve a unique ID of running jobs or refernce ID. 

## Features

### batch.getJobId()
Returns the value of a unique job id for each batch extension execution.

Example:
```groovy

```

### batch.getReferenceId()
Returns the value of an optional reference id sent by user when submitting the batch extension.

Example:
```groovy

```

## Considerations and Guidelines
Batch API is not to be used inside Batch extension.