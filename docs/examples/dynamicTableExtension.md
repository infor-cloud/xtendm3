---
layout: default
title: Dynamic Table Extension
parent: Examples
nav_order: 1
---

# Dynamic Table Extension
{: .no_toc }

Working with Dynamic Table Extension in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
Dynamic Table Extension is a type of extension, that allows user to create a new custom table, which can be used in data operation. User can use it multiple times from all the programs/extensions, not only inside a single created extension. All data can be operated using the [DatabaseAPI](../../../docs/documentation/api-specification/database-api). Dynamic tables bring flexibility when it comes to CRUD operations and data storage.

## Use cases
* Expanding the data functionality
* Flexibility of data usage
* Data operations
* Creating custom data model on top of standard M3
* Storing additional attributes for M3 data in own managed tables


## Step by step implementation
### 1. Create new extension
After opening the main window with the access to the M3, it is needed to enter the Administration Tools section inside the table on the left side of the screen. After that select XtendM3.
<br><br>
<img src="../../../assets/attachments/dynTab/1.PNG" width="950">
<br>  
To create a new extension press the "Create new extension button" as shown on the screen below:
<br><br>
<img src="../../../assets/attachments/dynTab/2.png" width="950">
<br>


### 2. Extension Type as a dynamic table extension
Opened window displays an option to select the type of extension to be designed. Select "Dynamic Table" as described "Custom database table" and then click next.

<br>
<img src="../../../assets/attachments/dynTab/3.PNG" width="950">
<br>

The next window will require to fill in the name of the dynamic table. It starts from EXT letters and it has to have 6 letters in its name. For the purpose of the example it will be named EXT919.

<br>
<img src="../../../assets/attachments/dynTab/4.png" width="950">
<br>  

After putting the name of the dynamic table it it possible to create a table using the "create" button.


### 3. Skeleton of the extension
Skeleton of the Dynamic Table Extension is quite simple. It contains two bookmarks. At the first one there is a fields table, where it is possible to create fields of dynamic table. 

<br><br>
<img src="../../../assets/attachments/dynTab/5.png" width="950">
<br>  

The second page contains two smaller tables - both are connected to each other. The main one is about indexes and the second one is named "keys". User can create a key for every created index, if it is needed. The key cannot exist without an index.

<br><br>
<img src="../../../assets/attachments/dynTab/6.png" width="950">
<br>

Over the field/index/keys tables there are several tools by which it is possible to operate on the dynamic table.

<br><br>
<img src="../../../assets/attachments/dynTab/7.png">
<br> 

Listing them from the left side they are used to:
- enable editing mode
- add new object
- delete the object


### 4. Description of the dynamic table fields

#### Fields
Presented table includes all designed fields inside the dynamic table. Fields can be string or decimals - depends on the design of the dynamic table. For the example purpose there are two fields created: the decimal field named EXAGEE
<br><br>
<img src="../../../assets/attachments/dynTab/8.png" width="950">
<br> 
and the string field named EXNAME
<br><br>
<img src="../../../assets/attachments/dynTab/9.png" width="950">
<br> 
For later development there will be also created another field named EXUSID which will be used for index and key.

#### Indexes
Presented table includes all designed indexes for the dynamic table. Index just needs a name and it can be unique or not - depends on the usage of the field. There will be an index named ID which will be unique - as the name says.
<br><br>
<img src="../../../assets/attachments/dynTab/10.png" width="950">
<br> 

#### Keys
Presented table includes all designed keys for indexes inside the dynamic table. They can be assigned only for indexes - without the they are unavailable.<br>
To create a key user has to choose the index, for which the key is designed. 

<br><br>
<img src="../../../assets/attachments/dynTab/11.png" width="950">
<br> 
In the example a choosen index is ID, for which there will be created a key, which will be accending.
<br><br>
<img src="../../../assets/attachments/dynTab/12.png" width="950">
<br> 

### 5. Description of the main extension options
On the previous screens there were some other options visible, with which it is possible to operate on the whole extension. These were:
- Deploy option - Deploy function makes the table active for all the extensions - it is possible to use it. After deploying, the table cannot be deleted, instead of that, new option is visible. It is a disable, which allows to disble the dynamic table.
- Refresh option - Refreshes the table after deploying. Before deploying the table, it will clean it.
- Delete option - function allows to delete the table which name was inputted.
- Disable option (invisible) - only available after deploying dynamic table. It disables deployed table.
- Modify (table description) option (on the right side)

<br><br>
<img src="../../../assets/attachments/dynTab/13.png" width="950">
<br> 

## Example of dynamic table extension
Dynamic table extension gives the opportunity to enhance the efficinency of the data operations, by improved custom created tables and additional data operations. They can be use in many different cases depends on the data's usage needs.
* It can be created in every moment of designing the extension, even after the extension is completed and there are some data modifications needed. 
* Icreased flexibility for program data. 
* Dynamic tables can cooperate with multiple extensions.

## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples are random.
- Always test the examples for your own solution before using them in production.

## See Also
[Another examples with documentation](../../../docs/examples) (click)
