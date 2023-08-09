---
layout: default
title: Database Operation Templates
parent: Templates
grand_parent: Examples
nav_order: 3
---

# Database Operation Templates
{: .no_toc }

Working with the Database Operations in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
This document contains different templates for various database operations.

### CRUD Templates
These templates outline best practices for **C**reate, **R**ead, **U**pdate and **D**elete operations.

#### Create
Creating, or adding one or several new records to table.
```groovy
def create() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  container.set("FIELD2", "DATA2");
  container.set("FIELD3", "DATA3");
  container.set("FIELD4", "DATA4");
  query.insert(container);
  query.write();
}
```

#### Read
Reading one or several records from table.

##### Read one record
```groovy
def read() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .selection("FIELD3", "FIELD4")
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
  DBAction query = database.table("TABLENAME")
    .index("00")
    .selection("FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  query.readAll(container, numberOfKeys, numberOfRecords, callback);
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
  ExpressionFactory expression = database.getExpressionFactory("TABLENAME");
  expression = expression.eq("FIELD3", "DATA3").and(expression.lt("FIELD1", "DATA1"));
  DBAction query = database.table("TABLENAME")
    .index("00")
    .matching(expression)
    .selection("FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  query.readAll(container, numberOfKeys, numberOfRecords, callback);
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
  DBAction query = database.table("TABLENAME")
    .index("00")
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
  DBAction query = database.table("TABLENAME")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  container.set("FIELD2", "DATA2");
  container.set("FIELD3", "DATA3");
  query.readLock(container, callback);
}
Closure<?> callback = { LockedResult lockedResult ->
  lockedResult.delete();
}
```