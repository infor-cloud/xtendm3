---
layout: default
title: Local XtendM3 workspace
parent: Documentation
nav_order: 10
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

## Test-compile, import and activate
From your local workspace, you can test-compile, import and activate your extensions using ION APIs.

### Setup Authorization
Authorization is done using OAuth 2.0, start setting up new authorization from ION API.

**Add OAuth2.0 credentials**
* Open the ION API application
* Navigate to "Authorized Apps"
* Press the plus button on top of the list
* Input a name, check type "Backend Service" and input a description
* After saving you will be able to download your credentials
  * Download your credentials and open the file using a text editor of your choice

### Setup Postman
Using the information from the credentials(.ionapi) file, setup the authorization in Postman.

* Open Postman
* Create a new request
* In the request, open the authorization tab
* Set "Type" to OAuth 2.0 and "Add authorization data to" to "Request Headers"
* Give the token a name, and fill in the rest of the fields using information from the .ionapi file
  * Access Token URL = pu + ot
  * Username = saak
  * Password = sask
  * Client ID = ci
  * Client Secret = cs
* Press the button on the bottom of the "Configure New Token" page to get a new access token
*

With authorization setup and ready, we can move on to create the requests in Postman.

**Body template**


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
              "created": ,
              "createdBy": <user>,
              "apiVersion"
            }
          }
        }


**Test-compile**
* Method: POST
* URL: https://url.com/M3CEDEVAPPCHE_AX1/M3/extensibility/testCompile/
* Body: see section 'Body template'

**Import**
* Step1
* Step2

**Activate**
* Step1
* Step2

