---
layout: default
title: Message API
parent: API Specification
grand_parent: Documentation
nav_order: 3
---

# Message API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.1.0`  
**Context**: Any  
**Category**: Generic  
---

## Description
This API provides capabilities for receiving information about an error from running program. User using MessageAPI can retrieve an Error message by using built in method called getMessage. It allows to combine the error message with another components (ex. [Interactive API](../../../documentation/api-specification/interactive-api) with pop-up window etc.) inside the extension. The result of the Message API is an information extracted from the message file, which is displayed on the screen using other API elements in the extension.


## Features

### getMessage
It retrieves an error message from the error files into the component of the running program. There are two ways to use the getMessage method:
<br>

#### getMessage with 4 param. construction (In development)
- System component (not working or wrong information provided)
- Language code (for example GB) (not working or wrong information provided)
- Message Id from the message files
- List with parameters (max. 4 inside list) to insert into a message - (For now these param. are not changing anything inside the receiving error message)
<br><br>

#### getMessage with 2 param. construction (Active in usage)
- Message Id from the message files
- List with parameters (max. 4 inside list) to insert into a message - (For now these param. are not changing anything inside the receiving error message)
<br>

Example of simple MessageAPI usage with getMessage method:

```groovy
public class MessageAPI_TEST extends ExtendM3Trigger {
  private final MessageAPI message;
  private final InteractiveAPI interactive;

  public MessageAPI_TEST(MessageAPI message, InteractiveAPI interactive) {
    this.message = message;
    this.interactive = interactive;
  }
  
  public void main() {
    interactive.showOkDialog(message.getMessage("XC00001",[""]));  //getMessage returns String type value, so it is visible inside a pop-up window
  }
}
```
<br>
Provided error message is presented below:
<img src="../../../../assets/attachments/message-api/pop-up.PNG">

## Considerations and Guidelines
Method API is a tool to retrieve an error message from message files and inject it into some program components. It can be used with the [Interactive API](../../../documentation/api-specification/interactive-api) or [Logger API](../../../documentation/api-specification/logger-api), to perform message visibility while running a program. Message API is still in development and most of its functionality is currently unavailable.
