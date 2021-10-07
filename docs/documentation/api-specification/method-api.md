---
layout: default
title: Method API
parent: API Specification
grand_parent: Documentation
nav_order: 11
---

# Method API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Since**: `0.5.0`  
**Context**: Batch  
**Category**: Context Specific  
---
## Description
The Method API is responsible for obtaining and modifying information on the extension point in the designed extension. It is needed to know the whole structure and functionality of the implemented method at the extension point in order to exploit the full potential of the Method API. 

## Features

### getArgument
The method receives the value of an argument at the specific index from the extension point of the designed extension. It is important to know the structure of the designed method to take the specific arguments.
<br>
Example:

```groovy
public class GetArgumentExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public GetArgumentExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
    Object argument = method.getArgument(0)
  }
}
```

### getArguments
The method receives an array of all arguments from the extension point of the designed extension.
<br>
Example:

```groovy
public class GetArgumentsExample extends ExtendM3Trigger {
  private final MethodAPI method;
  private final LoggerAPI logger;
  
  public GetArgumentsExample(MethodAPI method, LoggerAPI logger) {
    this.method=method;
    this.logger=logger;
  }
  
  public void main() {
    Object[] array=method.getArguments();
    int i = 1;
    if(array==null || array.length == 0) {
      logger.info("Array is empty, there are no arguments from an extension point.")
    } else {
      for(Object arrayElement : array) {
        logger.info("Argument no.${i} is ${arrayElement.toString()}")
        i++;
      }
    }
  }
}
```

### setReturnValue
The method sets the return value inside an overriden method.
<br>
Example:

```groovy
public class SetReturnValueExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public SetReturnValueExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
     method.setReturnValue(true); //In that case extension point has boolean type return, etc.
  }
}
```


### getReturnValue
The method gets the value returned from an overriden method.
<br>
Example:

```groovy
public class GetReturnValueExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public GetReturnValueExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
     var methodReturnValue = method.getReturnValue(); //The extracted value from the method depends on the type of value returned by the extension point. 
  }
}
```
### getOriginalReturnValue
Similar to the getReturnValue with the difference, that it will always get the original value returned from an overriden method.
<br>
Example:

```groovy
public class GetOriginalReturnValueExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public GetOriginalReturnValueExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
     var methodReturnValue = method.getOriginalReturnValue(); //The extracted value from the method depends on the type of value returned by the extension point. 
  }
}
```

## Considerations and Guidelines
Method API is characterised by operations on the extension point on which it is based. It allows to modify and retreive data from the extension method.
