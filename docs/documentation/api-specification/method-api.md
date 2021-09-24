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
The Method API is responsible for obtaining and modifying information on the main method used in the designed extension. It is needed to know the whole structure and functionality of the main method implemented to the extension in order to exploit the full potential of the Method API. 

## Features

### getArgument
The method receives the value of an argument at the specific index from the main method of the designed extension. It is important to know the structure of the designed method to take the specific arguments.
<br>
Example:

```groovy
public class getArgumentExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public getArgumentExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
    String stringArgument = method.getArgument(0)
  }
}
```

### getArguments
The method receives an array of all arguments from the main method of the designed extension.
<br>
Example:

```groovy
public class getArgumentsExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public getArgumentsExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
    String[] arrayRefVar = method.getArguments();
  }
}
```

### setReturnValue
The method sets the return value inside an overriden method. It depends of the value type inside the method.
<br>
Example:

```groovy
public class setReturnValueExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public setReturnValueExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
     method.setReturnValue(true); //In that case main method of the extension has boolean type return, etc.
  }
}
```


### getReturnValue
The method gets the value returned from an overriden method.
<br>
Example:

```groovy
public class getReturnValueExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public getReturnValueExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
     var methodReturnValue = method.getReturnValue(); //The extracted value from the method depends on the type of value returned by the main extension method. 
  }
}
```
### getOriginalReturnValue
Similar to the getReturnValuewith the difference, that it will always get the original value returned from an overriden method.
<br>
Example:

```groovy
public class getOriginalReturnValueExample extends ExtendM3Trigger {
  private final MethodAPI method;
  
  public getOriginalReturnValueExample(MethodAPI method) {
    this.method=method;
  }
  
  public void main() {
     var methodReturnValue = method.getOriginalReturnValue(); //The extracted value from the method depends on the type of value returned by the main extension method. 
  }
}
```

## Considerations and Guidelines
Method API is characterised by operations on the main method of the extension on which it is based. It allows to modify and retreive data from the extension method.
