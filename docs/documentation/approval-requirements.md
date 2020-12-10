---
layout: default
title: Approval Requirements
parent: Documentation
nav_order: 5
---

# Approval Requirements
{: .no_toc }

Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }
Once all the information below is ready and the extension has been tested, send a mail to XtendM3 mailbox per the format below for approval and signature.

## Table of contents
{: .no_toc .text-delta }
1. TOC
{:toc}

---


## Request Format
### Request Content
Copy this form to your mail and answer all questions. This questionaire should be done per extension. So if three extensions are sent in, this will be done for three of them separately but it can be done in one mail.

- Requirement Description (1 or 2 paragraphs)
- Solution Description (1 or 2 paragraphss)
- Module
- Is this a new solution?
  - If not, what has been changed or updated?
- Direct database access?
  - Is it done on M3 Tables or Dynamic tabels?
  - If M3 tables
    - Is there any API for this table?
      - If yes, why API is not used?
      - If no, has enhancement request been added?
    - Are you using indexes to access with keys other than company and division?
    - Are you using expressions to filter your access? How many records do you estimate to be there if filter is not applied?
  - If Dynamic tables
    - Is the dynamic table extending a standard table?
      - If yes, have all the standard fields been validated to make sure they exist in M3 e.g. order number?
- Has this solution / extension been tested and functionally approved?
- Is the repository updated with the correct branches i.e. if it is coming from TST tenant, the tst branch should be updated with these changes and once signed extension for prd is receive, master/prd branch should be updated.
- Are there any issues or parts that does not follow the guideline which you are asking for exception, if so, why?
- Have you read the programming standard and made sure the code is compliant with the standard?
- Have you followed the recommended naming conventions for the extension, methods, variables?
- Have you documented the extension code?
- Except for data setup, are there any other configuration or extensions that need to be there for this extension to work? 
- Is logger used in extension
  - If yes, is it only using debug level? (Extension will not be approved with any other logger level than debug) 

### Attachments
- Exported extension in JSON format
- Link to Git repository containing extensions

## Recommendation
Please go through these checklists before sending extension for approval

- [x] Extension JavaDoc on top of extension classes
- [x] Extension Methods JavaDoc on top of methods (except for main)
- [x] Testing extension and verifying it works as intended and it handles errors properly
- [x] Compatible with Extensions Programming Standard
- [x] Following naming conventions
- [x] Detailed review on Logging
- [x] Detailed review on Direct database access
- [x] Detailed review on Number of API calls
