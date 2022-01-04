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
It is possible to export and import extensions into XtendM3 environment. Current methods are still in development and can be updated.

## Import
Different types of extensions are being saved in JSON files (typical JSON files or signed JSON files, which are a little bit modified while exporting extension). Importing an extension is possible by using an import button above the code sheet. After clicking that button a proper window will open and prompt the user to choose an extension which should be imported.

<img src="../../../assets/attachments/export/import_bttn.PNG" width="950">

### Structure of importing

Import feature has improvement of a special interface with which you can check the file before adding it to the workspace (The Review button -> it is redirecting the window to proper sheet with the extension). The main import window contains information about the file such as its creator, date of creation and additionally the message contained - in case of a JSON signed file.

### Different imports for diffrent extensions

All imports are different depending on the type of extension. For example extensions with code input has a code type sheet to check. Dynamic Table has the whole structure of designed table presented in the review window.

<img src="../../../assets/attachments/export/import_window.PNG" width="950">

### Name conflicts
In case of importing an extension,and that name is already included in the list of available extension, it is instantly overriding the older file with the input of imported extension.Therefore, it is important to create a copy of previous file in case there is some useful data to be saved .<br>

## Export

Extensions can be exported into a Json or a Json signed file. To export an extension select the extension from XtendM3 and click the "Export" button from the tool bar above.

<img src="../../../assets/attachments/export/ex_button.PNG" width="950">

Pop up window will aprear with export options:<br>
* Message - Inputted message will be displayed when importing the extension<br>
* Export - fetches the latest version of the extension<br>
* Local export - exports extension cashed in the web browser<br>
* Signed Export - exports into a signed file.

<img src="../../../assets/attachments/export/window.PNG" width="950">

After selecting one of the export options, the file will be automatically saved on local directory.<br>

## Important notes

* Files will be overwritten in case of file name conflict. Remember to export previous extension first to save it befor overwriting<br>
* Imported extensions are being validated, if not valid an error window will appear<br>
* Current Import/Export method is not a final version. Still in development.