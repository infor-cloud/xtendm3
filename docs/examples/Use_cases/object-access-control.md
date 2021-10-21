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
![](../../../images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET - It is a TEST CASE**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Current structure of Object Access Control in business engine has some limitation. There is a requirement to be able to deauthorize access to data on a record level in the below context from both the lists and also from the Prompt dialogue box. The deauthorization is done on a custom criteria in an extension.

## Use Case
Programmatic preparations are completed for future extensibility when it is possible to add additional logic into M3 to restrict data rows in both New List Standard Compatible programs and their Derived F4 Prompt Dialogues. An example object has been developed that block Warehouse Records from the Warehouse Master list based on the Country (or another param of the table) as a restriction value programmed into the Extension.

## Extension usage
This use case uses a [Trigger extension](../../../examples/example-003), through which a specific access to data has been configured. It is done by applying user validation to the visibility of data inside the program.

## API usage
- [ProgramAPI](../../../documentation/api-specification/program-api) 
- [LoggerAPI](../../../documentation/api-specification/logger-api)
- [MethodAPI](../../../documentation/api-specification/method-api)
- [DatabaseAPI](../../../documentation/api-specification/database-api)

## DEMO description
Use case is quite short, but helps understanding of data access for specific user. <br>
Extension is taking the data from the warehouse table. After that all records inside the table are being mapped.

```groovy

 public void main() {
      String table = method.getArgument(0)
      Map<String, String> record = (Map)method.getArgument(1)
      logger.debug("Checking authorization for table: " + table + " for user ${program.getUser()}" + " and the record: " + record)

      [...]
```

 The next thing inside the extension is user validation - if statement checks the active user with the required user/users. The last element of that extension is data hiding, in case of lack of proper permissions. 
 
 ```groovy

        [...]

 if (!isEnabled()) {
        return
      }
      if (table == "MITWHL") {
        method.setReturnValue(isUserAuthorizedToWarehouse(record.MWCSCD))
      } 
      if (table == "MITBAL") {
        def query = database.table("MITWHL").index("00").selection("MWCSCD").build()
        def container = query.createContainer()
        container.set("MWCONO", program.LDAZD.CONO)
        container.set("MWWHLO", record.MBWHLO)
        if (query.read(container)) {
          method.setReturnValue(isUserAuthorizedToWarehouse(container.getString("MWCSCD")))  
        }
      }

      [...]

 ```
 
 Some of the warehouses are hidden from the table, so the unauthorized user is not able to use/view this data in the program. Visibility of the data and the user authorisation are completely user-modifiable depending on users needs.

 ```groovy
 
     [...]
     
 private boolean isUserAuthorizedToWarehouse(String country) {
      // This logic can be expanded to check division or other constraints to decide whether user has access or not
      if (country == "CA") {
        return true
      }
      return false
    }
    
    // Demo extension - only run for selected users -> ADMIN here
    private boolean isEnabled() {
      if (program.getUser() != "ADMIN") {
        return false
      }
      return true
    }
 ```

## Short summary
Object access control is a use case by which the extension can be supported by a custom security layer, that filters proper data. User can modify an access to specific data inside that extension. That security layer can be used in many casen when it is needed to create an extra cover of the program data.

## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples are random.

## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)
