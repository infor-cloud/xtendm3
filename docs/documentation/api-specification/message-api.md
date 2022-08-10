---
layout: default
title: Message API
parent: API Specification
grand_parent: Documentation
nav_order: 3
---

# Message API
{: .no_toc }

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
Message API is a tool used in a [Trigger type extensions](../../../examples/example-003) and [Transaction type extensions](../../../examples/Transaction-extension). This API provides capabilities for receiving information about an error from running program. User using MessageAPI can retrieve an error message by using built in method called getMessage. It allows to combine the error message with another components (ex. [Interactive API](../../../documentation/api-specification/interactive-api) with pop-up window etc.) inside the extension. The result of the Message API is an information extracted from the message file, which is displayed on the screen using other API elements in the extension.


## Features

### getMessage
It retrieves an error message from the error files into the component of the running program. There are two ways to use the getMessage method:
<br><br>

#### getMessage(String sysComp, String language, String messageId, List<String> parameters)
- String sysComp - System component for the specific market (M) - ex. for Poland is MPL (M-PL)
- String language - Language code (language of specific message, for example GB. It works depends on the programmed messages)
- String messageId - Message Id from the message files
- List<String> parameters - List with parameters (max. 4 inside list) to insert into a message 
<br>

```groovy
public class MessageAPI_TEST extends ExtendM3Trigger {
  private final MessageAPI message;
  private final InteractiveAPI interactive;

  public MessageAPI_TEST(MessageAPI message, InteractiveAPI interactive) {
    this.message = message;
    this.interactive = interactive;
  }
  
  public void main() {
    //getMessage returns String type value, so it is visible inside a pop-up (showOkDialog) window
    interactive.showOkDialog(message.getMessage("MVX","GB","CR_0091",["WRX","XTC","STB","KWS"])); 
  }
}
```
Provided error message is presented below:
<img src="../../../../assets/attachments/message-api/pop-up_4param.PNG" width="500">
<br><br>

#### getMessage(String messageId, List<String> parameters)
- String messageId - Message Id from the message files
- List<String> parameters - List with parameters (max. 4 inside list) to insert into a message
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
    interactive.showOkDialog(message.getMessage("XC00001",[]));  // when the message files don't use parameters it is necessary to leve an empty list inside getMessage
  }
}
```
Provided error message is presented below:
<img src="../../../../assets/attachments/message-api/pop-up.PNG" width="500">
<br><br>

<b>List<String> parameters usage

Parameters applied inside getMessage constructor are used in messages which have specifically allocated spaces (&1, &2 etc.) for the use of parameters. To insert less inputs inside message, use empty Strings.

```groovy
  // code sample from the getMessage(String sysComp, String language, String messageId, List<String> parameters) example:
  interactive.showOkDialog(message.getMessage("MVX","GB","CR_0091",["WRX","XTC"]));
```
Provided error message with 2 empty parameters is presented below:
<img src="../../../../assets/attachments/message-api/pop-up_2clear-param.PNG" width="500">
<br><br>

## Considerations and Guidelines
Method API is a tool to retrieve an error message from message files and inject it into some program components. It can be used with the [Interactive API](../../../documentation/api-specification/interactive-api), to perform message visibility while running a program.
