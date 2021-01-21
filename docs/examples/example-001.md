---
layout: default
title: Date Utility
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
There are many cases where date and time are used inside M3. It can be an input field in the APIs or certain columns in 
database tables or used for calculation of invoice times.

Since the usage of dates are very common, it is recommended to create a utility in XtendM3 to store most common date methods 
and call it from the extensions. The example here is a such utility which is quite simple but useful in most cases. This can
be extended with other useful methods that are handy in extensions.  

## Benefit
Having a utility helps keep the logic in one place and increase maintainability of the code. It also makes it possible to reuse
between projects and solutions and if there are any issues found, there is only one source that needs to be corrected.

## Use cases
* Getting current date in different formats
* Getting current time in different formats
* Calculating difference between two dates
* Validating date

## Materials
### Extension Code
Here's an overview of the utility, the exported file can be downloaded and imported in your own environments.

```groovy
import java.time.Instant
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import java.time.temporal.ChronoUnit

public class DateUtil extends ExtendM3Utility {

  /**
   * Get date in yyyyMMdd format
   * @return date
   */
  public String currentDateY8AsString() {
    return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"))
  }

  /**
   * Get date in yyyyMMdd format
   * @return date
   */
  public int currentDateY8AsInt() {
    return currentDateY8AsString().toInteger()
  }

  /**
   * Get date in yyMMdd format
   * @return date
   */
  public String currentDateY6AsString() {
    return LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
  }

  /**
   * Get date in yyMMdd format
   * @return date
   */
  public int currentDateY6AsInt() {
    return Integer.valueOf(currentDateY6AsString());
  }

  /**
   * Get time in HHmmSS format
   * @return time
   */
  public String currentTimeAsString() {
    return LocalDateTime.now().format(DateTimeFormatter.ofPattern("HHmmss"));
  }

  /**
   * Get time in HHmmSS format
   * @return time
   */
  public int currentTimeAsInt() {
    return Integer.valueOf(currentTimeAsString());
  }

  /**
   * Get time as epoch milliseconds
   * @return epoch milliseconds
   */
  public long currentEpochMilliseconds() {
    return Instant.now().toEpochMilli();
  }

  /**
   * Get time as epoch milliseconds
   * @return epoch seconds
   */
  public long currentEpochSeconds() {
    return Instant.now().getEpochSecond();
  }

  /**
   * Get difference between two dates e.g. difference of days/months/years between two dates
   * @param d1 First date
   * @param d1Format First date format
   * @param d2 Second date
   * @param d2Format Second date format
   * @param unit Chronological unit to calculate the diff in between
   * @return Difference between two given dates
   */
  public long dateDiff(String d1, String d1Format, String d2, String d2Format, ChronoUnit unit) {
    LocalDate date1 = LocalDate.parse(d1, DateTimeFormatter.ofPattern(d1Format))
    LocalDate date2 = LocalDate.parse(d2, DateTimeFormatter.ofPattern(d2Format))
    return unit.between(date1, date2)
  }

  /**
   * Check if date is valid
   * @param date Date to check
   * @param format Format of the date
   * @return {@code true} if date is valid
   */
  public boolean isDateValid(String date, String format) {
    try {
      LocalDate.parse(date, DateTimeFormatter.ofPattern(format))
      return true
    } catch (DateTimeParseException e) {
      return false
    }
  }
}
```

### Exported Extension
- <a href="https://infor-cloud.github.io/xtendm3/assets/attachments/ex001/DateUtil.json">DateUtil.json</a>

### See Also
N/A
