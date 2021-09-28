---
layout: default
title: Transaction API
parent: API Specification
grand_parent: Documentation
nav_order: 13
---

# Extension API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Since**: `0.12.0`  
**Context**: API  
**Category**: Context specific  
---
## Description

Transaction API allows to extend MI transactions, overwrite parameters. Can be used to set, retrieve or change a parameter and skip current transaction.

## Features

### Parameters
For retieving and changing MI transaction buffer or data structure

Example:
```groovy
public void main() {
    String SLRORN = transaction.parameters.SLRORN
    String SLRSCD = transaction.parameters.OAORNO
    if (SLRORN.isBlank() || SLRSCD.isBlank()) {
      return
    }
}
```

### Skip the current transaction
This method takes three string parameters : field, msid, data.

Example:
```groovy
public void main() {
    if (transaction.parameters.USID=="TEST") {
      transaction.abortTransaction("USID","ER001","ER001");
    }    
}
```

## Considerations and Guidelines