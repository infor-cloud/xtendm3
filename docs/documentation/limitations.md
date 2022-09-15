---
layout: default
title: Limitations
parent: Documentation
nav_order: 5
---

# Limitations
{: .no_toc }

XtendM3 Limitations
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## General
General XtendM3 limitations.

### M3 Program calls
It is not possible to call M3 programs from an extension. Only M3 APIs can be called from extensions.
### Database read on user-defined sorting orders  
It is not possible to build query on standard tables using user-defined sorting order or index created using CRS021.

## Extending
Extension limitations.

### Batch/Function

#### Creating additional fields in field groups e.g. MWPV6
TBA, this feature has not been released yet.

### Interactive
Interactive specific limitations.
 
#### Creating UI related components in interactive panels
For enhancements such as adding new field in OIS100/E, extension will not be able to add textbox or dropdown field.  
<br>
**Workaround** <br>
CMS080 (custom fields) or H5 Script can be used to create UI components.  
<br>
XtendM3 does not support creating additional column in subfiles, converting columns to editable fields, addition of selection filters, and adding sorting orders and views.  
<br>
**Workaround** <br>
Some M3 program views can be configured in CRS020/CRS022.  H5 Script can also be used to add columns in subfile panels.  

#### Accessing custom fields from extensions
If a field is not a standard field and is defined via CMS080 or by a script, it cannot be accessed from extensions directly as opposed 
to other standard fields on the screen.
<br>
**Workaround** <br>
H5 script can be used to send the custom field information to XtendM3 API instead.

#### Accessing chosen list option
Currently, it is not possible to access list option from extensions.
<br>
**Workaround** <br>
In order to perform custom validation on the B panel via extensions, you can send the chosen list option along with the 
record keys to an XtendM3 API instead.

### Transaction
Transaction specific limitations.

#### Adding/Removing input/output parameters for an existing transaction
It is not possible to add/remove parameters for an existing transaction via XtendM3.
<br>
**Workaround** <br>
Wrap transaction by defining a new XtendM3 transaction with both standard parameters and the custom ones. Call the API 
extension and perform additional logic with the new parameters inside the XtendM3 transaction.

#### Changing the output parameter values
It is not possible to change the output parameters for a transaction. The output parameters are readonly and cannot be 
modified by an extension.

## Expanding
### Reference Fields
TBA, this feature has not been released yet.

### Database
#### Adding fields to existing standard tables
It is not possible to add fields to existing tables. 
<br>
**Workaround** <br> 
Create new tables by using XtendM3 Dynamic Table

#### Adding table index for standard tables 

**Workaround** <br> 
Custom table index for standard tables should be created in CRS021.

### API
#### Creating new transactions on standard APIs
It is not possible to define new transactions on the existing standard APIs.
<br>
**Workaround** <br>
Define a new transaction on an XtendM3 API. To find and relate the transaction easier to the standard program you could 
use the same suffix e.g. for new transactions in OIS100MI you can define EXT100MI API.

### Batch 
Section in progress.

### Interactive

## XtendM3 APIs
### TransactionAPI
It is not possible to fetch and work with the input-parameters POST Transaction, using the Transaction API. However, output-parameters are available in POST.
<br>
To clarify, PRE Transaction both input- & output-parameters are available. POST Transaction only output-parameters are available. 
**Workaround** <br>
Use the SessionAPI instead.

## Integration
### ION API
It is not possible to call a Transaction Extension, that is inherently calling an ION API, from a MEC Context.
<br>
**Workaround** <br>
No workaround available.

### M3 API
#### Calling CMS100MI/MDBREADMI
It is not possible to call custom transactions defined in CMS100MI or MDBREADMI.
<br>
**Workaround** <br>
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
