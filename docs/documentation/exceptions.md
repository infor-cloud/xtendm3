---
layout: default
title: Exceptions
parent: Documentation
nav_order: 3
---

# Exceptions
{: .no_toc }

How to work with exceptions in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Exception capabilities
Currently in XtendM3, it's possible to catch a handful of exceptions, but no exceptions can be thrown.<br/>
The following exceptions can be caught in XtendM3 code:<br/>

**Runtime exceptions**
- *NumberFormatException*
- *DateTimeException*

**Compile time check**
- *FileUtilException*
- *Specific Java exceptions*
  - E.g., java.IOException
  - Essentially, any exception within a package beggining with *.java* can be caught

## Example code
Example code for catching exceptions.<br/>

*NumberFormatException*
```groovy 
String aString = null;
Integer anInteger = "10";
try {
  anInteger = aString.toInteger(); 
} catch(NumberFormatException e) {
  logger.debug("Execution failed with exception: ${e}");
}
```

*DateTimeException*
```groovy
String aString = null;
try {
  aString = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd")); 
} catch(DateTimeException e) {
  logger.debug("Execution failed with exception: ${e}");
}
```

*FileUtilException*
```groovy
String fileSize = null;
try {
  fileSize = textFiles.size("fileName"); 
} catch(FileUtilsException e) {
  logger.debug("Execution failed with exception: ${e}");
}
```