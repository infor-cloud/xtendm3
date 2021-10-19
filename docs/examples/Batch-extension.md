---
layout: default
title: Batch Extension
parent: Examples
nav_order: 1
---

# Batch Extension
{: .no_toc }

Working with Batch Extension in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Batch extension uses standard functionality in M3 Business Logic for long running jobs or scheduled jobs triggered from another extension. It is a custom batch program using API for job calls that is running in the back.

## Use cases
* sessions on schedule
* token provider

## Important note
Always test the examples for your own solution before using them in production.

## Step by step implementation

### 1. Open XtendM3 tool

After opening M3 main page, select Menu on the top left corner. Then select XtendM3 from Administration Tools folder.

<img src="../../../assets/attachments/ex004/open_xtendm3.png" width="950" >

### 2. Create new extension button

To create a new extension select "Create a new extension" button.

<img src="../../../assets/attachments/ex004/create_extention_button.png" width="950">

### 3. Extension Type as a Batch extension - executed by a Batch
Opened window displays an option to select the type of extension to be designed. Select “Batch” and then click “Next”.

<img src="../../../assets/attachments/ex-batch/type.png" width="950">

### 4. Create extension name
Input extension name in format "EXT" <nnn> where n is an intiger and extension description. Then select "Create" button.

<img src="../../../assets/attachments/ex-batch/name_batch.png" width="950">

### 5. Skeleton of the extension
Created extension will contain default code template.

<img src="../../../assets/attachments/ex-batch/template.png" width="950">

Over the code field there are several tools with which you can operate on the designed extension.

<img src="../../../assets/attachments/ex-batch/tool.png" width="950">

Listing them from the left side they are used to:

* Enable editing mode
* Export the code
* Extra settings to change the parameters of the extension or enable it etc.
* Delete the extension
* Information about the extension
* Test compile
* Refresh

### 7. Code example of transaction extension and APIs usage
//token provider with scheduled revoke (to do!!)

To finish save written extension by clicking “Save” button. It is not necesary to activate the extension from settings for it to be exectuted.

### 8. Important notes
* It is a good practice to use a test compilation of the program before running.
* Data presented in the examples is random.

### Exported Extension
.json

### See Also
More examples
API documentation


