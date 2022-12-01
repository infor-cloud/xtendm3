---
layout: default
title: Transaction Extension Templates
parent: Templates
grand_parent: Examples
nav_order: 1
---

# Transaction Extension Templates
{: .no_toc }

Working with the Transaction Extensions in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

Documentation cointains templates for various [Transaction](../../../examples/) extensions.<br/> 
Templates can be as modified as needed.

### CRUD Templates
These templates outline best practices for **C**reate, **R**ead, **U**pdate and **D**elete operations.

#### Create
Creating, or adding one or several new records to table.
```groovy
def create() {
  DBAction query = database.table("TABLE")
    .index("00")
    .selection("FIELD1", "FIELD2", "FIELD3", "FIELD4")
    .build();
  DBContainer container = query.getContainer();
  container.set("FIELD1", "DATA1");
  container.set("FIELD2", "DATA2");
  container.set("FIELD3", "DATA3");
  container.set("FIELD4", "DATA4");
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

### Example Transaction extension template

This is a Transaction extension template with a structure that can be used for creating a new extension using container contruction and setting parameters.

```groovy
public class TransactionTemplate extends ExtendM3Transaction {
  private final MIAPI mi;
  private final DatabaseAPI database;
  private final MICallerAPI miCaller;

  public TransactionTemplate(MIAPI mi, DatabaseAPI database, MICallerAPI miCaller) {
    this.mi = mi;
    this.database = database;
    this.miCaller = miCaller;
  }

  public void main() {
    def callback = {
      Map <String, String> out ->
        if (out.error != null) {
          mi.error(out.errorMessage);
          return;
        }

        /* Setting up output data in transaction using MI API
        Remove .trim on input fields as this causes errors if fields are null
        */
        mi.outData.put("OUT1", out.get("OUT1").trim());
        mi.outData.put("OUT2", out.get("OUT2").trim());
        mi.outData.put("OUT3", out.get("OUT3").trim());
        mi.outData.put("OUT4", out.get("OUT4").trim());
        mi.outData.put("OUT5", out.get("OUT5").trim());

        //Setting container parameters
        String out6 = "";
        String out7 = "";
        if (out.get("OUT3").toInteger() == 3) {
          DBAction query = database.table("CONT01")
            .index("00")
            .selection("OQOUT1","OQOUT2","OQOUT3","OQOUT4").build();
          DBContainer CONT01 = query.getContainer();
          CONT01.set("OQOUT1", out.get("OUT1").trim().toInteger());
          CONT01.set("OQOUT2", 1);
          CONT01.set("OQOUT3", out.get("OUT3").trim().toInteger());
        }
        mi.outData.put("OUT6", out6);
        mi.outData.put("OUT7", out7);
        mi.write();
    }

    // Transaction In Data parametrers
    def params = [ "OUT2": mi.inData.get("OUT2"),
                   "IND1": mi.inData.get("PAR1"),
                   "IND2": mi.inData.get("PAR2"),
                   "IND3": mi.inData.get("PAR3"),
                   "IND4": mi.inData.get("PAR4"),
                   "IND5": mi.inData.get("PAR5"),
    ];
    miCaller.call("ABC123MI", "TransactionTemplate", params, callback);
  }
}
```
## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples is random.
- Remember to check the name of created extension while using ready templates/examples. 
 
## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)
