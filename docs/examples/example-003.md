---
layout: default
title: Trigger Extension Example
parent: Examples
nav_order: 1
---

# Trigger Extension Example
{: .no_toc }

Working with Trigger Extension in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Trigger Extension is a simple type of extension, that consists in the execution of certain procedures in the designed extension, at the designated moment of program operation. It needs an extension point, at which it will be executed and triggerred by M3. It is used to modify orextend M3 Business Logic. Trigger extension can use a lot of useful API, which have various uses depending on the user's needs.


## Use cases
* Expanding the programme's functionality
* Modifications to the operations at a given extension point
* Allows implementation of functionality without changing the M3 itself at the source code


## Important Note
Always test the examples for your own solution before using them in production.

## Step by step implementation
### 1. Create new extension button
After opening the main window with the access to M3, it is needed to enter the Administration Tools section inside the table on the left side of the screen. After that select XtendM3.
//SCREEN1
To create new extension it is needed to use the "Create new extension button" as shown on the screen below:
//SCREEN2
### 2. Extension Type as a trigger extension - executed by a trigger
Opened window displays an option to select the type of extension to be designed. Select "Trigger" as described "Executed by a trigger" and then click next.
//SCREEN3
### 3. Complete all inputs + description of them
The next window will require to fill in some data:
- Name of the extension
- Program name where to implement designed extension
After clicking "Next" button, another options will be displayed
- Method of the executed extension point
- Advice for the extension method
SCREEN4
Depending on the selected programe, all sorts of methods can be available in the place for the selected method from modifying access to programmes data to interactively designed messages depending on the event at the extension point
The example presents udage of interactive pop up window extension inside the program. It is needed to choose the PEINZ from the method panel. MEthod PEINZ means initialization of designed event at the E panel:
- P as the panel word 
- E as the name of the Panel
- INZ as the initialization 
There are also several methods similar to PEINZ like PEUPD or PECHK. All vary according to the type of method and the panel on which the extension point occurs. All available methods depend on the selected programme.
The last box describes usage of selected method. It asks if the extension point should be before "PRE" or after "POST" selected method.
SCREEN5
After inputting all necessary data click create button
New extension is created. Now it is time to implement the functionality of the new extension.

### 4. Skeleton of the extension
The skeleton of the basic extension is empty. It is only made extended by the ExtendM3Trigger.
SCREEN6

### 5. Example of trigger extension and usage of APIs
It is needed to implement designed for XtendM3 APIs to exploit the full potential of the extension. Several APIs are described in the documentation at the [link](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification) 
In the first example the [ProgramAPI](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/program-api/) and the [InteractiveAPI](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/interactive-api/) are used to create a pop up message about the user and date of the day.
To implement these APIs it is needed just to include them as new objects inside the constructor of our extension as at below screen:
SCREEN7

### 6. Funcionality nd description of designed extension

### 7. Important notes

## Extension Code
Here's an overview of the utility, the exported file can be downloaded and imported in your own environments.

```groovy
public class NumberUtil extends ExtendM3Utility {

  /**
   * Check if number is valid
   * @param number Number
   * @param decimalSeparator Decimal separator
   * @return {@code true} if number is a valid number
   */
  public boolean isValidNumber(String number, String decimalSeparator) {
    if (toDouble(number, decimalSeparator).isPresent()) {
      return true
    }
    return false
  }

  /**
   * Convert number to double
   * @param number Number
   * @param decimalSeparator Decimal separator
   * @return Optional double if number is valid, empty optional otherwise
   */
  public Optional<Double> toDouble(String number, String decimalSeparator) {
    try {
      return Optional.of(Double.valueOf(formatToStandardSeparator(number, decimalSeparator)))
    } catch (NumberFormatException e) {
      return Optional.empty()
    }
  }

  /**
   * Convert number to integer
   * @param number Number
   * @param decimalSeparator Decimal separator
   * @return Optional integer if number is valid, empty optional otherwise
   */
  public Optional<Integer> toInteger(String number, String decimalSeparator) {
    Optional<Double> d = toDouble(number, decimalSeparator)
    if (d.isPresent()) {
      return Optional.of(d.get().toInteger())
    }
    return Optional.empty();
  }

  /**
   * Format number to use standard decimal separator (.)
   * @param number Number
   * @param decimalSeparator Custom decimal separator
   * @return Number using standard decimal separator
   */
  public String formatToStandardSeparator(String number, String decimalSeparator) {
    if (decimalSeparator == null || decimalSeparator.trim().isBlank()) {
      decimalSeparator = "."
    }
    decimalSeparator = decimalSeparator.trim()
    return number.replace(decimalSeparator, ".")
  }

  /**
   * Get number of digits in a number
   * @param number Number
   * @return Number of digits
   */
  public Integer getNumberOfDigits(Number number) {
    BigDecimal bd = new BigDecimal(number.toString())
    return bd.signum() == 0 ? 1 : bd.precision() - bd.scale()
  }

  /**
   * Get number of digits in number string
   * @param number Number
   * @param decimalSeparator Decimal separator
   * @return Number of digits if given number is valid, null otherwise
   */
  public Integer getNumberOfDigits(String number, String decimalSeparator) {
    Optional<Double> d = toDouble(number, decimalSeparator)
    if (d.isPresent()) {
      return getNumberOfDigits(d.get())
    }
    return null
  }

  /**
   * Get number of decimals in a number
   * @param number Number
   * @return Number of decimals
   */
  public Integer getNumberOfDecimals(Number number) {
    BigDecimal bd = new BigDecimal(number.toString())
    return bd.scale()
  }

  /**
   * Get number of decimals in number string
   * @param number Number
   * @param decimalSeparator Decimal separator
   * @return Number of decimals if given number is valid, null otherwise
   */
  public Integer getNumberOfDecimals(String number, String decimalSeparator) {
    Optional<Double> d = toDouble(number, decimalSeparator)
    if (d.isPresent()) {
      return getNumberOfDecimals(d.get())
    }
    return null
  }
}
```

### Exported Extension
- [NumberUtil.json](https://infor-cloud.github.io/xtendm3/assets/attachments/ex001/DateUtil.json)

### See Also
N/A
