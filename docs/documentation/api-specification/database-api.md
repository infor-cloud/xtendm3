---
layout: default
title: Database API
parent: API Specification
grand_parent: Documentation
nav_order: 7
---

# Database API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.5.0`  
**Context**: Any  
**Category**: Storage  
---

## Description
This API allows you to work and interact with the database layer of M3 Business Engine. With the DatabaseAPI it is possible
to perform create/read/update/delete queries and execute them. Any changes done on the database will be directly
visible to the Business Engine program that the extension is connected to.

Before starting with the code, to understand the database better it is important to get familiar with the different
concepts, APIs and tools used to perform an operation on the database. 

### DatabaseAPI
The main API that needs to be injected to the extension to perform any database-related operation. All other APIs
that are stated below will be retrieved from this API and shall not be declared on top of the extension. The DatabaseAPI
is used to define the operations that will be executed on database.

### ExpressionFactory / ExpressionFactoryAPI
An API which provides you the standard M3's `FieldSelection` functionality for database operations. This is used to
define more advanced filters on fields that may or may not be index fields. 

Since this API provides the ability to perform filtering on non-indexed fields, it should be used sparingly as it might lead to performance penalties.

### DBAction / DBActionAPI
This API is used to create the query which will be used to perform either of the CRUD(create/read/update/delete) operations. 
Information about which table, index, table fields and possible filters can and should also be defined in this query.

### DBContainer / DBContainerAPI
A container that contains table fields and values. It is used both for setting the keys before executing the operation
and also for getting the result after the operation has been executed.

### LockedResult / LockedResultAPI
An extended version of DBContainer which contains a locked record's fields and values and also methods to perform update
and delete operation on this locked record.

## Features

### Create a record
The example below illustrates how to create and set a record.

Example:
```groovy
void createTableRecord() {
    DBAction query = database.table(*TABLE*)
      .index("00")
      .build();
    DBContainer container = database.createContainer();
    container.set(*FIELD*, *DATA*)
    query.insert(container)
  }
```

### Read a specific record
To read a specific record, primary keys or full index keys should be used to look up the data. The example below
illustrates how to retrieve an item.

Example:

Read an item with the index 00 keys

```groovy
void readRecord() {
  int currentCompany = (Integer)program.getLDAZD().CONO;
  DBAction query = database.table("MITMAS")
    .index("00")
    .selection("MMITDS", "MMSTAT")
    .build();
  DBContainer container = query.getContainer();
  container.setInt("MMCONO", currentCompany);
  container.setString("MMITNO", "SAMPLE-ITEM");
  if (query.read(container)) {
    String description = container.getString("MMITDS");
    String status = container.getString("MMSTAT");
  }
}
```

**Note** selection is only needed for read operations. Furthermore, only the fields being read(container.get fields) are needed in the selection. As the example above suggests. 

### Read multiple records
To read multiple records a database action should be defined along with a `Closure<?>` that defines how each read record
will be processed/used.
When reading multiple records, the 'readAll' function including 'pageSize' should be used. 'pageSize' is referred to as 'nrOfRecords' in the examples below. Ten thousand records is the recommended maximum value of pageSize. 

Example:

Read all items with status 20 in a specific company and perform an action on each found record

```groovy
void handleReleasedItems() {
  int nrOfRecords = mi.getMaxRecords() <= 0 || mi.getMaxRecords() >= 10000? 10000: mi.getMaxRecords();    
  int currentCompany = (Integer)program.getLDAZD().CONO;
  DBAction query = database.table("MITMAS")
    .index("20")
    .selection("MMITDS", "MMITNO")
    .build();
  DBContainer container = query.getContainer();
  container.setInt("MMCONO", currentCompany);
  container.setString("MMSTAT", "20");
  query.readAll(container, 2, nrOfRecords, releasedItemProcessor);
}

Closure<?> releasedItemProcessor = { DBContainer container ->
  String description = container.getString("MMITDS");
  String status = container.getString("MMITNO");
  // Use this found record as intended
}
```

### Read with selection
Database API has support for expressions and filters, to use the feature, an instance of `ExpressionFactory` should be
retrieved to build the filter and then used to build the DBAction. The rest is identical to a normal operation. 

Example:

Read all items in current company, status set to 20, item group set to `EX-GROUP` and custom field greater than or equal
to 2.

```groovy
public void main() {
  ExpressionFactory expression = database.getExpressionFactory("TABLE");
  expression = expression.eq("MMITGR", "EX-GROUP").and(expression.gt("MMCFI1", "2"));
  DBAction query = database.table("MITMAS")
    .index("20")
    .matching(expression)
    .selection("MMITDS", "MMITNO")
    .build();
  DBContainer container = query.getContainer();
  container.setInt("MMCONO", currentCompany);
  container.setString("MMSTAT", "20"); 
  int nrOfKeys = 2;
  int nrOfRecords = mi.getMaxRecords() <= 0 || mi.getMaxRecords() >= 10000? 10000: mi.getMaxRecords();    
  query.readAll(container, nrOfKeys, nrOfRecords, releasedItemProcessor);
}

Closure<?> releasedItemProcessor = { DBContainer container ->
  String description = container.getString("MMITDS");
  String itemNumber = container.getString("MMITNO");
}
```

Example: 

Read two fields from table record, using three other fields in the same record.

```groovy
public void main() {
  inCONO = mi.inData.get("CONO") == null? "": mi.inData.get("CONO").trim();
  inSTAT = mi.inData.get("STAT") == null? "": mi.inData.get("STAT").trim();
  inITNO = mi.inData.get("ITNO") == null? "": mi.inData.get("ITNO").trim(); 

  DBAction query = database.table("MITMAS")
    .index("00")
    .selection("MMRESP", "MMTPCD")
    .build();
  DBContainer container = query.getContainer();
  container.set("MMCONO",inCONO);
  container.set("MMSTAT",inSTAT);
  container.set("MMITNO",inITNO);

  Closure<?> readCallback = { DBContainer readResult ->
    if (mi.hasRemainingRecords()) {
      mi.outData.put("RESP", readResult.get("MMRESP").toString());
      mi.outData.put("TPCD", readResult.get("MMTPCD").toString());
      mi.write();
    }
  }
  int nrOfKeys = 3;
  int nrOfRecords = mi.getMaxRecords() <= 0 || mi.getMaxRecords() >= 10000? 10000: mi.getMaxRecords();    
  query.readAll(container, nrOfKeys, nrOfRecords, readCallback)
}
```

### Update a specific record
To update a table record, the record must be called and update should be performed in callback Closure.

Example:

Read item and update status to 90
```groovy
void deprecateItem() {
  int currentCompany = (Integer)program.getLDAZD().CONO;
  DBAction query = database.table("MITMAS")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.setInt("MMCONO", currentCompany);
  container.setString("MMITNO", "123456789123456");
  query.readLock(container, updateCallBack);
}

Closure<?> updateCallBack = { LockedResult lockedResult ->
  lockedResult.set("MMSTAT", "90");
  lockedResult.update();
}
```

### Update multiple records
Updating multiple records is not much different from updating once specific record. The only difference would be the
method called and the number of keys that are used for reading the records.

Example:

Read all items in with status 20 in a company and set the status to 90 for them
```groovy
void deprecateItems() {
  int currentCompany = (Integer)program.getLDAZD().CONO;
  DBAction query = database.table("MITMAS")
    .index("20")
    .build();
  DBContainer container = query.getContainer();
  container.setInt("MMCONO", currentCompany);
  container.setString("MMSTAT", "20");
  int nrOfKeys = 2; 
  query.readAllLock(container, nrOfKeys, updateCallBack);
}

Closure<?> updateCallBack = { LockedResult lockedResult ->
  lockedResult.setString("MMSTAT", "90");
  lockedResult.update();
}
```

### Delete record(s)
Deleting one or several records from the database is no different than update. The only difference would be the `update`
call which is replaced with `delete` instead. 

Example:

Delete item(s) with status 90
```groovy
void deprecateItem() {
  int currentCompany = (Integer)program.getLDAZD().CONO;
  DBAction query = database.table("MITMAS")
    .index("00")
    .build();
  DBContainer container = query.getContainer();
  container.setInt("MMCONO", currentCompany);
  container.setString("MMSTAT", "90");
  int nrOfKeys = 2;
  query.readAllLock(container, nrOfKeys, deleterCallback);
}

Closure<?> deleterCallback = { LockedResult lockedResult ->
  lockedResult.delete();
}
```

## Considerations and Guidelines
The ability to work with database directly is a very tempting solution. It is extremely flexible and yet quite dangerous
if it is not handled properly. Keep the following points in mind when working with the DatabaseAPI:

* Stick to standard M3 APIs when possible, using direct record insert/update you skip all validations that are done by
    M3 which might lead to corrupt data in the database.
* If current program is using the table you are performing operations on, the changes will affect the record read by the
    program. This might be intentional in some cases. In some other cases you might retrieve another record while the
    program was processing the original record and it can lead to undefined behavior.
* Avoid using ExpressionFactory and matching filters when possible and leverage defined indexes instead.
* Avoid retrieving too many columns, only retrieve the ones you need.
* Avoid creating queries that affect large data set. This is not meant to be used for going through thousands of
    records.
* Avoid performing expensive tasks and calculations while locking a record. Locking a record blocks all other programs
    in M3 to perform operations on this record.