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

## Methods

### Indicator(get)
Retrieve value of indicators.  
<br>
Returns: `boolean`
<br>

Example:
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

### LDAZD(get)
Retrieve fields mapped in LDAZD.  
<br>
Parameter: `String 'key'`
<br>
Returns: `value of the field, null if get fails`
<br>

Example:
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public testProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    int currentCompany = (Integer)program.getLDAZD().CONO;

    ...
  }
} 
```
### LDAZZ(get)
Retrieve fields mapped in LDAZZ.  
<br>
Parameter: `String 'key'`
<br>
Returns: `value of the field, null if get fails`
<br>

Example:
```groovy
public class testProgram extends ExtendM3Trigger {
  private final ProgramAPI program;
  
  public testProgram(ProgramAPI program) {
    this.program = program;
  }
  
  public void main() {
    int orderNum = (Integer)program.getLDAZZ().ORNO;

    ...
  }
} 
```

### getProgramName
Retrieve the name of the current program.  
<br>
Returns: `String 'currentProgram'`
<br>

Example: 
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
Retrieve the market of the current job. Will always return a valid system component, will never be "ALL".  
<br>
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
Retrieves the current username.  
<br>
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
Retrieves the current program type(e.g. interactive).  
<br>
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
<br>
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
<br>
Returns: `int 'jobNumber`
<br>

Example:
```groovy
public class exampleProgram extends ExtendM3Trigger {
  private final ProgramAPI program;

  public exampleProgram(ProgramAPI program) {
    this.program = program;
  }

  public void main() {
    int currentJobNumber = program.getJobNumber();

    ...
  }
}
```

### getTableRecord
Retrieves records from a specific table in the program.  
<br>
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
<br>
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
<br>
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
<br>
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
<br>
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
<br>
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
    boolean programShutdown = program.isShutdownInProgress(String program);
    
    ...
  }
} 
```

### exitFlag
Checks if the exit flag is active.  
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
    boolean exitFlagActive = program.exitFlag();
    
    ...
  }
} 
```

### existsError
Checks if the error flag is true(alternative to program.indicator.get(60)).  
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
    boolean existsError = program.existsError();
    
    ...
  }
} 
```

## Considerations and Guidelines
