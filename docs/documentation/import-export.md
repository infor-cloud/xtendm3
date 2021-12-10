---
layout: default
title: Import and Export of Extensions
parent: Documentation
nav_order: 2
---

# Import and Export of Extensions
{: .no_toc }


XtendM3 Import and Export of Extensions
{: .fs-6 .fw-300 }
**️STILL IN DEVELOPMENT**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
It is possible to import and export extensions to XtendM3 environment. 

## Import
Diffrent types of extensions are being saved in JSON files (typical JSON files or signed JSON files, which are a little bit modified while exporting extension). Importing an extension is possible by using an import button above the code sheet. After clicking that button a proper woindow will open and then user needs to choose an extension which should be imported.

<Structure of importing>
Import feature has improvement of a special interface with which you can check the file before adding it to the workspace (The Review button -> it is redirecting the window to proper sheet with the extension). The main import window contains information about the file such as its creator, date of creation and additionally the message contained - in case of a JSON signed file.

<Diffrent imports for diffrent extensions>
All imports are different with each other, depending on the type of extension. For example extensions with code input has a code type sheet to check. Dynamic Table has the whole structure of designed table presented in the review window.

<Name conflicts>
In case of importing an extension, that name is already included in the list of available extension, it is instantly overriding the older file with the input of imported extension. It is important to create a copy of previous file in case to save some useful data.

## Export
Extensions can be exported into a Json or a signed file. To export an extension select the extension from XtendM3 and click the "Export" button from the tool bar above.

<img src="../../../assets/attachments/export/ex_button.PNG" width="950">

Pop up window will aprear with export options.<br>
* Message - Inputted message will be displayed when importing the extension;
* Export - fetches the latest version of the extension;
* Local export - exports extension cashed in the web browser;
* Signed Export - exports into a signed file.

<img src="../../../assets/attachments/export/window.PNG" width="950">

After selecting one of export option, file will be automaticly saved on local directory.


## Important notes

* Files will be overwritten in case of file name conflict. Remember to export previous extension first to save it befor overwriting;
* Imported extensions are being validated, if not valid an error window will apear;
* Current Import/Export method is not a final version. Still in development.