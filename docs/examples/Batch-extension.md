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
- Creation of batch extension and its code implementation
- Creation of transaction extension and its code implementation
- Future logging configuration
- Initialization of the transaction extension that has the code implementation to call the batch extension
- Reading the result file
 <br>

<b> Creation of batch extension and its code implementation </b>
<br>
It is the same procedure as presented above. At the point of implementing functionality, the batch extension example will include basic operations using [Logger API](../../../docs/documentation/api-specification/logger-api), just to see inputed result in the log file.
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
<br>

<b> Creation of transaction extension and its code implementation </b>
<br>
To create a transaction extension check the link [here](../../../docs/examples/Transaction-extension). It is very similar to the batch. At the point of implementing functionality there will be some code that is using MICaller API for executing very important extension named SHS010MI with Batch scenario extension point, which is responsible for executing Batch extensions.

```groovy
public class batchTest extends ExtendM3Transaction {
  private final MIAPI mi;
  private final MICallerAPI miCaller;
  private final DatabaseAPI database;
  private final LoggerAPI logger;
  
  public batchTest(MIAPI mi, MICallerAPI miCaller, DatabaseAPI database, LoggerAPI logger) {
    this.mi = mi;
    this.miCaller = miCaller;
    this.database = database;
    this.logger = logger;
  }
  
  public void main() {
    logger.info("Running EXT919MI")  // Extra log line for testing whether everything is working properly
    testSHS010MI()
  }
    /*
     *  SHS010MI is a special extension which has a metohdt for executing Batch extension named SchedXM3Job - without calling it - the Batch extension won't be executed.
     *  It has several mandatory parametres to call the extension point of it:
     *  - TX30 - description for running an extension (ex. which transaction is being executed - here EXT919MI)
     *  - XCAT - job schedule category, depends on the SHS010 category data
     *  - SCTY - job schedule type
     *  - XNOW - the time of executing batch. XNOW refers to immediate execution. There are another similar parameters for execution at spcific day, a consistently recurring day,  *           every month or even chosen date.
     *  - JOB  - name of Batch extension which should be executed
     *  - UUID - UUID number inputed by user
     */
    void testSHS010MI() {
      logger.info("Testing SHS010MI");
      Closure<?> callback = {Map<String, String> result ->
        logger.info("Result is: ${result}");
      }
    def params = ["TX30": "CallingFromEXT919MI", 
      "XCAT": "010".toString(), 
      "SCTY": "1".toString(), 
      "XNOW": "1".toString(), 
      "JOB": "EXT000".toString(), 
      "UUID": "1eedcd6d-5cb2-43ab-a55b-487658c38f88".toString()];
    miCaller.call("SHS010MI", "SchedXM3Job", params, callback); 
    // This method is calling SHS010MI to execute with inputed parameters. More info about MICaller API is available in the doc
  }
}
```
 
To finish, save the written extension by clicking the “Save” button and activate it inside the settings.
<br>

<b> Future logging configuration </b>
<br>
It is very important to execute this procedure <b>after</b> writing and saving the code in transaction extension. 
<br>
Logging configuration is possible to create inside the Business Engine Jobs.
Inside the page there is a table and above it there are two options:
- Kill Job - it is used for stopping Batch in the background
- Logging - it is a drop-down box, which has three elements inside it:
    - view log - to have a small preview of chosen log
    - configure logging - to change some options inside chosen log
    - <b>configure future logging</b> - to create a new log job, which will execute chosen Batch
<br>


<img src="../../../assets/attachments/ex-batch/sc1.PNG" width="950">
<br>
The third option allows user to configurate new logging job, which will be connected to the previously prepared Batch extension.
Inside opened window for "configure future logging" there will be a small pop-up window with some options and a table inside it. The table allows user to 'Add', 'Edit', 'Remove' logging jobs or 'Refresh' them


<img src="../../../assets/attachments/ex-batch/sc2.PNG" width="950">
<br>
To create a new logging job for new Batch extension, just click the 'Add' option. Following window should pop-up:


<img src="../../../assets/attachments/ex-batch/sc3.PNG" width="950">
<br>

<img src="../../../assets/attachments/ex-batch/sc4.PNG" width="950">
<br>
Basic things to input for executing Batch extension are th program name - which should be exact same as previously created Batch extension, and to see the result into log file, it is needed to make a check inside the 'Log to file' box. Another significant field is 'Number of jobs to start with log configuration' where user can choose, how many times it is possible to execute batch wit the logging job result. The number can be chosen from 1 to 5.
<br>

Other options of that window depends on user needs.<br>
The last thing to do is to save the logging job. After that new Batch extension can be executed.


 
### 8. Important notes
* Whenever a user updates the code of an extension through which a batch extension is called, it is necessary to cofigure new log job related to that batch. Otherwise the batch will not be executed.
* Always test the examples for your own solution before using them in production
* It is a good practice to use a test compilation of the program before running
* Data presented in the examples is random
 
### Exported Extension
.json
 
### See Also
[More examples](../../../docs/examples) <br>
[API documentation](../../../docs/documentation/api-specification) <br>
[Batch API](../../../docs/documentation/api-specification/batch-api) <br>

 
 
 
 

