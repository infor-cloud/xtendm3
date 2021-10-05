---
layout: default
title: Utility Extension
parent: Examples
nav_order: 1
---

# Utility Extension
{: .no_toc }

Working with Utility Extension in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Utility Extension is a type of extension where one can create a methodology for optimasation future extensions. Designed utility can be used later without necessity to write the same method multiple times in different extension.
 Utility extension also eliminates the need of implementing external libraries inside the extensions. Once written utility does not neet to be activated as other extensions. 

## Use cases
* Keeping common logic in one place and reusing it in multiple extensions
* Executing form another extensions

## Important note
Always test the examples for your own solution before using them in production.

## Step by step implementation

### 1. Open XtendM3 tool
After opening M3 main paige, select Menu on the top left corner. Then select XtendM3 from Administration Tools folder.

<img src="../../../assets/attachments/ex004/open_xtendm3.png" width="950">
  
### 2. Create new extension button
To create a new extension select "Create a new extension" button.

<img src="../../../assets/attachments/ex004/create_extention_button.png" width="950">

### 3. Extension type as a Utility extension
Opened window displays an option to select the type of extension to be designed. Select "Utility" and then click "Next".

<img src="../../../assets/attachments/ext-util/choose_type.png" width="950">

### 4. Create extension name 
Input extension name.

<img src="../../../assets/attachments/ext-util/name.png" width="950">

### 5. Skeleton of the extension
Created extension will contain default code template.

<img src="../../../assets/attachments/ext-util/template.png" width="950">

Over the code field there are several tools with which you can operate on the designed extension.

<img src="../../../assets/attachments/ext-util/tool_bar_u.png" width="950">

Listing them from the left side they are used to:

* Enable editing mode
* Export the code
* Extra settings to change the parameters of the extension or enable it etc.
* Delete the extension
* Information about the extension’
* Test compile
* Refresh

### 7. Code example of transaction extension and APIs usage
To start writting extension code enable editing by clicking “Edit” button. It is recommended to implement designed for XtendM3 APIs to exploit the full potential of the extension. To read more documentation on [API specification](../../../docs/documentation/api-specification) click on the link.

<img src="../../../assets/attachments/ext-util/code_example.png" width="950">

To finish save written extension by clicking “Save” button. It is not necesary to activate the extension from settings for it to be exectuted.

### 8. Important notes
* It is a good practice to use a test compilation of the program before running.
* Data presented in the examples is random.

### Exported Extension
- [Utility Extantion Example.json](../../../assets/attachments/ext-util/UTILITY-DateFormat.json)

### See Also
[More examples](../../../docs/examples)<br>
[API documentation](../../../docs/documentation)

