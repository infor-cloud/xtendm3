---
layout: default
title: Data Retriever Utility
parent: Examples
nav_order: 1
---
 
# Data Retriever Utility
{: .no_toc }
 
Working with transaction data in XtendM3
{: .fs-6 .fw-300 }
 
## Table of contents
{: .no_toc .text-delta }
 
1. TOC
{:toc}
 
---
 
## Description
When using Transaction extensions there are many times when inputted data must be validated. The utility is a tool that can be reused by developers in every extension. Data Retrieve Utility checks inputted data in transaction fields and returns correct results. 
 
## Benefit
Having a utility helps keep the logic in one place and increase maintainability of the code. It also makes it possible to reuse between projects and solutions and if there are any issues found, there is only one source that needs to be corrected.
 
 
## Use cases
* retrieving data from database
* data validation
* additional functionality for extensions
* managing responses to field values for all types
 
## Important Note
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
 
 
## Materials
### Extension Code
```groovy
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.time.format.DateTimeFormatterBuilder
import java.util.Optional
 
public class DataRetriveUtil extends ExtendM3Utility {
  
    /*private Optional<Boolean> getField(MIAPI mi, String fieldName) {
        if(mi.in(fieldName).isPresent()) {
            return Optional.valueOf(true);
        } else {
          return Optional.valueOf(false);
        }
    }*/
    
      /**
   * To retrive and validate inputed data
   * @param mi Instance of MI API
   * @param fieldName Name of the field from which the input will be taken to validation
   * @param type Type of inputed value
   * @param defaultValue Value which should be returned in case of wrong data input***
   * @return date value in a proper format
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
    
 
    public Optional<String> validateStringType(MIAPI mi, String fieldName){
      if (mi.inData(fieldName).isBlank() || mi.inData(fieldName).equals("?")){
          return Optional.of("")
      } else {
          return Optional.of(mi.in.get(fieldName));
      }
    }
 
    public Optional<String> validateNumericalDoubleType(MIAPI, String fieldName){
      if (mi.in.get(fieldName).isBlank() || mi.in.get(fieldName).equals("?")){
          return Optional.of("0.0");
      } else {
          return Optional.of(mi.in.get(fieldName).toString());
      }
    }
    
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
 
 
### See Also
 

