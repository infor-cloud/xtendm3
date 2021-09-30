---
layout: default
title: Transaction Extention Example
parent: Examples
nav_order: 1
---

# Date Utility
{: .no_toc }

Working with time and date in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Transaction Extentions are used for accessing directly either input or output transaction data.


## Use cases
* Reading input and writing output data 
* Retrieving or changing transaction parameters
* Writing error messages and skipping transactions
* Conversion between number string to Integer and double

## Important Note
Always test the examples for your own solution before using them in production.

## Step by step implementation

### 1. Open XtendM3 tool

After opening M3 main paige, select Menu on the top left corner. Then select XtendM3 from Administration Tools folder.
<img src="/assets/attachments/ex004/open_xtendm3.png">

### 2. Create new extension button
To create a new extention select "Create a new extention" button.
<img src="/assets/attachments/ex004/create_extention_button.png">

### 3. Extension Type as a transaction extension - executed by a transaction

### 4. Complete all inputs and single/ multi option
Program : Name of an existing or new program where the extention will be created;
Name: Name of the extention;
Description: Functionality of the extention; 
Multi (option): Multi option allows to create multiple records. Otherwise will create a single record.

### 5. Add input and/ or output field
Name: 4 uppercase character name of the field;
Type: text/ number;
Lenght: maximum input lenght;
Mandatory (option): choose if the input will be mandatory (only for input fields);
Description: more detailed description of the field.

### 5. Skeleton of the extension
Created extention will contain default  code template.

### 6. Code example of transaction extension

Example 1:
```groovy
public class GetData extends ExtendM3Transaction {
  private final MIAPI mi;
  private final ProgramAPI program;
  
  public GetData(MIAPI mi, ProgramAPI program) {
    this.mi = mi;
    this.program = program;
  }
  
  public void main() {
    mi.outData.put("USID",program.GetData());
  }
}
```

Example 2:
```groovy

```

### 7. Funcionality and description of designed extension

### 8. Important notes

### Exported Extension
- [NumberUtil.json](https://infor-cloud.github.io/xtendm3/assets/attachments/ex001/DateUtil.json)

### See Also
N/A