---
layout: default
title: Utility API
parent: API Specification
grand_parent: Documentation
nav_order: 4
---

# Utility API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Since**: `0.7.0`  
**Context**: Any  
**Category**: Generic  
---
## Description
The Utility API allows to create a specific code that can be used more than once. It is useful in case of designing methods/extensions that can be executed multiple times or from diffrent locations in a running session. It is not needed to create multiple pieces of code with the same methodology by using Utility API.

## Features
With the Utility API a specific part of the code is created separately to execute it with other extensions. This allows for multiple use of designed utility at various points inside the extension. Any piece of code can be considered as a utility if it is a method or set of methods that can be called by other extensions. It is important to include utility as a unique piece of code.
### Utility example
Utilities can be easily sorted into individual method sets. That makes them easy accessable from all extensions without having to search for specific method or createing it again.
<br><br>
Example 1: simple utility with one method
```groovy
public class exampleUtili extends ExtendM3Utility {
  
  /**
   * Checks if activeUser has access
   * @param activeUser logged in User
   * @param userWithAccess User with access
   * @return {@code true} if activeUser has access
   */
  
  public boolean checkUser(String activeUser, String userWithAccess) {
    if(activeUser.equals(userWithAccess)) {
      return true;
    } else {
      return false;
    }
  }
}
```
<br>
Example 2: part of the DateUtil utility (multiple methods related to date operations)

```groovy
import java.time.Instant
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.time.temporal.ChronoUnit

public class DateUtil extends ExtendM3Utility {

  /**
   * Get date in yyyyMMdd format
   * @return date
   */
  String currentDateY8AsString() {
    return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"))
  }

 /**
   * Get date in yyMMdd format
   * @return date
   */
  public String currentDateY6AsString() {
    return LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
  }

  /**
   * Get date in yyMMdd format
   * @return date
   */
  public int currentDateY6AsInt() {
    return Integer.valueOf(currentDateY6AsString());
  }

  //etc. some other date methods
```

### Call method
The 'Call' method of UtilityAPI is the main method by which operations on previously created utilities are possible to execute. The structure of call method is presented below:
<br>
Example: Call method structure
```groovy
  utility.call("- Name of the utility -","- Name of the chosen method inside utility -", "stringArgument", IntArgument, ... other arguments ...);
``` 
It is important to know the structure of the chosen method inside the utility.<br>
Three elements are essential in the 'call' UtilityAPI method: <br>
- name of the selected utility  
- name of the chosen method inside the selected utility  
- all necessary arguments of the selected method to execute the code  

### Initialisation of utility methods in an extension
Utility can be interpreted as a kind of abstract class with fully implemented methods that are ready-to-use. In order to use the utility in an extension, it is only necessary to call the method from created utility inside designed extension and assign the relevant parameters to it.<br>
Example:
```groovy
public class exampleWithUtility extends ExtendM3Trigger {
  private final InteractiveAPI interactive;
  private final UtilityAPI utility;
  
  public exampleWithUtility(InteractiveAPI interactive, UtilityAPI utility) {
    this.interactive=interactive;
    this.utility=utility;
  }
  public void main() {
    String todayDate = utility.call("DateUtil","currentDateY6AsString");
    String fileDate = interactive.display.fields.WELVDT;
    interactive.showOkDialog("Hello, today is "+todayDate +" (yy-mm-dd)");
  }
}
```
By using utilities lines of code and time to write code is saved while maintaining full performance of it. In addition, it is not necessary to write needed libraries to execute the code - all are included inside the utility. The same example without using utility below:<br>
Example:
```groovy
import java.time.LocalDate
import java.time.format.DateTimeFormatter

public class exampleWithoutUtility extends ExtendM3Trigger {
  private final InteractiveAPI interactive;
  
  public exampleWithoutUtility(InteractiveAPI interactive) {
    this.interactive=interactive;
  }
  public void main() {
    String todayDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
    String fileDate = interactive.display.fields.WELVDT;
    interactive.showOkDialog("Hello, today is "+todayDate +" (yy-mm-dd)");
  }
}
```
## Considerations and Guidelines
The UtilityAPI is a powerful component of XtendM3 that makes writing code much more efficient and easier. Creating utilities allows to use the same code in many code-points or calling them multiple times without having to repeat previously designed code. This also eliminates the need of implementing external libraries inside the extensions.
