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
Batch extension uses standard functionality in M3 Business Logic for long running jobs or scheduled jobs triggered from another extension. It is a custom batch program using API for job calls that is running in the background. It is possible to retrieve UUID data from batch operations using [Batch API](../../../docs/documentation/api-specification/batch-api), which can be also used inside batch extension.
 
## Use cases
* Sessions on schedule
 
## Step by step implementation
 
### 1. Open XtendM3 tool
 
After opening M3 main page, select Menu on the top left corner. Then select XtendM3 from the Administration Tools folder.
 
<img src="../../../assets/attachments/ex004/open_xtendm3.png" width="950" >
 
### 2. Create new extension button
 
To create a new extension select the "Create a new extension" button.
 
<img src="../../../assets/attachments/ex004/create_extention_button.png" width="950">
 
### 3. Extension Type as a Batch extension - executed by a Batch
Opened window displays an option to select the type of extension to be designed. Select “Batch” and then click “Next”.
 
<img src="../../../assets/attachments/ex-batch/type.png" width="950">
 
### 4. Create extension name
Input extension name in format "EXT" <nnn> where n is an integer and extension description. Then select "Create" button.
 
<img src="../../../assets/attachments/ex-batch/name_batch.png" width="950">
 
### 5. Skeleton of the extension
Created extension will contain a default code template.
 
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
In the example to perform batch extension usage there will be a need to use another type of extension - Transaction extension.
<br>
The example can be broken down into five points:
- creation of batch extension and its code implementation
- creation of transaction extension and its code implementation
- creation of the log job file with initiation of the created batch
- initialization of the transaction extension that has the code implementation to call the batch extension
- reading the result file
 
!BOLD creation of batch extension and its code implementation
It is the same procedure as presented above. At the point of implementing functionality, the batch extension example will include basic operations using Logger API (LINK!!!), just to see inputed result in the log file.
<br>
Batch extension example:
```groovy
public class EXT002 extends ExtendM3Batch {
  private final LoggerAPI logger
  private final BatchAPI batch
  
  public EXT002(LoggerAPI logger, BatchAPI batch) {
    this.logger = logger;
    this.batch = batch;
  }
  
  public void main() {  
      logger.info("Testing EXT002 - executing code - This is the first line of the batch extension");
      logger.info("Still testing - This is the second line of the batch extension with Uuid-gen:" + batch.getReferenceId().get());
      logger.info("Line no. 2 uses a Batch API to generate/retireve job UUID number");
  }
}
```
After implementing functionality it needs to be saved. 

!BOLD creation of transaction extension and its code implementation
To create a transaction extension check the link here (LINK!!!). It is very similar to the batch. At the point of implementing functionality there will be som --
```groovy

```
 
To finish, save the written extension by clicking the “Save” button. It is not necessary to activate the extension from settings for it to be executed.
 
### 8. Important notes
* Whenever a user updates the code of an extension through which a batch extension is called, it is necessary to create a new log job related to that batch. Otherwise the batch will not be executed.
* Always test the examples for your own solution before using them in production
* It is a good practice to use a test compilation of the program before running
* Data presented in the examples is random
 
### Exported Extension
.json
 
### See Also
[More examples](../../../docs/examples/examples)
[API documentation](../../../docs/documentation/api-specification/api-specification)
 
 
 
 

