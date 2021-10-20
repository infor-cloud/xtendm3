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
![](/assets/images/warning-24px.svg)

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
Session API provides methods for interacting with current session. One of the main uses of this API is a key-value 
storage mechanism for an extension storing parameters, calculated values or other information at runtime in memory. It is used to 
pass along these elements into another extension or access it later in the same session.

The scope of this storage is limited to the session, which means that once the session is terminated all stored
information will be deleted from the memory.

A session is started when a program starts by user interaction i.e. from the menu. Subsequent programs that are started
as a result of related 

## Features

Features of this API.

### Store a value to session
To store a value to a session storage layer you can use the SessionAPI method. The parameter named i.e. key can be
anything. Any object can be a value, so it is not limited to primitive types.

Example:
```groovy
double finalSalesPrice = calculateFinalSalesPrice()
session.parameters.put("salesPrice", finalSalesPrice)
```

### Check if a parameter is present in the session
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
