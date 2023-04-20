---
layout: default
title: CRUD Extension Templates
parent: Templates
grand_parent: Examples
nav_order: 3
---

# CRUD Extension Templates
{: .no_toc }

Templates for database operations.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This page contains templates for common database operations.

### CRUD Templates
These templates outline best practices for **C**reate, **R**ead, **U**pdate and **D**elete operations.

#### Create
Creating, or adding one or several new records to table.
```groovy
void create() {
  DBAction query = database.table("EXTMIT")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.set("EXCONO", 111);
  container.set("EXDIVI", "AAA");
  container.set("EXITNO", "Y10001");
  container.set("EXITDS", "Case of Grease Cleaner - 6x22oz");
  container.set("EXSTAT", "10");
  container.set("EXRESP", "NNAMESSON");
  query.insert(container);
}
```

#### Read
Reading one or several records from table.

##### Read one record
```groovy
def read() {
  DBAction query = database.table("TABLE")
    .index("00")
    .selection("FIELD1", "FIELD2", "FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  container.set("FIELD2", "DATA2");
  if(query.read(container)) {
    String message = container.get("FIELD3");
    String data = container.get("FIELD4");
    //Use found record(s) as intended
  }
}
```
##### Read multiple records
```groovy
def multiRead() {
  DBAction query = database.table("TABLE")
    .index("00")
    .selection("FIELD1", "FIELD2", "FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  query.readAll(container, NUMBERofRECORDS, callback);
}
Closure<?> callback = { DBContainer container ->
  String message = container.get("FIELD3");
  String data = container.get("FIELD4");
  //Use found record(s) as intended
}
```
##### Read multiple records with filter
```groovy
def filteredMultiRead() {
  ExpressionFactory expression = database.getExpressionFactory("TABLE");
  expression = expression.eq("FIELD3", "DATA3").and(expression.lt("FIELD1", "DATA1"));
  DBAction query = database.table("TABLE")
    .index("00")
    .matching(expression)
    .selection("FIELD1", "FIELD2", "FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  query.readAll(container, NUMBERofRECORDS, callback);
}
Closure<?> callback = { DBContainer container ->
  String message = container.get("FIELD3");
  String data = container.get("FIELD4");
  //Use found record(s) as intended
}
```

#### Update
Update existing record(s) in table
```groovy
def update() {
  DBAction query = database.table("TABLE")
    .index("00")
    .selection("FIELD1", "FIELD2", "FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  container.set("FIELD2", "DATA2");
  query.insert(container, { LockedResult updateRecord ->
    updateRecord.set("FIELD3", "DATA3");
    updateRecord.update();
  });
}
```

#### Delete
Delete record(s) from table
```groovy
def delete() {
  DBAction query = database.table("TABLE")
    .index("00")
    .selection("FIELD1", "FIELD2", "FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  container.set("FIELD2", "DATA2");
  query.readLock(container, callback);
}
Closure<?> callback = { LockedResult lockedResult ->
  lockedResult.delete();
}
```

## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples are random.
- Remember to check the name of created extension while using ready templates/examples.

## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)