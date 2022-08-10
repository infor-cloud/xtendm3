---
layout: default
title: Interactive API
parent: API Specification
grand_parent: Documentation
nav_order: 10
---

# Interactive API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.1.0`  
**Context**: Interactive  
**Category**: Context Specific  
---

## Description
The Interactive API provides the capability to display a message in the UI to the user or retrieve data from the displayed form. This API can be used also to alert the user after taking an action. There are templates and custom API methods available to be used to achieve this. 

## Features 

### Retrieve Field from UI
Field data can be retrieved from the form. This can be used in displaying the message, validation, logging purposes and many more. 

Example 1
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    //Select field WWCUNO from UI
    String CUNO = interactive.display.fields.WWCUNO
    if(CUNO == null) return
  }
}
```

Example 2
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public SampleExtension(InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    String WHLO = interactive.display.fields.WRWHLO
    if(WHLO == '001'){
        interactive.display.showOkDialog("You are in warehouse " + WHLO);
    }
  }
}


```


### Show messages using standard methods
Shows message to the user with a variety of ways to be displayed.

Example 1:
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public SampleExtension(InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    interactive.showOkDialog("Customer Number: " + interactive.display.fields.WWCUNO)
  }
}
``` 

Example 2:
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public SampleExtension(InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    interactive.showWarningDialog("Customer Number: " + interactive.display.fields.WWCUNO)
  }
}
```

Example 3:
```groovy
public class CubaldoTest extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public CubaldoTest(InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    String STAT = interactive.display.fields.WWSTAT
    if(STAT != "10"){
      interactive.showError("WCO0101", interactive.display.fields.WWSTAT)  
    }
  }
}
```

### Show messages using custom methods
Show messages using custom messages instead of preset messages from M3

Example 1:
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public SampleExtension(InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    String STAT = interactive.display.fields.WWSTAT
    if(STAT != "30"){
      interactive.showCustomError("WWSTAT", "Record can only be processed with status greater than 40")  
    }
  }
}
```

Example 2:
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final InteractiveAPI interactive
  
  public SampleExtension(ProgramAPI program, ExtensionAPI extension, InteractiveAPI interactive) {
    this.interactive = interactive
  }
  
  public void main() {
    interactive.showCustomInfo("Record with Item Number: " + interactive.display.fields.WWITNO + " is has been sent to process.")
  }
}
```

## Considerations and Guidelines
### Accessing Custom Fields from Extension
If a field is not a standard field and it is defined via CMS080 or by a script, it cannot be accessed from extensions directly as opposed to other standard fields on the screen.

**Workaround** 
 H5 script can be used to send the custom field information to XtendM3 API instead.

### Accessing Chosen List Option
Currently, it is not possible to access list option from extensions.

**Workaround**
In order to perform custom validation on the B panel via extensions, you can send the chosen list option along with the record keys to an XtendM3 API instead.
