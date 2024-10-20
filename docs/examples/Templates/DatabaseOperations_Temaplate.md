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
This document contains diffrent templates for various database operations.

### CRUD Templates
These templates outline best practices for **C**reate, **R**ead, **U**pdate and **D**elete operations.

#### Create
Creating, or adding one or several new records to table.
```groovy
void create() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.setString("FIELD1", "DATA1");
  container.setString("FIELD2", "DATA2");
  container.setInt("FIELD3", 3);
  container.setChar("FIELD4", '4');
  query.insert(container);
}
```

#### Read
Reading one or several records from table.

##### Read one record
```groovy
void read() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .selection("FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.setString("FIELD1", "DATA1");
  container.setDouble("FIELD2", 2.0);
  if(query.read(container)) {
    String message = container.getString("FIELD3");
    Character character = container.getDouble("FIELD4");
    //Use found record(s) as intended
  }
}
```
##### Read multiple records
```groovy
void multiRead() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .selection("FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.setString("FIELD1", "DATA1");
  container.setInt("FIELD2", 2);
  int nrOfKeys = 2;
  int nrOfRecords = mi.getMaxRecords() <= 0 || mi.getMaxRecords() >= 10000? 10000: mi.getMaxRecords();
  query.readAll(container, nrOfKeys, nrOfRecords, callback);
}
Closure<?> callback = { DBContainer container ->
  String message = container.getString("FIELD3");
  Integer data = container.getInt("FIELD4");
    //Note: Integer can store null value, while int can store null value,
      // keep that in mind while designing your extension  
  //Use found record(s) as intended
}
```
##### Read multiple records with filter
```groovy
void filteredMultiRead() {
  ExpressionFactory expression = database.getExpressionFactory("TABLENAME");
  expression = expression.eq("FIELD3", "DATA3").and(expression.lt("FIELD1", "DATA1"));
  DBAction query = database.table("TABLENAME")
    .index("00")
    .matching(expression)
    .selection("FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.setString("FIELD1", "DATA1");
  container.setInt("FIELD2", 2);
  int nrOfKeys = 2;
  int nrOfRecords = mi.getMaxRecords() <= 0 || mi.getMaxRecords() >= 10000? 10000: mi.getMaxRecords();  
  query.readAll(container, nrOfKeys, nrOfRecords, callback);
}
Closure<?> callback = { DBContainer container ->
  String message = container.getString("FIELD3");
  Integer data = container.getInt("FIELD4");
    //Note: 'Integer' can store null value, while 'int' cannnot.
      // Keep that in mind while designing your extension
  //Use found record(s) as intended
}
```

#### Update
Update existing record(s) in table
```groovy
void update() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.setString("FIELD1", "DATA1");
  container.setInt("FIELD2", 2);
  query.insert(container, { LockedResult updateRecord ->
    updateRecord.setChar("FIELD3", '3');
    updateRecord.update();
  });
}
```

#### Delete
Delete record(s) from table
```groovy
void delete() {
  DBAction query = database.table("TABLENAME")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.setString("FIELD1", "DATA1");
  container.setInt("FIELD2", 2);
  query.readLock(container, callback);
}
Closure<?> callback = { LockedResult lockedResult ->
  lockedResult.delete();
}
```