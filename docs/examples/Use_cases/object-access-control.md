---
layout: default
title: Object access control
parent: Use cases
grand_parent: Examples
nav_order: 1
---

# Object access control
{: .no_toc }

Test description
{: .fs-6 .fw-300 }
![](../../../assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Current structure of Object Access Control in business engine has some limitation. There is a requirement to be able to deauthorize access to data on a record level in the below context from both the lists and also from the Prompt dialogue box. The deauthorization is done on a custom criteria in an extension.

## Use Case
Programmatic preparations are completed for future extensibilitywhen it is possible to add additional logic into M3 to restrict data rows in both New List Standard Compatible programs and their Derived F4 Prompt Dialogues. An example object has been developed that block Warehouse Records from the Warehouse Master list based on the Country as a restriction value programmed into the Extension.

## Extension usage
This use case uses a (Trigger extension)(../../../docs/examples/example-003), through which a specific access to data has been configured. It is done by applying user validation to the visibility of data inside the program.

## API usage
- [ProgramAPI](../../../docs/documentation/api-specification/program-api/) 
- [LoggerAPI](../../../docs/documentation/api-specification/logger-api/)
- [MethodAPI](../../../docs/documentation/api-specification/method-api/)

## DEMO description
Use case is quite short, but helps understanding of data access for specific user. Extension is taking the data from the warehouse table. After that all records inside table are being mapped. The next thing inside the extension is user validation - if statement checks the active user with the required user/users. The last element of that extension is data hiding, in case of lack of proper permissions. Some of the warehouses are hidden from the table, so the unauthorized user is not able to use/view this data in the program. Visibiliti of the data and the user authorisation are completely user-modifiable depending on users needs.

## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples are random.

## Attachments
- Code uplodaed as an attachment
- JSON file 
- etc.

## See also
