---
layout: default
title: TextFiles API
parent: API Specification
grand_parent: Documentation
nav_order: 9
---

# TextFiles API
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

**Since**: `0.11.0`  
**Context**: Any  
**Category**: Storage  
---
## Description
TextFiles API is used to perform various file processing operations.

## Features
### Open
This method allows to open a subDirectory for the extension. This can be used when trying to access a file located in another location.
<br>
Example:

```groovy
```

### Read
This method is responsible for reading data from the selected file and applying it via the corresponding command using the bufferedReader in the extension.
<br>
Example:

```groovy
```

### Write
This method allows data to be written inside the selected file.
<br>
Example:

```groovy
```

### Delete
This method deletes the selected file.
<br>
Example:

```groovy
public class deleteExample extends ExtendM3Trigger {
  private final TextFilesAPI textFiles;
  
  public deleteExample(TextFilesAPI textFiles) {
    this.textFiles=textFiles;
  }
  public void main() {
      textFiles.delete("test.txt");
    }
  }
}
```

### Size
The method allows to obtain information about the size of the selected file. The size is displayed as a number of the long type and the units are ...
<br>
Example:

```groovy
public class sizeExample extends ExtendM3Trigger {
  private final InteractiveAPI interactive;
  private final TextFilesAPI textFiles;
  
  public sizeExample(InteractiveAPI interactive, TextFilesAPI textFiles) {
    this.interactive=interactive;
    this.textFiles=textFiles;
  }
  public void main() {
    String fileName="test.txt";
      interactive.showOkDialog("Selected file has size of "+textFiles.size(fileName).toString()+"units...")
    }
}
```
### Exist
The method checks wheter the file is available in the extension file location. A boolean true/false value is returned depending on whether the file is available.
<br>
Example:

```groovy
public class existExample extends ExtendM3Trigger {
  private final InteractiveAPI interactive;
  private final TextFilesAPI textFiles;
  
  public existExample(InteractiveAPI interactive, TextFilesAPI textFiles) {
    this.interactive=interactive;
    this.textFiles=textFiles;
  }
  public void main() {
    if(textFiles.exists("test.txt")){
      interactive.showOkDialog("Hello! The file test.txt does exist!");
    } else {
      interactive.showWarningDialog("Hello! The file test.txt does not exist!");
    }
  }
}
```

### listFiles
The method lists all files at the extension directory.


### listFolders
The method lists all folders at the extension directory.


## Considerations and Guidelines
