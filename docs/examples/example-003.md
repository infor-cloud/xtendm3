---
layout: default
title: Number Utility
parent: Examples
nav_order: 1
---

# Trigger Extension Example
{: .no_toc }

Working with numbers in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Numbers are used everywhere in M3. They can be in different formats and different data types. Different operations such 
as conversion between different data types, validation, checking number of digits or decimals, rounding and etc. are usually
done on numbers. Since these are common operations across all solutions it is recommended to have a utility for the most 
common operations. In this example we take a closer look at such utility.

## Benefit
Having a utility helps keep the logic in one place and increase maintainability of the code. It also makes it possible to reuse
between projects and solutions and if there are any issues found, there is only one source that needs to be corrected.

## Use cases
* Validating numbers in String format
* Getting number of digits
* Getting number of decimals
* Conversion between number string to Integer and double

## Important Note
Always test the examples for your own solution before using them in production.

## Materials
### Step by step implementation
### Extension Code
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
