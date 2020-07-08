---
layout: default
title: Programming Standard
parent: Documentation
nav_order: 3
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
Extension can be created in any of the four types:  

### Trigger Extensions
Trigger extensions are used to hook or inject our own code in a specific method in M3 Java through an extension point. These extensions extend the ExtendM3Trigger class.  

### Utility Extensions
Utility extensions are used to create an extension program with collection of methods that can be called in other extensions. These extensions extend the ExtendM3Utility class.  

`utility.call(String utility, String method, Object... arguments)`

### Transaction Extensions
Transaction Extensions are used to create custom M3 API transactions. These extensions extend the ExtendM3Transaction class.  

### Table Extensions
Table Extensions are used to create dynamic table.  In BE 15.x version, this is the equivalent of the MAK custom tables.  It is possible to add columns, assign data types, unique keys, and indices.  

## Indentation and Formatting
Tab size: 2 spaces  
Indent size: 2 spaces  
Continuation indent: 4 spaces  
Charset: utf-8  

XtendM3 uses Groovy programming and ending code lines with semicolons are optional.  

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
`Batch` Batch, Autostart Batch  
`MI` MI Batch  

__EXT ID__  
Specification/Extension ID  

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

#### Methods
- Method name should follow Java naming convention for methods  
- Names should be in lowerCamelCase, using no underscores and starting with a letter  
- Only alphanumeric characters should be used. Alphanumeric characters include the letters a-z, either upper case or lower case, and the numerals 0-9  
- Should be simple and descriptive: 
validateDate, 
validateType

#### Variables and Constants
- Variables and constants should follow Java naming convention
- Variables should be in lowerCamelCase and constants in CAPITAL_CONSTANTS

## Extension Structure
- Global variables and main method are declared at the beginning of the program as compared to M3 Java where these are declared at the end of the program
`<to add example>`

### Utility Extensions
- Utility extensions cannot contain global variables
- It is not possible to declare and create instance of API in utility extensions, instead API should be passed as parameters in utility methods  `<to add example>`

## Programming Practices
### Logging
- LoggerAPI is used for logging messages  
- It is encouraged to add logs in extensions to help in debugging and troubleshooting issues particularly on non-development environments (TRN, PRD) where there is restriction on modifying extensions  
- Use proper level of logging – If extension is to be deployed in PRD, it should be limited to DEBUG level. Using INFO/WARNING/ERROR/TRACE on production environment can cause huge log size and impact MT Cloud environment  
- Avoid logging values of all returned fields in a database query  
- Logs can be accessed through Administration tool - Business Engine Jobs `<to add screen>`    

#### Log levels
- warning  
- error  
- info  
- trace  
- debug

### Database Access
- It is recommended to use standard API if transactions are available instead of direct database access on WRITE/UPDATE/DELETE  where the program uses multiple tables to update.  This could cause corrupt data if any on the logic, validation, or database update was missed or incorrectly updated  
- Make sure when using readLock that it is released at the end of the extension to avoid blocking another program access  
- When reading table with partial keys, verify that this will not return too many records  
- When reading table, if possible, specify only the required column fields and avoid selectAllFields on querying tables particularly on tables which contains many fields  

### Loops
- In M3 Java old programming, there are codes such as _while(true)_ and performs multiple _break_ inside the loop. When using while loop, avoid using condition=_true_ and provide condition that will break the loop  

### Data Storage
#### In Memory
- SessionAPI is used to store information in key-value mapping that can be accessed between multiple extensions in the same session  
- Make sure to use unique identifier as key names to avoid conflicts with other extensions when adding content to the cache  
- Reassess when there is too many information that needs to be stored in a session. It may be more practical to add the information using XtendM3 tables instead  

#### In Customer Extension Table
- Customer extension table refers to CUGEX1, CUGEX2 and CUGEX3 tables and can be accessed through standard API, CUSEXTMI 
- Customer extension table should not be used for high volume data and high number of reads, updates, and deletes instead replace with XtendM3 tables  

#### In Dynamic Database
- Dynamic Database or XtendM3 table is the equivalent of MAK custom table  
- Table name uses prefix EXT and can have specific columns and logical keys  
`to add example`

#### In Text/XML/JSON File
- TextFilesAPI is the equivalent of MvxTextFile in M3 Java which can be used to read, write, or delete file  
`to add example`  

### API Call
- M3 API can be run using IonAPI or MICallerAPI  
- It is preferred to use MICallerAPI which runs M3 API internally in the same layer as business engine instead of having another layer to execute M3 API  

#### ION API
- ION API provides secure access to M3 API and other registered application APIs through web services
- When using IonAPI in extension, the response should be parsed [XML/JSON Parsing](https://infor-cloud.github.io/xtendm3/docs/documentation/programming-standard/#xml--json-parsing)  
- If standard M3 API is not available and an existing interactive program can be used to perform M3 update,  ION API can be used to run IPS(Interactive Programming Services) which wraps the functionality of the program to perform M3 updates  

#### M3 API
- MICallerAPI is the equivalent of utility program cMICaller in M3 Java  

### XML / JSON Parsing
- XML response can be processed using Groovy classes [XmlParser and XmlSlurper](https://groovy-lang.org/processing-xml.html)  
- JSON response can be processed using Groovy class [JsonSlurper](https://groovy-lang.org/json.html)  

## Testing
Extension approval requires submission of approved Unit test and Functional test documents  

### Local
- Extensions can be locally tested using [XtendM3 SDK](https://github.com/infor-cloud/xtendm3-sdk-java) which provides the interfaces for the internal APIs available to XtendM3 Extensions. This SDK can be used to build, test and debug Extensions locally without needing to have any M3 environment up and running  
- A sample repository [ACME Corp. XtendM3 Extensions](https://github.com/infor-cloud/acme-corp-extensions) is provided to get you started on setting up project directories for the source codes, test scripts and XtendM3 SDK  

### Live
- If the program extension has been activated in the tenant, it automatically runs and the changes to the program are seen by the users.  During unit testing, it is recommended that the extension should execute only for specific users until it is verified working to avoid interrupting other users when running the same program  
- Provided is an example of validating extension to run for specific user/s  
`to add example`

## Version Controlling
More details are provided at [Version Controlling](https://infor-cloud.github.io/xtendm3/docs/documentation/version-controlling/) page 

### Framework
Git version control system should be used  

### Structure
Refer to the example of an [XtendM3 Extension Repository](https://github.com/infor-cloud/acme-corp-extensions) to version control extensions  

### Hosting
Any git provider that the customer prefers GitHub, GitLab, Bitbucket and etc.  

## Documentation
- Extension JavaDoc on top of extension classes is required  
- Extension Methods JavaDoc on top of methods (except for main) is recommended   
