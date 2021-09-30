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
Transaction Extentions are used for accessing directly either input or output  transaction data 

## Use cases
* Reading input and writing output data 
* Retrieving or changing transaction parameters
* Writing error messages and skipping transactions
* Conversion between number string to Integer and double

## Important Note
Always test the examples for your own solution before using them in production.

## Step by step implementation

### 1. Open XtendM3 tool 
<img src="./open_xtendm3.png" />

### 2. Create new extension button

### 3. Extension Type as a transaction extension - executed by a transaction
### 4. Complete all inputs + description of them
### 5. Skeleton of the extension
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

### 7. funcionality and description of designed extension
### 8. Important notes

### Exported Extension
- [NumberUtil.json](https://infor-cloud.github.io/xtendm3/assets/attachments/ex001/DateUtil.json)

### See Also
N/A