---
layout: default
title: Programming Standard
parent: Documentation
nav_order: 2
---

# Programming Standard
{: .no_toc }

Guideline for writing secure, optimized and scalable extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
## Extension Types
To be completed.

### Trigger Extensions
To be completed.

### Utility Extensions
To be completed.

### Transaction Extensions
To be completed.

### Table Extensions
To be completed.

## Indentation and Formatting
To be completed.

## Naming

### Extensions
Extension names should be a valid Java class name.
There is no restriction on extension names and will run with no error when compiled.  However, when creating extensions, these naming conventions should be followed for readability and maintenance:

__Module__  
`SMS`
`SLS`
`EQM`
`MNT`
`SRV`
`RTM`
`FIC`
`FIM`
`MAN`
`MAI`
`PDM`
`PJM`
`SCP`
`SCE`
`PUR`

__Program Type__  
`IW` Interactive  
`Fnc` Fnc Batch   
`Batch` Batch, Autostart batch  
`MI` MI Batch  

__EXT ID__  
Specification Document ID  

__Description__  
- Description should be in UpperCamelCase  

- Try to keep extension description names simple and descriptive  
- Avoid acronyms of abbreviations unless the word is a common jargon such as CO, DO, MO  

#### Trigger Extensions
`Format: <Module>_<Type>_<EXT ID>_<Description>`  

Type | Program | Extension name
------------ | -------------| -------------  
Interactive | APS450 | FIM_IW_1784_ValidateInvoice  
Fnc Batch| APS450Fnc|FIM_Fnc_1784_ValidateInvoice
Batch| OOLINEPI| SLS_Batch_1784_ValidateCO
MI Batch| MMS100MI| SCE_MI_1784_ValidateDO

#### Utility Extensions
`Format: <Description>Utils`  

DateUtils

#### Transaction Extensions
- EXT9XXMI is reserved for standard extensions and should not be used
- When extending standard API, use same number suffix as standard program  
OIS100MI - EXT100MI  

- If there are same number suffix for standard API that needs to have extensions, use increment in number suffix  
MMS100MI - EXT101MI  

#### Table Extensions
`Format: EXT<XXX>`  
- For standard table extension, use EXT<abbr standard table name>  
OOHEAD - EXTOHD  
OOLINE - EXTOLN  

- For custom table extension, use EXT<XXX> same suffix as extension API  
Table - EXT001  
API - EXT001MI  

### Methods
- Method name should follow Java naming convention for methods  
- Names should be in lowerCamelCase, using no underscores and starting with a letter  
- Only alphanumeric characters should be used. Alphanumeric characters include the letters a-z, either upper case or lower case, and the numerals 0-9  
- Should be simple and descriptive: 
validateDate, 
validateType

### Variables
Global variables  
Local variables
  
### Constants

## Extension Structure
To be completed.

### Imports
To be completed.

### Variables
To be completed.

### Methods
To be completed.

### Extension Specific Structure
To be completed.

#### Trigger Extensions
To be completed.

#### Utility Extensions
To be completed.

#### Transaction Extensions
To be completed.

#### Table Extensions
To be completed.

## Extension Point / Trigger
To be completed.

### Interactive
To be completed.

### Batch / Function
To be completed.

### MI / M3 API
To be completed.

## Programming Practices
To be completed.

### Logging
To be completed.

### Database Access
To be completed.

#### Read Access
To be completed.

#### Write / Update / Delete Access
To be completed.

### Loops
To be completed.

### Data Storage
To be completed.

#### In Memory
To be completed.

#### In Customer Extension Table
To be completed.

#### In Dynamic Database
To be completed.

#### In Text/XML/JSON File
To be completed.

### API Call
To be completed.

#### ION API
To be completed.

#### M3 API
To be completed.

### Utilities
To be completed.

### XML / JSON Parsing
To be completed.

## Testing
To be completed.

### Local
To be completed.

### Live
To be completed.

## Version Controlling
To be completed.

### Framework
To be completed.

### Structure
To be completed.

### Hosting
To be completed.

## Documentation
To be completed.