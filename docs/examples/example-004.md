---
layout: default
title: Transaction Extention Example
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
Transaction Extentions are used for accessing directly either input or output transaction data.


## Use cases
* Reading input and writing output data 
* Retrieving or changing transaction parameters
* Writing error messages and skipping transactions
* Conversion between number string to Integer and double

## Important Note
Always test the examples for your own solution before using them in production.

## Step by step implementation

### 1. Open XtendM3 tool

After opening M3 main paige, select Menu on the top left corner. Then select XtendM3 from Administration Tools folder.
<img src="/assets/attachments/ex004/open_xtendm3.png" width="950" >

### 2. Create new extension button

To create a new extention select "Create a new extention" button.
<img src="/assets/attachments/ex004/create_extention_button.png" width="950">

### 3. Extension Type as a transaction extension - executed by a transaction

Opened window displays an option to select the type of extension to be designed. Select "Transaction" and then click next.

<img src="/assets/attachments/ex004/choose_type.png" width="950">

### 4. Complete all inputs and single/ multi option

Fill in extention information as described:<br>
Program : Name of an existing or new program where the extention will be created;<br>
Name: Name of the extention;<br>
Description: Functionality of the extention; <br>
Multi (option): Multi option allows to create multiple records. Otherwise will create a single record.<br>
Then click "Next"

<img src="/assets/attachments/ex004/create_description.png" width="950">

### 5. Add input and/ or output field

At this point you can create fields with input or output data by clicking a plus button and filling in the information:<br>
Name: 4 uppercase character name of the field;<br>
Type: text/ number;<br>
Lenght: maximum input lenght;<br>
Mandatory (option): choose if the input will be mandatory (only for input fields);<br>
Description: more detailed description of the field.<br>
Click "Save" to finish 

<img src="/assets/attachments/ex004/add_field_screen.png" width="950">

<img src="/assets/attachments/ex004/add_filed_screen2.png" width="950">

### 6. Skeleton of the extension
Created extention will contain default  code template.

<img src="/assets/attachments/ex004/sceleton_extention.png" width="950">

Over the code field there are several tools with which you can operate on the designed extension.
<img src="/assets/attachments/ex004/tool_bar.png" width="950">

Listing them from the left side they are used to:

* Enable editing mode
* Export the code
* Extra settings to change the parameters of the extension or enable it etc.
* Delete the extension
* Information about the extension'
* Test compile
* Refresh

### 7. Code example of transaction extension and APIs usage
To start writting extention code enable editing by clicking "Edit" button. It is recommended to implement designed for XtendM3 APIs to exploit the full potential of the extension. To read more documentation on <p><a href="https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification" style ="display : inline">API specification</a></p> click on the link. 

Example below shows usage of<p><a href="https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/mi-api/" style="text-decoration-line: none;">MI API</a></p>and<p><a href="https://infor-cloud.github.io/xtendm3/docs/documentation/api-specification/program-api/" style ="display : inline">Program API</a></p>to display UserID.  

Example 1:
```groovy
public class GetData extends ExtendM3Transaction {
  private final MIAPI mi;
  private final ProgramAPI program;
  
  public GetData(MIAPI mi, ProgramAPI program) {
    this.mi = mi;
    this.program = program;
  }
  
  public void main() {
    mi.outData.put("USID",program.GetData());
  }
}
```
To finish save written extention by clicking "Save" button. It is necesary to activate the extention from settings as shown below for it to be exectuted. 

<img src="/assets/attachments/ex004/activation.png" width="950">

### 8. Important notes
* It is a good practice to use a test compilation of the program just to check if everything is working properly.
* The convergence of the presented data is entirely coincidental.

### Exported Extension
- [Transaction Extantion Example.json](https://infor-cloud.github.io/xtendm3/assets/attachments/ex004/TRANSACTION-EXT042MI-getUser.json)

### See Also
N/A