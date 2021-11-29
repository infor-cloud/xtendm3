---
layout: default
title: Data Retrieve Utility
parent: Examples
nav_order: 1
---
 
# Data Retrieve Utility
{: .no_toc }
 
Working with transaction data in XtendM3
{: .fs-6 .fw-300 }
 
## Table of contents
{: .no_toc .text-delta }
 
1. TOC
{:toc}
 
---
 
## Description
When using Transaction extensions there are many times when inputted data must be validated. By having more and more data inside the database, the need to spend more time on validation increases. It makes the extension designer’s job much more time consuming. Therefore the utility can make the work on the extensions much more efficient. Data Retrieve Utility checks inputted data in transaction fields and returns correct results for different cases.
 
## Benefit
Having a utility helps keep the logic in one place and increase maintainability of the code. It also makes it possible to reuse between projects and solutions and if there are any issues found, there is only one source that needs to be corrected.
 
 
## Use cases
* Retrieving data from database
* Checking if parameter is sent in and validation for value sent in as blank, “0”, “?” and text/numeric type
* Date format validation
* Additional functionality for extensions
 
 
## Important Note
Always test the examples for your own solution before using them in production.
 
## Materials
 
### Utility Extension Code
```groovy
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.time.format.DateTimeFormatterBuilder
import java.util.Optional
 
public class DataRetriveUtil extends ExtendM3Utility {

  /**
   * To validate inputed data
   * @param mi Instance of MI API
   * @param fieldName Name of the field from which the input will be taken to validation
   * @param type Type of inputed value
   * @param defaultValue Value which should be returned in case of wrong data input***
   * @return value in a proper format
   */
  def <T> Optional<T> getInput(MIAPI mi, String field, Class<T> type, T defaultValue) {
    String value = mi.inData.get(field).trim()
    if (value == null || value.isEmpty()) {
      return Optional.ofNullable(defaultValue)
    }
    T result = null
    if (String.class == type) {
      result = "?".equals(value) ? "" : value;
    } else if (Integer.class == type) {
      result = "?".equals(value) ? 0 : Integer.valueOf(value);
    } else if (Long.class == type) {
      result = "?".equals(value) ? 0L : Long.valueOf(value);
    } else if (Double.class == type) {
      result = "?".equals(value) ? 0d : Double.valueOf(value);
    } else if (BigDecimal.class == type) {
      result = "?".equals(value) ? new BigDecimal("0") : new BigDecimal(value);
    } else if (LocalDate.class == type) {
      result = "?".equals(value) ? LocalDate.ofEpochDay(0) : convertDate(value, mi.getDateFormat());
    }
    return Optional.ofNullable(result);
  }
  
  /**
   * To check and convert date into a proper format
   * @param date Inputed date
   * @param format Format of inputed date
   * @return date value in a proper format
   */
  private LocalDate convertDate(String date, String format) {
    if ("YMD8".equals(format)) {
      return LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyyMMdd"))
    } else if ("YMD6".equals(format)) {
      return LocalDate.parse(date, DateTimeFormatter.ofPattern("yyMMdd"))
    } else if ("MDY6".equals(format)) {
      return LocalDate.parse(date, DateTimeFormatter.ofPattern("MMddyy"))
    } else if ("DMY6".equals(format)) {
      return LocalDate.parse(date, DateTimeFormatter.ofPattern("ddMMyy"))
    } else if ("YWD5".equals(format)) {
      return LocalDate.parse(date, DateTimeFormatter.ofPattern("yywwe"))
    }
    return null
  }
}

```

### Utility call in Transaction Extension

Calling the Utility should be executed as in example below:

```groovy
import java.util.Optional;
import java.time.LocalDate;
import java.math.BigDecimal;
public class DataRetrTest extends ExtendM3Transaction {
  private final MIAPI mi;
  private final UtilityAPI utility;

  public DataRetrTest(MIAPI mi, UtilityAPI utility) {
    this.mi = mi;
    this.utility=utility;
  }
  
  public void main() {
    Optional<String> name = (Optional<String>)utility.call("DataRetriveUtil", "getInput", mi, "NAME", String.class, "default");
    Optional<Integer> NUMB = (Optional<Integer>)utility.call("DataRetriveUtil", "getInput", mi, "NUMB", Integer.class, -1);
    Optional<Long> LONG = (Optional<Long>)utility.call("DataRetriveUtil", "getInput", mi, "LONG", Long.class, -1L);
    Optional<LocalDate> LOCD = (Optional<LocalDate>)utility.call("DataRetriveUtil", "getInput", mi, "LOCD", LocalDate.class, LocalDate.now()); //choose date format later in M3 MetaData Publisher before entering data inside 
    Optional<BigDecimal> BDEC = (Optional<BigDecimal>)utility.call("DataRetriveUtil", "getInput", mi, "BDEC", BigDecimal.class, -1); 
  

    mi.outData.put("OTXT", name.get())
    mi.outData.put("OINT", NUMB.get().toString())
    mi.outData.put("OLNG", LONG.get().toString())
    mi.outData.put("LOCD", LOCD.get().toString())
    mi.outData.put("BDEC", BDEC.get().toString())
  
  }
}
```
<br>
If executed correctly the output should return the values as set in utility and default value in call.<br>
To change date format click the engine button and choose from the list.<br>

<img src="../../../assets/attachments/util-dataretriever/Retrieve4.PNG" width="950">

Value set as:

* Blank

<img src="../../../assets/attachments/util-dataretriever/Retrieve3.PNG" width="950">

* "?"

<img src="../../../assets/attachments/util-dataretriever/Retrieve2.PNG" width="950">

* Value type 

<img src="../../../assets/attachments/util-dataretriever/Retrieve1.PNG" width="950">


 
### Exported Extension
- [DataRetrieveUtil.json](../../../assets/attachments/util-dataretriever/UTILITY-DataRetriveUtil.json)
 
### See Also
[Utility Extension](../../../examples/Utility-extension)<br>
[Use cases](../../../examples/use-cases)<br>
[Examples](../../../examples)
 
 
 
 

