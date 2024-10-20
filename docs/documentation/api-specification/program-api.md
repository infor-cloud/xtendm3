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
The Program API contains APIs that can be used to get information from the current program, such as market, program type and more. 

## Methods

### Indicator(get)
Retrieve value of indicators.<br>
Returns boolean value of the indicator.

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
Retrieve fields mapped in LDAZD.<br>
Takes a String 'key' as parameter and returns the value of the field.

Example:
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
### LDAZZ(get)
Retrieve fields mapped in LDAZZ.<br>
Takes a String 'key' as parameter and returns the value of the field.

Example:
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

### getProgramName
Retrieve the name of the current program.

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
Retrieves records from a specific table in the program.<br>
Takes String 'table' as parameter and returns the table as type 'TableRecordAPI'.

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
Retrieves program message data.

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
Retrieves program message.

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
Checks if the given program is in the current call stack.<br>
Takes String 'program' as parameter and returns true if the program exists in the call stack, else false.

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