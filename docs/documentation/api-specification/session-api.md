---
layout: default
title: Session API
parent: API Specification
grand_parent: Documentation
nav_order: 8
---

# Session API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
**️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Since**: `0.2.0`  
**Context**: Any  
**Category**: Storage  
---
## Description
Session API provides methods for interacting with current session. One of the main usages of this API is a a key-value 
storage mechanism for the extension store parameters, calculated values or other information in runtime in memory to 
pass along the another extension or access it later on during the same session.

The scope of this storage is limited to the session, which means that once the session is terminated all stored
information will be deleted from memory.

A session is started when a program starts by user interaction i.e. from the menu. Subsequent programs that are started
as a result of related 

## Features

Features of this API.

### session.parameters.put
To store a value to session storage layer you can use the session API method. The parameter name i.e. key can be
anything. The value can be any object, so it is not limited to primitive types.

Example:
```groovy
double finalSalesPrice = calculateFinalSalesPrice()
session.parameters.put("salesPrice", finalSalesPrice)
```

### session.parameters.get
To check if a parameter has been stored in the session you can try to retrieve the value and check if it is `null` or do
it in the Groovy style by just checking the value.

Example 1:
```groovy
if (session.parameters.get("salesPrice") == null) {
  double finalSalesPrice = calculateFinalSalesPrice()
  session.parameters.put("salesPrice", finalSalesPrice)
}
```

Example 2:
```groovy
if (session.parameters.get("salesPrice")) {
  double finalSalesPrice = calculateFinalSalesPrice()
  session.parameters.put("salesPrice", finalSalesPrice)
}
```

## Considerations and Guidelines
Although the size limit of this storage is undocumented, it should be used with considerations. Storing too much
information in this layer should be avoided and moved to database instead.
