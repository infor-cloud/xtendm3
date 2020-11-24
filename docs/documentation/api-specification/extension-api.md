---
layout: default
title: Extension API
parent: API Specification
grand_parent: Documentation
nav_order: 1
---

# Extension API
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
The Extension API provides information regarding the XtendM3 extension that is currently in use. This can be used as a validation in the development of the extension code as there can be other concurrent XtendM3 extensions activated.

## Features
### Get creator
To retrieve the username of the extension creator. 

Example:
```groovy
final ExtensionAPI extension
final InteractiveAPI interactive

String extCreator = extension.getCreator()
interactive.showOkDialog("${extCreator} created this extension.")
```

### Get LastModifiedBy
To retrieve the username who last modified the extension.

Example:
```groovy 
final ExtensionAPI extension
final InteractiveAPI interactive

String extLastModifiedBy = extension.getLastModifiedBy()
interactive.showOkDialog("${extLastModifiedBy} last modified this extension.")
```

### Get Name
To retrieve the name of the extension currently being used.

Example:
```groovy
final ExtensionAPI extension
final InteractiveAPI interactive

String extName = extension.getName()
interactive.showOkDialog("Current Extension name: ${extName}")
```


## Considerations and Guidelines
### Creator updated when importing extensions
When an extension is created, the getCreator() method will return the original creator of the extension. However, when the extension is imported to a different tenant/environment, the user who uploaded the extension will now become the new creator.