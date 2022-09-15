---
layout: default
title: Capabilities
parent: Documentation
nav_order: 4
---

# Capabilities
{: .no_toc }


XtendM3 Capabilities
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Extending
### Batch/Function
#### Adding or modifying logic inside a batch program through extension points
It is possible to add specific logic in a standard batch program provided that extension points are existing. 
By default, batch program is not available in BE Extension tool and needs to be requested.  

### Interactive
#### Adding validation on a standard field
It is possible to add validation on standard fields through extensions connected to Interactive programs' extension points. 

#### Performing validation before and after standard related options in the screen
It is possible to perform validation but it is not possible to get the related option that was chosen inside the extension. 
For use cases where related option is needed, an H5 script can be used to call XtendM3 API instead of hooking an extension 
to the interactive programs' extension points.

#### Skip or stop performing options update, create, delete, or copy
It is possible to stop operations by using an extension on PxCHK extension points.

#### Displaying dialog messages to the screen 
It is possible to show information/warning/error messages on the screen as well as pop up dialogs with Yes/No or Ok/Cancel 
options to the screen. 

#### Adding default value or overriding value of field on the screen 
It is possible to set default values for the standard fields by using PxINZ extension points.

### Transaction

#### Performing specific logic on standard API transaction through extension points
It is possible to perform specific logic on standard API transactions by creating a trigger extension and hooking it on 
extension points from standard APIs. Extensions can run before a standard transaction is executed or after a standard transaction has been 
executed successfully.

## Expanding
### Reference Fields
TBA. Not released yet.

### Database
It is possible to create completely new tables via XtendM3 by creating a Dynamic Table. The access to this table is 
through extensions and they can be exposed via XtendM3 APIs to the rest of the M3 ecosystem.

### API
#### Creating extension APIs - new transaction to get, add, update, or list records
It is possible to create new APIs and single/multi transactions via XtendM3. In order to create new transaction the 
extension type should be Transaction when creating it.
#### Calling extension API from H5 Script, ION API, IEC Mapper, CMS041
If extension API is active, metadata is automatically updated in MRS program and ION API and can be called or used same as a standard API transaction.  

### Batch
Section in progress.

### Interactive
Use H5 Scripting and Mashup SDK to create UI elements and use extension API to perform CRUD operations.

## Integration
### ION API
It is possible to call ION API from extensions. 

### M3 API
It is possible to call M3 API from extensions.

### Configurable List & XML
TBA. Not released yet.  

### File Transfer
It is possible to manage text, csv, json files in MvxFileTransfer directory. 

### M3 Database
It is possible to perform CRUD operations on M3 database.

### Data Lake Synchronization
TBA. Not released yet.

## Development Tools
### Online IDE

### Local IDE
#### API SDK

#### Maven Plugin
Not released yet.

## Governance
### Compile Time

### Runtime
