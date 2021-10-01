---
layout: default
title: Trigger Extension
parent: Examples
nav_order: 1
---

# Trigger Extension
{: .no_toc }

Working with Trigger Extension in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Trigger Extension is a simple type of extension, that consists in the execution of certain procedures in the designed extension, at the designated moment of program operation. It needs an extension point, at which it will be executed and triggerred by M3. It is used to modify orextend M3 Business Logic. Trigger extension can use a lot of useful API, which have various uses depending on the user's needs.


## Use cases
* Expanding the programme's functionality
* Modifications to the operations at a given extension point
* Allows implementation of functionality without changing the M3 itself at the source code


## Important note
Always test the examples for your own solution before using them in production.

## Step by step implementation
### 1. Create new extension button
After opening the main window with the access to M3, it is needed to enter the Administration Tools section inside the table on the left side of the screen. After that select XtendM3.
<br><br>
<img src="/assets/attachments/ex003/1.PNG" width="950">
<br>  
To create new extension it is needed to use the "Create new extension button" as shown on the screen below:
<br><br>
<img src="/assets/attachments/ex003/2.png" width="950">
<br>
### 2. Extension Type as a trigger extension - executed by a trigger
Opened window displays an option to select the type of extension to be designed. Select "Trigger" as described "Executed by a trigger" and then click next.
<br><br>
<img src="/assets/attachments/ex003/3.PNG" width="950">
<br>
### 3. Complete all inputs + description of them
The next window will require to fill in some data:
- Name of the extension
- Program name where to implement designed extension
After clicking "Next" button, another options will be displayed
- Method of the executed extension point
- Advice for the extension method
<img src="/assets/attachments/ex003/4.PNG" width="950">
<br>  
Depending on the selected programe, all sorts of methods can be available in the place for the selected method from modifying access to programmes data to interactively designed messages depending on the event at the extension point
The example presents udage of interactive pop up window extension inside the program. It is needed to choose the PEINZ from the method panel. MEthod PEINZ means initialization of designed event at the E panel:
- P as the panel word 
- E as the name of the Panel
- INZ as the initialization 
There are also several methods similar to PEINZ like PEUPD or PECHK. All vary according to the type of method and the panel on which the extension point occurs. All available methods depend on the selected programme.
The last box describes usage of selected method. It asks if the extension point should be before "PRE" or after "POST" selected method.<br><br>
After inputting all necessary data click create button
New extension is created. Now it is time to implement the functionality of the new extension.
<br><br>
<img src="/assets/attachments/ex003/5.PNG" width="950">
<br>  


### 4. Skeleton of the extension
The skeleton of the basic extension is empty. It is only made extended by the ExtendM3Trigger. Here is the place to implement the new extension.
<br><br>
<img src="/assets/attachments/ex003/6.PNG" width="950">
<br>  
Over the code field there are several tools with which you can operate on the designed extension
<br><br>
<img src="/assets/attachments/ex003/7.PNG" width="950">
<br>  
Listing them from the left side they are used to:
- enable editing mode
- export the code
- extra settings to change the parameters of the extension or enable it etc.
- delete the extension
- information about the extension'
- test compile
- refresh

### 5. Examples of trigger extension and usage of APIs
To start working with code of the new extension, the first thing to do is to enable edit mode. After that it is possible to implement the designed functionality
It is recommended to implement designed for XtendM3 APIs to exploit the full potential of the extension. Several APIs are described in the documentation at the [link](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification) 
In the first example the [ProgramAPI](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/program-api/) and the [InteractiveAPI](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/interactive-api/) are used to create a pop up message with the welcome text and the information about running program.
To implement these APIs it is needed just to include them as new objects inside the constructor of the extension and implement all the designed functionality of it inside the main() method as at below screen:
<br><br>
<img src="/assets/attachments/ex003/8.PNG" width="950">
<br>  
After implementing functionality it is needed to save the extension. If it is written correctly there should be a message with the proper information with success. In case of error, the appropriate error message will appear and the implementation will not be saved until the error is resolved. After saving an extension it is a good practice to use a test compilation of the program just to check if everything is working properly.

### 6. Activation, Funcionality and description of designed extension
The next step is to activate the extension. It can be activated inside the settings panel of the extension. To activate the extension, the activate slider needs to be turned on. 
<br><br>
<img src="/assets/attachments/ex003/9.PNG" width="950">
<br>  
After that it is possible to run the program with activated extension by using CTRL+R key combination and inputting the name of the program. While the program is running, the new implemented extension can be tested by the user. In this example the message is popped up on the panel E after execution of the extension method.
<br><br>
<img src="/assets/attachments/ex003/10.PNG" width="950">
<br>


### 7. Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- The convergence of the presented data is entirely coincidental.

## Use cases and short summary
There are many diffrent uses for trigger extension, depending on the needs of project. The assumptions for the implementation of an extension may relate to the data operations in the program, setting the accessibility for users or just to show specific information while performing some actions inside the program. Each assumed functionality must have its place in the program - the extension point, where it will be activated depending on the program. Trigger extensions can be very simple but they also can be much more complex
The second example, a bit more complex than the first one, is based on user access validation. The main point of that extension is to hide choosen data (here places with designation as CA for a given field) inside program in the absence of proper authority from designated persons. The extension point method here is diffrent than in the previous example. It has functionality of specific user authorizastion. Step by step implementation is very similar with the diffrence in chosen method of the extension and usage of APIs. Designed code includes a lot of diffrent names that refer to specific data in the database. All extensions are connected to programs and their implemented methods at the extension point. These two things are very important while designing extension with XtendM3.

## Extension code example
Here's an overview of the designed extensions, the exported files can be downloaded and imported in your own environments.
<br>
Example no.1:

```groovy
public class test extends ExtendM3Trigger {
  private final InteractiveAPI interactive;
  private final ProgramAPI program;
  
  public test(InteractiveAPI interactive, ProgramAPI program) {
    this.interactive = interactive;
    this.program = program;
  }
  
  public void main() {
    interactive.showOkDialog("Hello XtendM3 user! You are using ${program.getProgramName()} program.");
  }
}
```
<br>
Example no.2

```groovy
public class AuthorityCheck extends ExtendM3Trigger {
    private final ProgramAPI program;
    private final LoggerAPI logger;
    private final MethodAPI method;
    private final DatabaseAPI database;

    public AuthorityCheck(ProgramAPI program, LoggerAPI logger, MethodAPI method, DatabaseAPI database) {
      this.program = program;
      this.logger = logger;
      this.method = method;
      this.database = database;
    }

    public void main() {
      String table = method.getArgument(0);
      Map<String, String> record = (Map)method.getArgument(1);
      logger.debug("Checking authorization for table: " + table + " for user ${program.getUser()}" + " and the record: " + record);
      if (!isEnabled()) {
        return
      }
      if (table == "MITWHL") {
        method.setReturnValue(isUserAuthorizedToWarehouse(record.MWCSCD));
      } 
      if (table == "MITBAL") {
        def query = database.table("MITWHL").index("00").selection("MWCSCD").build();
        def container = query.createContainer();
        container.set("MWCONO", program.LDAZD.CONO);
        container.set("MWWHLO", record.MBWHLO);
        if (query.read(container)) {
          method.setReturnValue(isUserAuthorizedToWarehouse(container.getString("MWCSCD")));
        }
      }
    }
    
    private boolean isUserAuthorizedToWarehouse(String country) {
      // This logic can be expanded to check division or other constraints to decide whether user has access or not
      if (country == "CA") {
        return true;
      }
      return false;
    }
    
    private boolean isEnabled() {
      if (program.getUser() != "ADMIN") {
        return false;
      }
      return true;
    }
}
```

### Exported Extension
- [TRIGGER-QQS005-test.json](/assets/attachments/ex001/TRIGGER-QQS005-test.json)

### See Also
[Extension APIs documentation](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification) (click)<br>
[Another examples with documentation](https://infor-cloud.github.io/xtendm3/docs/examples) (click)
