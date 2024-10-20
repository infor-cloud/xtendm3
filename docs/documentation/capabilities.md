---
layout: default
title: Capabilities
parent: Documentation
nav_order: 7
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
Capabilities specific to extended batch & function programs.

#### Adding or modifying logic inside a batch program through extension points
* It is possible to add specific logic in a standard batch program provided that extension points are existing. 
By default, batch program is not available in BE Extension tool and needs to be requested.  

### Interactive
Capabilities specific to extended interactive programs.

#### Adding validation on a standard field
* It is possible to add validation on standard fields through extensions connected to Interactive programs' extension points. 

#### Performing validation before and after standard related options in the screen
* It is possible to perform validation but it is not possible to get the related option that was chosen inside the extension. 
For use cases where related option is needed, an H5 script can be used to call XtendM3 API instead of hooking an extension 
to the interactive programs' extension points.

#### Skip or stop performing options update, create, delete, or copy
* It is possible to stop operations by using an extension on PxCHK extension points.

#### Displaying dialog messages to the screen
* It is possible to show information/warning/error messages on the screen as well as pop up dialogs with Yes/No or Ok/Cancel 
options to the screen. 

#### Adding default value or overriding value of field on the screen
* It is possible to set default values for the standard fields by using PxINZ extension points.

### Transaction
Capabilities specific to extended standard APIs.

#### Performing specific logic on standard API transaction through extension points
* It is possible to perform specific logic on standard API transactions by creating a trigger extension and hooking it on 
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
Batch extensions have the longest time out of all extension types, one hour. This makes Batch type extensions a good candidate for doing longer calculations.<br>
These extensions can also be scheduled to execute, more information available [here](../batch-scheduling).

### Interactive
Use H5 Scripting and Mashup SDK to create UI elements and use extension APIs to perform CRUD operations.

## Integration
### ION API
ION APIs can be called from XtendM3 extensions using the [ION API](../api-specification/ion-api).

### M3 API
APIs available in M3 can be called from XtendM3 extensions using the [MICaller API](../api-specification/micaller-api).

### Configurable List & XML
TBA. Not released yet.

### File Transfer
It is possible to manage text, csv, json files in MvxFileTransfer directory using the [TextFiles API](../api-specification/textfiles-api).

### M3 Database
It is possible to perform CRUD operations on M3 database using the [Database API](../api-specification/database-api).

### Data Lake Synchronization
TBA. Not released yet.

### Experience Designer
It is possible to use XtendM3 in Experience Designer. You can add a UI on top of Dynamic Tables, add UI on top of custom XtendM3 APIs and add buttons for other activities like starting a batch job, among other things.<br>
To learn more, head to _education.infor.com_ and search for "Experience Designer".

## Development Tools
Capabilities of various XtendM3 development tools.

### Online IDE
Capabilities specific to the online XtendM3 development environment.

#### Test Compile
Test compile your extension with XtendM3s specific compilation rules.

#### Duplicate
Create a copy of your extension with a new name and/or market.

### Local IDE
Capabilities specific to the local XtendM3 development environment. 

#### XtendM3 SDK
The XtendM3 SDK provides the interfaces for the internal APIs available to XtendM3 extensions. This SDK can be used to build, test and debug extensions locally without the need for an M3 environment.

#### Maven Plugin
The Maven plugin for XtendM3 can be used to lint and export extensions locally.
More detailed documentation regarding XtendM3 Local Workspace available [here](../local-workspace).
* _Lint_
    * Lint and verify your extensions locally.
* _Export_
    * Export your extensions to .json format.
<br>

#### IONAPIs
There are three available XtendM3 APIs in ION for test-compiling, importing and activating extensions.
More detailed documentation regarding XtendM3 Local Workspace available [here](../local-workspace).
* _Test-compile_
    * Run the same test-compiler available in the cloud on your local code.
* _Import_
    * Import your local extensions to a cloud tenant.
* _Activate_
    * Activate your imported extensions.

## Governance
XtendM3 governance.

### Compile Time


### Runtime
