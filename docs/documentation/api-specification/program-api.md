---
layout: default
title: Program API
parent: API Specification
grand_parent: Documentation
nav_order: 12
---

# Program API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.1` <br>
**Context**: Any <br>
**Category**: Generic  
---

## Description
The Program API contains methods that can be used to retrieve information from the current program context. <br>
This API can be injected into all type of extensions, but methods available varies.

## Methods
Methods available for the Program API.

### indicator.get()
Retrieve value of specified indicator. <br>

**Parameter:**
* Integer - indicator

**Returns:**
* Boolean - indicator value

**Example:**
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program

  public testProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    boolean indicatorValue = program.indicator.get(60);

    ...
  }
}
```

### LDAZD.get()
Retrieve field(s) mapped in LDAZD. <br>
LDAZD is an object in M3 BE that contains runtime environment variables for the current user, such as company number(CONO) and division(DIVI).


**Parameter:**
* String - LDAZD field name

**Returns:** 
* String/Integer - indicator field value

**Example:**
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public testProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    int currentCompany = program.LDAZD.get("CONO");

    ...
  }
} 
```

### LDAZZ.get()
Retrieve fields mapped in LDAZZ. <br>
LDAZZ is an object in M3 BE that contains runtime environment variables for the current user, such as company number(CONO) and division(DIVI).


**Parameter:**
* String - LDAZZ field name

**Returns:**
* String/Integer - indicator field value

**Example:**
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public testProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    String orderNum = program.LDAZZ.get("ORNO");

    ...
  }
} 
```

### getProgramName()
Retrieve the name of the current program. <br>
For example, if you have a Trigger extension on 'MNS100' the method will return String 'MNS100'.


**Returns:**
* String - current program

**Example:**
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    String currentProgram = program.getProgramName();

    ...
  }
}
```

### getMarket
Retrieve the market of the current job. <br>
Will always return a valid system component, will never be "ALL". 


Returns: `String 'market'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    String currentMarket = program.getMarket();
    if(currentMarket != "MSE") {
      return;
    }

    ...
  }
}
```

### getUser
Retrieves the current users' username.  


Returns: `String 'user'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    if (program.getUser() != "CRIUBA36") {
      return;
    }

    ...
  }
}
```

### getProgramType
Retrieves the current program type(e.g. INTERACTIVE).


Returns: `String 'programType'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    String currentProgramType = program.getProgramType();

    ...
  }
}
```

### getNumberOfInputParameters
Retrieves the programs' number of input parameters.  


Returns: `int 'numberOfInputParameters'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    int numberOfInputParameters = program.getNumberOfInputParameters();

    ...
  }
}
```

### getJobNumber
Retrieves the current job number.  


Returns: `String 'jobNumber'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    String currentJobNumber = program.getJobNumber();
    
    ...
  }
}
```

### getTableRecord
Retrieves records from a specific table in the program.  
Only one record per column available.

Parameter: `String 'table'`
<br>
Returns: `TableRecordAPI`

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    TableRecordAPI mitwhl = program.getTableRecord("MITWHL");
    String whlo = mitwhl.MWWHLO;

    ...
  }
} 
```

### getMessageId
Retrieves the current message ID(program heading).  


Returns: `String 'messageID'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    String messageID = program.getMessageId();

    ...
  }
}
```

### getMessageData
Retrieve message data.  


Returns: `String 'messageData`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    String messageData = program.getMessageData();
    
    ...
  }
} 
```

### getMessage
Retrieve message.  


Returns: `String 'message'`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    String message = program.getMessage();
    
    ...
  }
} 
```

### getTenantId
Retrieve the current tenant ID.  


Returns: `String 'tenantID`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    String tenantID = program.getTenantId();
    
    ...
  }
} 
```

### existsInCallStack
Checks if the given program is in the current call stack.  


Parameters: `String program` 
<br>
Returns: `boolean`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    boolean programExists = program.existsInCallStack(String program);
    
    ...
  }
} 
```

### isShutdownInProgress
Checks if program shutdown is in progress.  


Returns: `boolean`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    boolean programShutdown = program.isShutdownInProgress(String program);
    
    ...
  }
} 
```

### exitFlag
Checks if the exit flag is active.  


Returns: `boolean`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    boolean exitFlagActive = program.exitFlag();
    
    ...
  }
} 
```

### existsError
Checks if the error flag is true(alternative to program.indicator.get(60)).  


Returns: `boolean`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    boolean existsError = program.existsError();
    
    ...
  }
} 
```

## Considerations and Guidelines
It is considered a good practice to learn about the program you're extending first, to understand the full potential of the Program API.