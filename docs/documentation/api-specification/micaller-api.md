---
layout: default
title: MICaller API
parent: API Specification
grand_parent: Documentation
nav_order: 5
---

# MICaller API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.1.0`  
**Context**: Any  
**Category**: Integration  
---

## Description
This API can be used for MI calls in XtendM3.

## Features
### Call Transaction
There are two kinds of MI Call methods to be used: one with parameters and one without them.

1. Without parameters:

```groovy
String customer;
Closure<?> callback = { Map<String, String> response ->
  logger.info("Response = ${response}");
  if(response.CUNO != null){
    customer = response.CUNO;
  }
}
    
miCaller.call("CRS610MI","LstBySearchKey", callback);
```

2. With parameters:

```groovy
String DSPname = interactive.display.fields.WRCUNM.toString();
String DSPaddress = interactive.display.fields.WRCUA1.toString();
String DSPpostalcode = interactive.display.fields.WRPONO.toString();
String DSPtown = interactive.display.fields.WRTOWN.toString();
    
Map<String, String> params = [ "SQRY":"CUNM:${DSPname}~ AND CUA1:${DSPaddress} AND PONO:${DSPpostalcode} AND TOWN:{DSPtown}".toString() ]; // toString is needed to convert from gstring to string
String customer;
Closure<?> callback = {
  Map<String, String> response ->
    logger.info("Response = ${response}");
    if(response.CUNO != null){
      customer = response.CUNO;
    }
}
    
miCaller.call("CRS610MI","SearchCustomer", params, callback);  
```

### setListMaxRecords
This method sets the maximum amount of records to be returned by the MI Caller method when using a transaction list. <br>
Example:
```groovy
String DSPname = interactive.display.fields.WRCUNM.toString();
String DSPaddress = interactive.display.fields.WRCUA1.toString();
String DSPpostalcode = interactive.display.fields.WRPONO.toString();
String DSPtown = interactive.display.fields.WRTOWN.toString();
    
Map<String, String> params = [ "SQRY":"CUNM:${DSPname}~ AND CUA1:${DSPaddress} AND PONO:${DSPpostalcode} AND TOWN:{DSPtown}".toString() ]; // toString is needed to convert from gstring to string
String customer;
Closure<?> callback = {
  Map<String, String> response ->
    logger.info("Response = ${response}");
    if(response.CUNO != null){
      customer = response.CUNO;  
    }
}

miCaller.setListMaxRecords(1);
miCaller.call("CRS610MI","SearchCustomer", params, callback);  
```

### setDateFormat
The setDateFormat method uses two parameters: character separator and date format. These are the allowed date formats: `YMD8`, `YMD6`, `MDY6`, `DMY6`, and `YWD5`. <br>
Example:
```groovy
if (program.getUser() != "CRIUBA36") {
  return 
}
String DSPname = interactive.display.fields.WRCUNM.toString();
String DSPaddress = interactive.display.fields.WRCUA1.toString();
String DSPpostalcode = interactive.display.fields.WRPONO.toString();
String DSPtown = interactive.display.fields.WRTOWN.toString();
   
Map<String, String> params = [ "SQRY":"CUNM:${DSPname}~ AND CUA1:${DSPaddress} AND PONO:${DSPpostalcode} AND TOWN:{DSPtown}".toString() ]; // toString is needed to convert from gstring to string
String customer;
Closure<?> callback = { Map<String, String> response ->
  logger.info("Response = ${response}");
  if(response.CUNO != null){
    customer = response.CUNO;
  }
}

miCaller.setDateFormat("/","YMD8");
miCaller.call("CRS610MI","SearchCustomer", params, callback);  
```