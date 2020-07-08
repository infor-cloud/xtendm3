---
layout: default
title: Limitations
parent: Documentation
nav_order: 2
---

# Limitations
{: .no_toc }


XtendM3 Limitations
{: .fs-6 .fw-300 }
**️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
## General
### M3 Program calls
It is not possible to call M3 programs from an extension. Only M3 APIs can be called from extensions.

## Extending
### Batch/Function

### Interactive
#### Accessing custom fields from extensions
If a field is not a standard field and is defined via CMS080, it cannot be accessed from extensions directly as opposed 
to other standard fields on the screen.

**Workaround**
A H5 script can be used to send the custom field information to XtendM3 API instead.

#### Accessing chosen list option
Currently, it is not possible to access list option from extensions.

**Workaround**
In order to perform custom validation on the B panel via extensions, you can send the chosen list option along with the 
record keys to an XtendM3 API instead.

### Transaction
#### Adding/Removing input/output parameters for an existing transaction
It is not possible to add/remove parameters for an existing transaction via XtendM3. 

**Workaround**
Wrap transaction by defining a new XtendM3 transaction with both standard parameters and the custom ones. Call the API 
extension and perform additional logic with the new parameters inside the XtendM3 transaction.

#### Changing the output parameter values
It is not possible to change the output parameters for a transaction. The output parameters are readonly and cannot be 
modified by an extension.

## Expanding
### Reference Fields
TBA, this feature has not been released yet.

### Database

### API
#### Creating new transactions on standard APIs
It is not possible to define new transactions on the existing standard APIs.

**Workaround**
Define a new transaction on an XtendM3 API. To find and relate the transaction easier to the standard program you could 
use the same suffix e.g. for new transactions in OIS100MI you can define EXT100MI API.

### Batch
TBA, this feature has not been released yet.

### Interactive

## Integration
### ION API

### M3 API
#### Calling CMS100MI/MDBREADMI
It is not possible to call custom transactions defined in CMS100MI or MDBREADMI. 

**Workaround**
Perform the query using either direct database access or via calling CMS100MI/MDBREADMI IONAPI as a last resort option.

### Configurable List & XML

### File Transfer

### Database

### Data Lake

## Development Tools
### Online IDE

### Local IDE
#### API SDK

#### Maven Plugin

## Governance
### Compile Time

### Runtime
