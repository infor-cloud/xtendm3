---
layout: default
title: Local XtendM3 workspace
parent: Documentation
nav_order: 5
---

# Local XtendM3 workspace
{: .no_toc }

Setting up and using local XtendM3 workspace
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
## ACME Corp Template Repository
We can start with setting up a local workspace using the ACME Corp Template available here: https://github.com/infor-cloud/acme-corp-extensions. 
This template should be used for setting up customer repoistories to version control live extensions.


## Lint and export
Using the XtendM3 Maven plugin, you can lint and export your extension locally.

### Setup XtendM3 Maven plugin
To being setting up your local workspace, you should begin with downloading a few things


## Test-compile, import and activate
From your local workspace, you can test-compile, import and activate your extensions using ION APIs.

### Setup Authorization
Authorization is done using OAuth 2.0, start setting up new authorization from ION API.

**Create OAuth2.0 credentials**
* Open the ION API application
* Navigate to _"Authorized Apps"_
* Press the plus button on top of the list
* Input a name, check type _"Backend Service"_ and input a description
* After saving you will be able to download your credentials
  * Download your credentials and open the file using a text editor of your choice

### Setup Postman
Using the information from the credentials(.ionapi) file, setup the authorization in Postman.

* Open Postman
* Create a new request
* In the request, open the authorization tab
* Set "Type" to OAuth 2.0 and _"Add authorization data to"_ to _"Request Headers"_
* Give the token a name, set _"Grant Type"_ to _"Password Credentials"_ and fill in the rest of the fields using information from the downloaded(.ionapi) credentials file
  * Access Token URL = pu + ot
  * Client ID = ci
  * Client Secret = cs
  * Username = saak
  * Password = sask
* Press the button on the bottom of the _"Configure New Token"_ page to get a new access token

With authorization setup and ready, we can move on to create the requests in Postman.

**Test-compile**
* Method: POST
* URL: https://**url**>/<**tenantName**>/M3/extensibility/testCompile/
* Body: see section _"Body Template"_
* Headers 
  * Content-Type: application/json
  * Content-Length: <calculated when request is sent> (usually automatically generated)
  * Host: <calculated when request is sent> (usually automatically generated)

**Import**
* Method: POST
* URL: https://**url**/**tenantName**/M3/extensibility/import/
* Body: see section _"Body Template"_
* Headers
  * Content-Type: application/json
  * Content-Length: <calculated when request is sent> (usually automatically generated)
  * Host: <calculated when request is sent> (usually automatically generated)

**Activate**
* Method: PUT
* URL: https://**url**/**tenantName**/M3/extensibility/active/<extension-uuid>?active=true
* Body: no body needed
* Headers
  * Host: <calculated when request is sent> (usually automatically generated)

**Body Template**


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
                  "name": <name_of_transaction",
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