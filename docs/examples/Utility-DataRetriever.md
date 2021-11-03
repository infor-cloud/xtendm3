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
 
### Extension Code
```groovy
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.time.format.DateTimeFormatterBuilder
import java.util.Optional
 
public class DataRetriveUtil extends ExtendM3Utility {

  /**
   * To retrive and validate inputed data
   * @param mi Instance of MI API
   * @param fieldName Name of the field from which the input will be taken to validation
   * @param type Type of inputed value
   * @param defaultValue Value which should be returned in case of wrong data input***
   * @return value in a proper format
   */
 
  def <T> Optional<T> getInput(MIAPI mi, String fieldName, Class<T> type, T defaultValue) {
    String value = mi.inData.get(field).trim()
    if (value == null || value.isEmpty()) {
      return Optional.ofNullable(defaultValue)
    }
    if(getField(mi, fieldName)) {
      if (String.class == type) {
        validateStringType(mi, fieldName);

      } else if (Integer.class == type) {
        validateNumericalIntegerType(mi, fieldName);
      
      } else if (Long.class == type) {
        validateNumericalIntegerType(mi, fieldName);
      
      } else if (Double.class == type) {
        validateNumericalDoubleType(mi, fieldName);
      
      } else if (BigDecimal.class == type) {
        validateNumericalDoubleType(mi, fieldName);
      
      } else if (LocalDate.class == type) {
        if (convertDate(mi.inData.get(fieldName).trim(), mi.getDateFormat()) != null)
        convertDate(mi.inData.get(fieldName).trim(), mi.getDateFormat());
        else
        return Optional.empty();
        
      } else {
        return Optional.empty();
      }
    }
  }
   
 	/**
   * To check if inputted value of String type is empty or null
   * @param mi Instance of MI API
   * @param fieldName Name of the field from which the input will be taken to get information from field
   * @return (true) - value Optional.of(“”)
   * @return (false) - inputted value from mi.in.get(...)  
   */

  public Optional<String> validateStringType(MIAPI mi, String fieldName){
    if (mi.inData(fieldName).isBlank() || mi.inData(fieldName).equals("?")){
        return Optional.of("")
    } else {
        return Optional.of(mi.in.get(fieldName));
    }
  }
 
	/**
   * To check if inputted value of double type is empty or null
   * @param mi Instance of MI API
   * @param fieldName Name of the field from which the input will be taken to get information from field
   * @return (true) - value Optional.of(“”)
   * @return (false) - inputted value from mi.in.get(...)  
   */
 
  public Optional<String> validateNumericalDoubleType(MIAPI, String fieldName){
    if (mi.in.get(fieldName).isBlank() || mi.in.get(fieldName).equals("?")){
        return Optional.of("0.0");
    } else {
        return Optional.of(mi.in.get(fieldName).toString());
    }
  }
   
	/**
   * To check if inputted value of int type is empty or null
   * @param mi Instance of MI API
   * @param fieldName Name of the field from which the input will be taken to get information from field
   * @return (true) - value Optional.of(“”)
   * @return (false) - inputted value from mi.in.get(...)  
   */
 
  public Optional<String> validateNumericalIntegerType(MIAPI, String getField){
    int numField = Integer.parseInt(getField)
    if (mi.in.get(fieldName).isBlank() || mi.in.get(fieldName).equals("?")){
        return Optional.of("0")
    } else {
        return Optional.of(mi.in.get(fieldName).toString());
    }
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
 
### Exported Extension
- [DataRetrieveUtil.json](../../../assets/attachments/util-dataretriever/UTILITY-DataRetriveUtil.json)
 
### See Also
[Utility Extension](../../../examples/Utility-extension)<br>
[Use cases](../../../examples/use-cases)<br>
[Examples](../../../examples)
 
 
 
 

