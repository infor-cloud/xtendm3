---
layout: default
title: Database Operation Templates
parent: Templates
grand_parent: Examples
nav_order: 1
---

# Database Operation Templates
{: .no_toc }

Working with the DatabaseAPI in XtendM3.
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

This documentation contains templates for CRUD+L database operations. These five operations are:

* Create, add new record(s) to table
* Read, view existing record(s) in table
* Update, change value of existing record(s) in table
* Delete, remove existing record(s) in table
* List, list a number of record(s) from table

---

### Create(add)

```groovy
/*
*  Add a single record
*/
public void create() {
  DBAction dbCreate = database.table("EXTxxx").index("00").build()
  DBContainer EXTxxx = dbCreate.getContainer()

// Set input fields
  EXTxxx.set("EXCONO", (Integer)program.LDAZD.CONO)
  EXTxxx.set("EXDIVI", program.LDAZD.DIVI)
  if(!dbCreate.read(EXTxxx)){
    EXTxxx.setInt("EXCONO", program.LDAZD.CONO.toInteger())
    EXTxxx.set("EXDIVI", program.LDAZD.DIVI)

  // Set audit fields
    EXTxxx.set("EXRGDT", LocalDate.now().format(DateTimeFormatter.ofPattern("YYYYMMdd")).toInteger())
  	EXTxxx.set("EXRGTM", LocalTime.now().format(DateTimeFormatter.ofPattern("HHmmss")).toInteger())
  	EXTxxx.set("EXLMDT", LocalDate.now().format(DateTimeFormatter.ofPattern("YYYYMMdd")).toInteger())
  	EXTxxx.set("EXCHNO", 0)
  	EXTxxx.set("EXCHID", program.getUser())
    dbAction.insert(EXTxxx)
  } else {
    mi.error("Record already exists")
    return
  }
}
```
#### Notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples is random.
- Remember to check the name of created extension while using ready templates/examples

### Read(get)
```groovy
/*
*  Retrieve a single record
*/
public void get() {
  DBAction dbGet = database.table("EXTxxx").index("00").selection("EXCONO", "EXDIVI").build()
  DBContainer EXTxxx = dbGet.getContainer()
  EXTxxx.set("EXCONO", (Integer)program.LDAZD.CONO)
  EXTxxx.set("EXDIVI", program.LDAZD.DIVI)
  if (dbAction.read(EXTxxx)){
    xx = EXTxxx.get("EXCONO").toInteger()
	yy = EXTxxx.get("EXDIVI")
  } else {
    mi.error("Record not found")
    return
  }
}
```
#### Notes
- Note

### Update
```groovy
/*
*  Update a single record
*/
public void update() {
  DBAction dbUpd = database.table("EXTxxx").index("00").build()
  DBContainer EXTxxx = dbUpd.getContainer()
  EXTxxx.set("EXCONO", (Integer)program.LDAZD.CONO)
  EXTxxx.set("EXDIVI", program.LDAZD.DIVI)
  Closure<?> updateRecord = {LockedResult lockedResult ->
    lockedResult.set("MGxxxx", xx)
    EXTxxx.set("EXLMDT", LocalDate.now().format(DateTimeFormatter.ofPattern("YYYYMMdd")).toInteger())
  	EXTxxx.set("EXCHNO", lockedResult.get("EXCHNO" + 1)
  	EXTxxx.set("EXCHID", program.getUser())
    lockedResult.update()
  }
  if (!dbAction.readLock(EXTxxx, updateRecord)){
    mi.error("Record not found")
    return
  }
}
```
#### Notes
- Note

### Delete
```groovy
/*
*  Delete a single record
*/
public void delete() {
  DBAction dbDel = database.table("EXTxxx").index("00").build()
  DBContainer EXTxxx = dbDel.getContainer()
  EXTxxx.set("EXCONO", (Integer)program.LDAZD.CONO)
  EXTxxx.set("EXDIVI", program.LDAZD.DIVI)
  Closure<?> deleteRecord = {LockedResult lockedResult ->
    lockedResult.delete()
  }
  if (!dbAction.readLock(EXTxxx, deleteRecord)){
    mi.error("Record not found")
    return
  }
}
```
#### Notes
- Note

### List
```groovy
/*
*  Retrieve multiple records
*/
public void list() {
  DBAction dbLst = database.table("EXTxxx").index("00").selectAllFields().build()
  DBContainer EXTxxx = dbLst.getContainer()
  EXTxxx.set("EXCONO", (Integer)program.LDAZD.CONO)
  EXTxxx.set("EXDIVI", program.LDAZD.DIVI)
  Closure<?> listRecord = { DBContainer data ->
    XXOK = true
    return    //exit closure
  }
  dbLst.readAll(EXTxxx, 2, listRecord)
}
```
#### Notes
- Note