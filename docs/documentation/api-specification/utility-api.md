---
layout: default
title: Utility API
parent: API Specification
grand_parent: Documentation
nav_order: 4
---

# Utility API
{: .no_toc }

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
The Utility API is used to call Utility extensions from other XtendM3 extensions. Utility extensions allow the user to create a specific method that can be used more than once. It is useful in case of designing methods/extensions that can be executed multiple times or from diffrent locations in a running session. It is not needed to create multiple pieces of code with the same methodology by using utilities.

## Features
With the Utilities a specific part of the code is created separately to execute with other extensions. This allows for multiple uses of designed utilities at various points inside the extension. Any piece of code can be considered as a Utility if it is a method or set of methods that can be called by other extensions.

### Utility example
Utilities can be easily sorted into individual method sets. That makes them easy accessable from all extensions without having to search for specific method or creating it again.
<br>
Example: part of the DateUtil Utility (multiple methods related to date operations).

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
The 'call' method of UtilityAPI is the main method by which operations on previously created utilities can be executed. The structure of the call method is presented below:
<br>
Example: Call method structure

```groovy
  utility.call("- Name of the Utility -","- Name of the chosen Utility method -", objectArgument, ... other arguments depending on the selected method ...);
``` 

It is important to know the structure of the chosen method inside the Utility.<br>
Three elements are required in the 'call' Utility API method:
- name of the selected Utility
- name of the chosen method inside the selected Utility
- all necessary arguments of the selected method to execute the code

### Initialisation of Utility methods in an extension
Utilities can be interpreted as a kind of abstract class with fully implemented methods that are ready-to-use. In order to use the Utility in an extension, it is only necessary to call the method from created Utility inside designed extension and assign the relevant parameters to it.
<br>
Example:

```groovy
public void main() {
  interactive.showOkDialog("Hello, today is "+ utility.call("DateUtil","currentDateY6AsString") +" (yy-mm-dd)");
}
```
By using utilities lines of code and time to write code is saved while maintaining full performance of it. In addition, it is not necessary to write needed libraries to execute the code - all are included inside the Utility. The same example without using a Utility below:<br>
Example:

```groovy
public void main() {
  interactive.showOkDialog("Hello, today is "+ LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd")) +" (yy-mm-dd)");
}
```

## Considerations and Guidelines
The UtilityAPI is a powerful component of XtendM3 that makes writing code much more efficient and easier. Creating utilities allows to use the same code in many code-points or calling them multiple times without having to repeat previously designed code. This also eliminates the need of implementing external libraries inside the extensions.
