---
layout: default
title: Method API
parent: API Specification
grand_parent: Documentation
nav_order: 11
---

# Method API
{: .no_toc }

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
public void GetArgumentExample() {
  //Specify type for returned argument, String or Integer
  String argument = method.getArgument(0);
}
```

### getArguments
The method receives an array of all arguments from the extension point of the designed extension.
<br>

Example:
```groovy
public void GetArgumentsExample() {
  //Object is used as type for the array in this example, because the arguments can be mix of String and Integer
  //Always strive towards being as specific as possible with types. If all arguments are of type String, use String array
  Object[] arguments = method.getArguments();
  int i = 1;
  if(arguments == null || arguments.length == 0) {
    logger.info("Array is empty, there are no arguments from an extension point.");
  } else {
    for(Object argumentsElement : arguments) {
      logger.info("Argument no.${i} is ${argumentsElement.toString()}");
      i++;
    }
  }
}
```

### setReturnValue
The method sets the return value inside an overriden method.
<br>

Example:
```groovy
public void SetReturnValueExample() {
  //In that case extension point has boolean type return, etc.
  method.setReturnValue(true);
}
```

### getReturnValue
The method gets the value returned from an overriden method.
<br>

Example:
```groovy
public void GetReturnValueExample() {
  //The extracted value from the method depends on the type of value returned by the extension point.
  String methodReturnValue = method.getReturnValue();  
}
```

### getOriginalReturnValue
Similar to the getReturnValue with the difference, that it will always get the original value returned from an overriden method.
<br>

Example:
```groovy  
public void GetOriginalReturnValueExample() {
  //The extracted value from the method depends on the type of value returned by the extension point.
  String methodReturnValue = method.getOriginalReturnValue();
}
```

## Considerations and Guidelines
Method API is characterised by operations on the extension point on which it is based. It allows to modify and retreive data from the extension method.
