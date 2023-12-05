---
layout: default
title: Local XtendM3 Workspace
parent: Documentation
nav_order: 5
---

# Local XtendM3 Workspace
{: .no_toc }

Setting up and using a local XtendM3 workspace
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
## ACME Corp Template Repository
We can start with setting up a local workspace using the [ACME Corp Template](https://github.com/infor-cloud/acme-corp-extensions) available in the Infor Cloud Github repository.  
This template should also be used for setting up customer repositories to version control live extensions.

## Lint and export
You can lint and export the extensions you're working on locally using the XtendM3 Maven plugin.<br>
<br>
To begin with, open the pom.xml file in your local workspace and make sure the latest version of the Maven plugin is used. 
* Navigate to the "build" section and the "xtendm3-maven-plugin" plugin
* Check the version used, latest available version of the Maven plugin can be found [here](https://central.sonatype.com/artifact/com.infor.m3/xtendm3-maven-plugin)
<br>

### Lint
To lint the extensions defined in your project, stand in the root of the project and run: 
* ```./mvnw xtendm3:lint``` on *nix based terminals
* ```mvnw.cmd xtendm3:lint``` on Windows based terminals

### Export
To export the extensions defined in your project, stand in the root of the project and run:
* ```./mvnw xtendm3:export``` on *nix based terminals
* ```mvnw.cmd xtendm3:export``` on Windows based terminals

## Test-compile, import and activate
From your local workspace, you can test-compile, import and activate your extensions using XtendM3 APIs available in ION.

### Setup ION API Authorization
Authorization is done using OAuth 2.0, start setting up new authorization from ION API.

* Open the ION API application
* Navigate to _"Authorized Apps"_
* Press the plus button on top of the list
* Input a name, check type _"Backend Service"_ and input a description
* After saving you will be able to download your credentials
  * Download your credentials and open the file using a text editor of your choice

### Setup Postman
Setup the authorization and requests in Postman.

#### Setup Postman API Calls
Create and setup the XtendM3 requests. 

##### Test-compile
* Method: POST
* URL: https://\<**url**>/\<**tenantName**>/M3/extensibility/testCompile/
* Body: see section _"Body Template"_
* Headers 
  * Content-Type: application/json
  * Content-Length: calculated when request is sent (usually automatically generated)
  * Host: calculated when request is sent (usually automatically generated)

##### Import
* Method: POST
* URL: https://\<**url**>/\<**tenantName**>/M3/extensibility/import/
* Body: see section _"Body Template"_
* Headers
  * Content-Type: application/json
  * Content-Length: calculated when request is sent (usually automatically generated)
  * Host: calculated when request is sent (usually automatically generated)

##### Activate
* Method: PUT
* URL: https://\<**url**>/\<**tenantName**>/M3/extensibility/active/\<**extensionUuid**>?active=true
* Body: no body needed
* Headers
  * Host: calculated when request is sent (usually automatically generated)

#### Setup Authorization in Postman
Using the information from the credentials(.ionapi) file, setup the authorization in Postman.

* In any previously created request, open the authorization tab
* Set "Type" to OAuth 2.0 and _"Add authorization data to"_ to _"Request Headers"_
* Give the token a name, set _"Grant Type"_ to _"Password Credentials"_ and fill in the rest of the fields using information from the downloaded(.ionapi) credentials file
  * Access Token URL = pu + ot
  * Client ID = ci
  * Client Secret = cs
  * Username = saak
  * Password = sask
* Press the button on the bottom of the _"Configure New Token"_ page to get a new access token  

#### Body Template

```json
        {
          "programModules": {
            <name_of_be_program>: {
              "program": <name_of_be_program>,
              "triggers": {
                <trigger_extension_name>: {
                  "name": <trigger_extension_name>,
                  "method": <method>,
                  "advice": <advice>,
                  "active": true/false,
                  "modified": <epoch_last_modified_date>,
                  "modifiedBy": <user>,
                  "sourceUuid": <source_uuid>,
                  "programName": <name_of_be_program>,
                  "utilities": [],
                  "type": "METHOD",
                  "priority": <priority>
                }
              },
              "transactions": {},
              "batches": {}
            },
            <name_of_batch_program>: {
              "program": <name_of_transaction_program>,
              "triggers": {},
              "transactions": {},
              "batches": {
                 "sourceUuid": <source_uuid>,
                 "description": <description>,
                 "active": true/false,
                 "modified": <epoch_last_modified_date>,
                 "modifiedBy": <user>,
                 "utilities": []
              }
            },
            <name_of_transaction_program>: {
              "program": <name_of_transaction_program>,
              "triggers": [],
              "transactions": {
                <name_of_transaction>: {
                  "sourceUuid": <source_uuid>,
                  "name": <name_of_transaction>,
                  "program": <name_of_transaction_program>,
                  "description": <description>,
                  "active": true/false,
                  "multi": true/false,
                  "modified": <epoch_last_modified_date>,
                  "modifiedBy": <user>,
                  "outputFields": [
                    {
                      "name": <field_name>,
                      "description": <field_description>,
                      "length": <field_length>,
                      "mandatory": <true/false>,
                      "type": <A/N>
                    }
                  ],
                  "inputFields": [
                    {
                      "name": <field_name>,
                      "description": <field_description>,
                      "length": <field_length>,
                      "mandatory": <true/false>,
                      "type": <A/N>
                    }
                  ],
                  "utilities": []
                }
              },
              "batches": {}
            }
          },
          "utilities": {
            <utility_name>: {
              "name": <utility_name>,
              "sourceUuid": <source_uuid>
            }
          },
          "sources": {
            <source_uuid>: {
              "uuid": <source_uuid>,
              "updated": <epoch_last_modified_date>,
              "updatedBy": <user>,
              "created": <epoch_created_date>,
              "createdBy": <user>,
              "apiVersion" <apiVersion, e.g. 0.12>,
              "beVersion": <>,
              "codeHash": <codeHash, generated during export>,
              "code": <base64 encoded extension code>,
            },
            <source_uuid>: {
              "uuid": <source_uuid>,
              "updated": <epoch_last_modified_date>,
              "updatedBy": <user>,
              "created": <epoch_created_date>,
              "createdBy": <user>,
              "apiVersion" <apiVersion, e.g. 0.12>,
              "beVersion": <>,
              "codeHash": <codeHash, generated during export>,
              "code": <base64 encoded extension code>,
            },
            <source_uuid>: {
              "uuid": <source_uuid>,
              "updated": <epoch_last_modified_date>,
              "updatedBy": <user>,
              "created": <epoch_created_date>,
              "createdBy": <user>,
              "apiVersion" <apiVersion, e.g. 0.12>,
              "beVersion": <>,
              "codeHash": <codeHash, generated during export>,
              "code": <base64 encoded extension code>,
            },
            <source_uuid>: {
              "uuid": <source_uuid>,
              "updated": <epoch_last_modified_date>,
              "updatedBy": <user>,
              "created": <epoch_created_date>,
              "createdBy": <user>,
              "apiVersion" <apiVersion, e.g. 0.12>,
              "beVersion": <>,
              "codeHash": <codeHash, generated during export>,
              "code": <base64 encoded extension code>,
            }            
          }
        }
```