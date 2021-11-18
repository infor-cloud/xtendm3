---
layout: default
title: Trigger Extension Templates
parent: Examples
nav_order: 1
---

# Trigger Extension Templates
{: .no_toc }

Working with the Trigger Extensions in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
This document contains templates of using different APIs in a Trigger Extension. 

## DataBase API to create a container

```groovy
public class DatabaseTemplate extends ExtendM3Trigger {

  private final DatabaseAPI database;

  
  
  public DatabaseTemplate(DatabaseAPI database) {
    this.database = database;
  }
  public void main() {
    DBContainer NAME = database.createContainer("NAME")
  
    DBAction query = database.table("NAME")
      .index("00")
      .selection("ELEM01", "ELEM02", "ELEM03", "ELEM04")
      .build();

    DBContainer container = query.getContainer()
    container.set("ELEM01", "Sample Item")
    query.insert(container)
  }
}
```

## Logger API 

```groovy
public class LoggerTemplate extends ExtendM3Trigger {
  private final LoggerAPI logger;
  
  public LoggerTemplate(LoggerAPI logger) {
    this.logger = logger;
  }
  
  public void main() {
    logger.info("Insert info message here")
    }
  }
}
```

## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples is random.
- Remember to check the name of created extension while using ready templates/examples
 
 
## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)
