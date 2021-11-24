---
layout: default
title: Message API Template
parent: Trigger-Ex.-Templates
grand_parent: Examples
nav_order: 1
---
 
# Message API Template
{: .no_toc }

 
## Table of contents
{: .no_toc .text-delta }
 
1. TOC
{:toc}
 
---
 
## Description
This is a template that was designed to quickly implement the [MessageAPI]() (more information about Message API and other APIs at the [link]()). To fully implement this solution it is needed to chose a proper message for Message API that should be visible for user after executing extension point. Message ID should be inputted manually. The message will be displayed using [Interactive API](). The visible window can also be modified according to the user needs and capabilities of the Interactive API.

## Code template
```groovy
public class MessAPI_Template extends ExtendM3Trigger {
  private final InteractiveAPI interactive;
  private final MessageAPI message;
  
  public MessAPI_Template(InteractiveAPI interactive, MessageAPI message) {
    this.interactive = interactive;
    this.message = message
  }
  
  public void main() {
    interactive.showOkDialog(message.getMessage(
    "<system component>",               // ex. MVX
    "<language of the code>",           // ex. GB
    "<message ID>",                     // ex. CR_0091
    ["<parameter>","<parameter>","..."] // ex. ["WRX","XTC","STB","KWS"]
    ));
  }
}
```
 
## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples is random.
- Remember to check the name of created extension while using ready templates/examples
 
 
## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)

