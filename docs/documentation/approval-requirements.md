---
layout: default
title: Approval Requirements
parent: Documentation
nav_order: 12
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
<div style="background-color: #fff3cd; padding: 10px; border-left: 4px solid #ffc107;">
⚠️ Effective <strong>January 2026</strong>, Infor-certified developers are required to attach the Amazon Q code review results when submitting XtendM3 review requests to xtendm3@infor.com. </div>

<br />Please refer to the demo and guidelines on how to use Amazon Q for code reviews:
[Amazon Q XtendM3 Review](https://inforonline.sharepoint.com/sites/M3TechnicalGDS/Shared%20Documents/Forms/AllItems.aspx?csf=1&web=1&e=E7qsDq&ovuser=457d5685%2D0467%2D4d05%2Db23b%2D8f817adda47c%2CJeanMarie%2ECarreon%40infor%2Ecom&CID=b9d0eb6d%2D3c33%2D4cea%2Db5d4%2D3b148d48d699&cidOR=SPO&FolderCTID=0x0120000195727F2E06FD4C91686EE5706E6D37&id=%2Fsites%2FM3TechnicalGDS%2FShared%20Documents%2FGeneral%2FGenAI%2FAmazon%20Q%20Xtendm3%20Review)
<br />

## Request Format
Outlining the format of XtendM3 extension request.

### Request Content
Copy this form to your mail and answer all questions.
Email subject format: [Project Name] [XtendM3 Extension Name]
The questionnaire should be answered per extension;  
Therefore, if there are three extensions sent for review, there should be three separate sections in one email answering the following for each extension:

- Project/Customer Name
- Planned Go Live Date
- Project Manager responsible for Billing or Clarity Tasks
- Clarity Project ID or Infor Services Work Order Number (attach signed SWO)
- Developer Name (Developer needs to have completed the XtendM3 trainings and have been attending the workshops)
- Requirement Description (1 or 2 paragraphs)
- Solution Description (1 or 2 paragraphs)
- Affected M3 Module (Finance, Procurement, etc.)
- Is this a new solution?
  - If not, what has been changed or updated?
- Does it implement direct database access?
  - Is direct access done on M3 Standard Tables or Dynamic (XtendM3) Tables?
  
  - If M3 Standard Table direct database access
    - Is there a standard M3 API for the M3 standard table?
       - If yes, why was the M3 API not used instead of the direct database access?
       - If no, was an enhancement request sent to product development to have an M3 API created for the M3 standard table?
    - Are indexes used to access the tables, using keys other than just the company and division?
    - Are you using expressions to filter the database access? 
      How many records are estimated to be retrieved if filter is not applied?

  - If Dynamic (XtendM3) Table direct database access
    - Is the dynamic table extending an M3 standard table?
      - If yes, have all the dynamic table fields, that are referenced to M3 standard table fields, been validated to make sure they exist in M3 e.g. Order Number?

- Has this solution / extension been fully tested and functionally approved?
- Provide link/url to the version controlled repository containing the extensions
- Is the repository updated with the correct branches? 
  i.e. if it is coming from TST tenant, the TST branch should be updated with these changes 
  And once signed extension for PRD is receive, master/prd branch should be updated.
- Does the extension solution/codes contain parts that does not follow the guidelines/best practices, for which you are requesting an exception/special approval? 
   - If so, why?
- Have you read the programming standards and made sure the code is compliant with the standards?
- Have you followed the recommended naming conventions for extensions, methods, variables?
- Have you documented the extension code?
- Except for data setup, are there any other configuration or extensions dependencies required to exist for this extension to work?
- Is logger used in extension?
   - If yes, is it only using debug level? (Extension will not be approved with any other logger level than debug) 

### Attachments
- Exported extension in JSON format
- Exported dynamic tables in JSON format
- Amazon Q code review results (Mandatory for Infor-certified developers)

Effective **January 2026**, Infor-certified developers are required to attach the Amazon Q code review results when submitting XtendM3 review requests to xtendm3@infor.com.
Please refer to the demo and guidelines on how to use Amazon Q for code reviews:
[Amazon Q XtendM3 Review](https://inforonline.sharepoint.com/sites/M3TechnicalGDS/Shared%20Documents/Forms/AllItems.aspx?csf=1&web=1&e=E7qsDq&ovuser=457d5685%2D0467%2D4d05%2Db23b%2D8f817adda47c%2CJeanMarie%2ECarreon%40infor%2Ecom&CID=b9d0eb6d%2D3c33%2D4cea%2Db5d4%2D3b148d48d699&cidOR=SPO&FolderCTID=0x0120000195727F2E06FD4C91686EE5706E6D37&id=%2Fsites%2FM3TechnicalGDS%2FShared%20Documents%2FGeneral%2FGenAI%2FAmazon%20Q%20Xtendm3%20Review)

For partners, it is recommended to run a code review using their available AI-assisted code review tools.

## Mandatory Checklist
Please go through these checklists before sending extension for approval

- Extensions are stored using a version controlled repository like GitHub, BitBucket, Azure DevOps, or GitLab
  ([XtendM3 Example of a repository structure](https://github.com/infor-cloud/acme-corp-extensions))
- Extension JavaDoc has been created on top of the extension classes
- Extension Method’s JavaDoc has been created on top of the methods (except for the main() method)
- Extensions have been fully tested and verified to be working as intended
- Extensions have in place proper error handling logic
- Extensions adheres to the Programming Standards
- Naming conventions have been followed
- Logs have been reviewed in detail
- Direct database access have been reviewed in detail
- Number of API calls have been reviewed to be efficient

## XtendM3 Review and Signing Process

The diagram below illustrates the XtendM3 review, feedback, approval, and signing process
for new requests and changes to previously signed extensions.

<img src="../../../assets/attachments/approval-requirements/review-and-signing-process.png" />

Please have the SLA considered/incorporated when solution estimates are created and given to customers.

**For new extensions**, a review will be scheduled;  
expect to receive a calendar invite for the meeting, whose required attendees would be the developer and the functional consultant; PM is optional.

**The SLA for new extension requests is 10 days per up to 20 extensions.** Multiple requests from same customer is not processed in parallel i.e. if 20 is sent in by the first request, the next 20 for the same client will start its SLA after the first 20 are done.

**For previously reviewed and signed extensions,**
if only minor adjustments were done,
an email will be sent to you with the signed extension; otherwise, a meeting will be scheduled again for the review.

**The SLA for reviewing previously signed extensions is 48 hours.**

If recommendations are provided during the review,  
you will be requested to make the necessary revisions in order to comply with the recommendations.  
Once done, send the corrected extensions again for review and signing.

Once the review is completed and extensions are approved,
a signed packaged version of the extension will be emailed back to you.

## Review/Signing Process and Billing
Upon our receipt of the email request containing the extensions, 2-3 consultants will be reviewing the solution and codes.
Consulting charges applies for this activity, so the consultants who will be reviewing the extensions will be billing their time spent against the project/customer or partner.

Effective **July 1, 2021**, 
we will no longer release signed extensions without first being able to bill our time spent for the review and signing.

### Billing Specifics

We bill 1-2 hours for the review of simple to medium complexity extensions.<br>
For complex extensions, it normally takes more time as it requires multiple cycles of review/discussions/revisions so it will be actual time spent that will be charged.<br>
We go by GDS/COE Manila Offshore Principal Consultant rates, you can check with your Client Partners or Partner Account Manager as to how much this is exactly per hour.<br>

A recommendation,<br>
As per standard practice for our projects, we include the review hours in the work estimates for development of extensions.  
On high level, budgeting for 5-10% of each extension development effort is enough time for the review/signing.
