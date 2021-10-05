---
layout: default
title: Transaction Extension Example
parent: Examples
nav_order: 1
---

# Transaction Extension Example
{: .no_toc }

Working with Transaction Extension in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Transaction extension is a type of extension where one could create a custom M3 API (MI) Transaction. These custom transactions will behave identically to standard M3 transactions i.e. they have input/output parameters in the same structure as standard APIs and they can be executed through both ION API and M3 Metadata Publisher.

## Use cases
* Reading input and writing output data 
* Retrieving or changing transaction parameters
* Writing error messages and skipping transactions
* Building and setting data containers 

## Important Note
Always test the examples for your own solution before using them in production.

## Step by step implementation

### 1. Open XtendM3 tool

After opening M3 main paige, select Menu on the top left corner. Then select XtendM3 from Administration Tools folder.

<img src="../../../assets/attachments/ex004/open_xtendm3.png" width="950" >

### 2. Create new extension button

To create a new extension select "Create a new extension" button.

<img src="../../../assets/attachments/ex004/create_extention_button.png" width="950">

### 3. Extension Type as a transaction extension - executed by a transaction

Opened window displays an option to select the type of extension to be designed. Select "Transaction" and then click "Next".

<img src="../../../assets/attachments/ex004/choose_type.png" width="950">

### 4. Complete all inputs and single/ multi option

Fill in extension information as described:<br>
* Program : Name of an existing or new program where the extension will be created;<br>
* Name: Name of the extension;<br>
* Description: Functionality of the extension; <br>
* Multi (option): Multi option allows to create multiple records. Otherwise will create a single record.
Then click "Next".

<img src="../../../assets/attachments/ex004/create_description.png" width="950">

### 5. Add input and/ or output field

At this point you can create fields with input or output data by clicking a plus button and filling in the information:<br>
* Name: 4 uppercase character name of the field;<br>
* Type: text/ number;<br>
* Lenght: maximum input lenght;<br>
* Mandatory (option): choose if the input will be mandatory (only for input fields);<br>
* Description: more detailed description of the field.<br>
Click "Save" to finish. 

<img src="../../../assets/attachments/ex004/add_field_screen.png" width="950">

<img src="../../../assets/attachments/ex004/add_filed_screen2.png" width="950">

### 6. Skeleton of the extension
Created extension will contain default  code template.

<img src="../../../assets/attachments/ex004/sceleton_extention.png" width="950">

Over the code field there are several tools with which you can operate on the designed extension.

<img src="../../../assets/attachments/ex004/tool_bar.png" width="950">

Listing them from the left side they are used to:

* Enable editing mode
* Export the code
* Extra settings to change the parameters of the extension or enable it etc.
* Delete the extension
* Information about the extension'
* Test compile
* Refresh

### 7. Code example of transaction extension and APIs usage
To start writting extension code enable editing by clicking "Edit" button. It is recommended to implement designed for XtendM3 APIs to exploit the full potential of the extension. To read more documentation on [API specification](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification) click on the link. 

Example below shows usage of [MI API](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/mi-api/) and [Program API](https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/program-api/)to display UserID.  

<img src="../../../assets/attachments/ex004/get_data_xtn.png" width="950">

To finish save written extension by clicking "Save" button. It is necesary to activate the extension from settings as shown below for it to be exectuted. 

<img src="../../../assets/attachments/ex004/activation.png" width="950">

### 8. Important notes
* It is a good practice to use a test compilation of the program before running.
* Data presented in the examples is random. 

### Exported Extension
- [Transaction Extantion Example.json](https://infor-cloud.github.io/xtendm3/assets/attachments/ex004/TRANSACTION-EXT042MI-getUser.json)

### See Also
[More examples](https://infor-cloud.github.io/xtendm3/docs/examples)
[API documentation](https://infor-cloud.github.io/xtendm3/docs/documentation)