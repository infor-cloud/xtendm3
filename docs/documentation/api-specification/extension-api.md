---
layout: default
title: Extension API
parent: API Specification
grand_parent: Documentation
nav_order: 4
---

# Extension API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.1` <br>
**Context**: Any <br>
**Category**: Generic  
---

## Description
The Extension API provides information regarding the extension that is currently in use. This can be used to retrieve metadata about the current extension to show the user, or use for logging purposes.

## Features
### getCreator()
Retrieve the username of who created the current extension. 

**Returns:**
* String - username of the extension creator

**Example:**
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final ExtensionAPI extension;
  private final InteractiveAPI interactive;
    
  public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive) {
    this.extension = extension;
    this.interactive = interactive;
  }
    
  public void main() {
    String extCreator = extension.getCreator();
    interactive.showOkDialog("${extCreator} created this extension.")   

    ...
  }
}
```

### getLastModifiedBy()
Retrieve the username of who last the modified the current extension.

**Returns:**
* String - username of the last user that updated the current extension 

**Example:**
```groovy 
public class SampleExtension extends ExtendM3Trigger {
  private final ExtensionAPI extension;
  private final InteractiveAPI interactive;
    
  public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive) {
    this.extension = extension;
    this.interactive = interactive;
  }
    
  public void main() {
    String extLastModifiedBy = extension.getLastModifiedBy();
    interactive.showOkDialog("${extLastModifiedBy} last modified this extension.");

    ...
  }
}
```

### getName()
Retrieve the name of the current extension.

**Returns:**
* String - name of the current extension

**Example:**
```groovy
public class SampleExtension extends ExtendM3Trigger {
  private final ExtensionAPI extension
  private final InteractiveAPI interactive
    
  public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive) {
    this.extension = extension
    this.interactive = interactive
  }
    
  public void main() {
    String extName = extension.getName()
    interactive.showOkDialog("Current Extension name: ${extName}")

    ...
  }
}
```

## Considerations and Guidelines
### Creator updated when importing extensions
When an extension is created, the getCreator() method will return the original creator of the extension. However, when the extension is imported to a different tenant/environment, the user who imported the extension will become the new creator.
