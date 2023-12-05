---
layout: default
title: Object access control
parent: Use cases
grand_parent: Examples
nav_order: 1
---
 
# Object access control
{: .no_toc }

 
## Table of contents
{: .no_toc .text-delta }
 
1. TOC
{:toc}
 
---
 
## Description
Current structure of Object Access Control in the business engine has some limitations. The purpose of the designed extension is to make data authorization handing easier - add users' security layer for chosen objects inside the database. The authorization is done on a custom criteria in an extension. This use case is a Trigger extension, through which a specific access to data has been configured. It is done by applying user validation to the visibility of data inside the program.
 
## Step-by-step solution
This use case is a type of [Trigger extension](../../../examples/example-003). Specific parameters needs to be applied while creating an extension to get all the functionality of the designed method. While creating a new extension, the name of the program needs to be "CRCHKAUTH". After clicking ‘next’ there will be one method available for the new extension - ‘isAuthorizedToAccessRecord’. After creating an extension, the blank page will be ready for implementing users functionality. Designed code is presented in the ‘Source code’ section below.
 
## Source code
This use case is quite short, but helps understanding of data access for specific users. <br>
The extension is taking the data from the warehouse table. After that all records inside the table are being mapped.

 
```groovy
public class AuthorityCheck extends ExtendM3Trigger {
  private final ProgramAPI program
  private final LoggerAPI logger
  private final MethodAPI method
  private final DatabaseAPI database

  public AuthorityCheck(ProgramAPI program, LoggerAPI logger, MethodAPI method, DatabaseAPI database) {
    this.program = program
    this.logger = logger
    this.method = method
    this.database = database
  } 

  public void main() {
    String table = method.getArgument(0)
    Map<String, String> record = (Map)method.getArgument(1)
    logger.debug("Checking authorization for table: " + table + " for user ${program.getUser()}" + " and the record: " + record)

    //if statement checks the active user with the required user/users. The last element of that extension is data hiding, in case of lack of proper permissions.
    if (!isEnabled()) {
      return;
    }
    if (table == "MITWHL") {
      method.setReturnValue(isUserAuthorizedToWarehouse(record.MWCSCD));
    }
    if (table == "MITBAL") {
      DBAction query = database.table("MITWHL").index("00").selection("MWCSCD").build();
      DBContainer container = query.createContainer();
      container.set("MWCONO", program.LDAZD.CONO);
      container.set("MWWHLO", record.MBWHLO);
      if (query.read(container)) {
        method.setReturnValue(isUserAuthorizedToWarehouse(container.getString("MWCSCD"))); 
      }
    }
  }
 
  // This logic can be expanded to check division or other constraints to decide whether user has access or not
  private boolean isUserAuthorizedToWarehouse(String country) {
    if (country == "CA") {
      return true;
    }
    return false;
  }
   
  // In this example method is being run only for selected users just to show how it works -> USER here is unauthorized, so data will be hidden for him.
  private boolean isEnabled() {
    if (program.getUser() != "USER") {
      return false;
    }
    return true;
  }
}
```
 
Some of the warehouses are hidden from the table, so the unauthorized users are not able to use/view this data in the program. Visibility of the data and the user authorization are completely user-modifiable depending on users needs. This example can be usefull for designing functionality concering sensitive data, and some data should be unavailable for some users. This use case can be used while designing some functionality with the data usage, when some data are quite sensitive for the user and they shouldn't be visible for every program user. It can also be modified depending on the specific data which should be validated.

Some of the warehouses are hidden from the table, so unauthorized users are not able to use/view this data in the program. Visibility of the data and the user authorization are completely user-modifiable depending on user's needs. This example can be useful for designing functionality concerning sensitive data, where some data should be unavailable to some users. It can also be modified depending on the specific data which should be validated.

## Use Case
Programmatic preparations are completed for future extensibility when it is possible to add additional logic into M3 to restrict data rows in both New List Standard Compatible programs and their Derived F4 Prompt Dialogues. An example object has been developed that blocks Warehouse Records from the Warehouse Master list based on the country (or another param of the table) as a restriction value programmed into the extension. 
 
Object access control can be used as a base to create other similar extensions for different usage for example if it is needed to create an extension for data visibility based on the country the user is from etc. Many data validations can be based on that example.
 
Code presented above can be fully modified, depending on user needs. The most important part of that use case is to make specific values visible for the user of the program. There are many possibilities which data should be hidden and which user should see all data inputted.
 
## Short summary
Object access control is a use case by which the extension can be supported by a custom security layer that filters proper data. Users can modify an access to specific data inside that extension. That security layer can be used in many cases when it is needed to create an extra cover of the program data.
 
## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples is random.
 
## API usage
- [ProgramAPI](../../../documentation/api-specification/program-api)
- [LoggerAPI](../../../documentation/api-specification/logger-api)
- [MethodAPI](../../../documentation/api-specification/method-api)
- [DatabaseAPI](../../../documentation/api-specification/database-api)
 
 
## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)

