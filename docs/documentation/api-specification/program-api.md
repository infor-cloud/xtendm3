---
layout: default
title: Program API
parent: API Specification
grand_parent: Documentation
nav_order: 2
---

# Program API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.1.0`  
**Context**: Any  
**Category**: Generic  
---

## Description
The Program API contains APIs that can be used to get information from the current program. 

## Features

### getUser
Returns the current user  
<br>
Example:
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program
  private final InteractiveAPI interactive
  
  public testProgram(ProgramAPI program, InteractiveAPI interactive) {
    this.program = program
    this.interactive = interactive
  }
  
  public void main() {
    if (program.getUser() != "CRIUBA36") {
      return 
    }
    
    interactive.showCustomInfo("Current User: " + program.getUser())
  }
} 
```
### getTableRecord
To be able to retrieve a record from a specific table in the program  
<br>
Example:
```groovy
public class TestProgram extends ExtendM3Trigger {
  private final ProgramAPI program
  private final ExtensionAPI extension
  private final InteractiveAPI interactive
  
  public TestProgram(ProgramAPI program, ExtensionAPI extension, InteractiveAPI interactive) {
    this.program = program
    this.extension = extension
    this.interactive = interactive
  }
  
  public void main() {
    def mitwhl = program.getTableRecord("MITWHL")
    def whlo = mitwhl.MWWHLO
    if (program.getUser() != "CRIUBA36") {
      return 
    }
    
    interactive.showCustomInfo("Current Warehouse: " + whlo)
  }
} 
```

### LDAZD
To be able to retrieve fields mapped in LDAZD  
<br>
Example:
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program
  private final ExtensionAPI extension
  private final InteractiveAPI interactive
  
  public testProgram(ProgramAPI program, ExtensionAPI extension, InteractiveAPI interactive) {
    this.program = program
    this.extension = extension
    this.interactive = interactive
  }
  
  public void main() {
    int currentCompany = (Integer)program.getLDAZD().CONO
    if (program.getUser() != "CRIUBA36") {
      return 
    }
    
    interactive.showCustomInfo("Current Company: " + currentCompany)
  }
} 
```
### LDAZZ
To be able to retrieve field mapped in LDAZZ  
<br>
Example:
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program
  private final ExtensionAPI extension
  private final InteractiveAPI interactive
  
  public testProgram(ProgramAPI program, ExtensionAPI extension, InteractiveAPI interactive) {
    this.program = program
    this.extension = extension
    this.interactive = interactive
  }
  
  public void main() {
    int orderNum = (Integer)program.getLDAZZ().ORNO
    if (program.getUser() != "CRIUBA36") {
      return 
    }
    
    interactive.showCustomInfo("Order Number: " + orderNum)
  }
} 
```

## Considerations and Guidelines
