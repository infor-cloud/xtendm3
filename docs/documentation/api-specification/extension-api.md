---
layout: default
title: Extension API
parent: API Specification
grand_parent: Documentation
nav_order: 1
---

# Extension API
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
The Extension API provides information regarding the XtendM3 extension that is currently in use. This can be used to retrieve metadata about the current extension and show to the user or use for logging purposes.

## Features
### getCreator
To retrieve the username of the extension creator. 

Example:
```groovy
public class SampleExtension extends ExtendM3Trigger {
    private final ExtensionAPI extension
    private final InteractiveAPI interactive
    
    public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive){
        this.extension = extension
        this.interactive = interactive
    }
    
    public void main(){
        String extCreator = extension.getCreator()
        interactive.showOkDialog("${extCreator} created this extension.")   
    }
}
```

### getLastModifiedBy
To retrieve the username who last modified the extension.

Example:
```groovy 
public class SampleExtension extends ExtendM3Trigger {
    private final ExtensionAPI extension
    private final InteractiveAPI interactive
    
    public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive){
        this.extension = extension
        this.interactive = interactive
    }
    
    public void main(){
        String extLastModifiedBy = extension.getLastModifiedBy()
        interactive.showOkDialog("${extLastModifiedBy} last modified this extension.")
    }
}
```

### getName
To retrieve the name of the extension currently being used.

Example:
```groovy
public class SampleExtension extends ExtendM3Trigger {
    private final ExtensionAPI extension
    private final InteractiveAPI interactive
    
    public SampleExtension(ExtensionAPI extension, InteractiveAPI interactive){
        this.extension = extension
        this.interactive = interactive
    }
    
    public void main(){
        String extName = extension.getName()
        interactive.showOkDialog("Current Extension name: ${extName}")
    }
}
```


## Considerations and Guidelines
### Creator updated when importing extensions
When an extension is created, the getCreator() method will return the original creator of the extension. However, when the extension is imported to a different tenant/environment, the user who uploaded the extension will now become the new creator.
