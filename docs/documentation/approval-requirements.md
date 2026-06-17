---

layout: default
title: Approval Requirements
parent: Documentation
nav_order: 12
---

# Approval Requirements
{: .no_toc }

<div style="background-color: #fff3cd; padding: 10px; border-left: 4px solid #ffc107;">
⚠️ Effective <strong>July 1, 2026</strong>, Requests for XtendM3 review and XtendM3 activation must be created in ServiceNow. </div>

<br />
Checklist for requesting approval for your extensions.
{: .fs-6 .fw-300 }

Once all required information is prepared and the mandatory checklist is completed, create a new ServiceNow ticket under Sold Product: **XtendM3 Review ONLY – do not use for P1**.

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
<div style="background-color: #fff3cd; padding: 10px; border-left: 4px solid #ffc107;">
⚠️ Effective <strong>January 2026</strong>, AI-assisted code review (Amazon Q for Infor) is mandatory for all approval requests and must be included at the time of submission. All identified issues or violations must be resolved before submission.
</div>
<br />
Please refer to the demo and guidelines on how to use Amazon Q for code reviews:
[Amazon Q XtendM3 Review](https://inforonline.sharepoint.com/:f:/r/sites/XtendM3Community/Shared%2520Documents/General/Amazon%2520Q%2520XtendM3%2520Review?csf=1&web=1&e=WQtWHN)
<br />

## Request Format

Outlining the format of an XtendM3 extension request.

### Request Content
{: .no_toc }

#### Submit separate requests for new extensions and previously signed extensions. ####
{: .no_toc }

Copy this form into your ticket and complete all sections. Tickets with incomplete information will be returned to the ticket owner for completion.

The questionnaire must include one detailed section per extension. Therefore, if three extensions are submitted for review, provide three separate detailed sections—one for each extension.

## Header

* Project/Customer Name
* Planned Go Live Date
* **( Mandatory )** Project Manager responsible for billing or Certinia project and tasks
* **( Mandatory )** Certinia Project ID or Infor Services Work Order Number (attach signed SWO)
  Secure a Certinia Project ID from the Project or Infor Client Partner or Customer Success Manager
* Developer Name and email address (The developer must have completed the XtendM3 training and attended the workshops)

## Detail

### Requirement Description (1 or 2 paragraphs)
{: .no_toc }

* Solution Description (1 or 2 paragraphs)
* Affected M3 Module (Finance, Procurement, etc.)
* Is this a new extension? (Yes/ Previously Signed)

  * If not, what has been changed or updated?
* Does it implement direct database access?

  * Is direct access performed on M3 Standard Tables or Dynamic (XtendM3) Tables?
  * If direct database access is performed on an M3 standard table:
    * Is there a standard M3 API for the M3 standard table?

      * If yes, why was the M3 API not used instead of the direct database access?
      * If no, was an enhancement request sent to product development to have an M3 API created for the M3 standard table?
    * Are indexes used to access the tables, using keys other than just the company and division?
    * Are you using expressions to filter the database access?
      How many records are estimated to be retrieved if filter is not applied?
  * If direct database access is performed on a dynamic (XtendM3) table:
    * Is the dynamic table extending an M3 standard table?
      * If yes, have all the dynamic table fields that reference M3 standard table fields been validated to make sure they exist in M3, e.g., Order Number?
* Has this solution / extension been fully tested and functionally approved?
* Provide a link or URL to the version-controlled repository containing the extensions
* Is the repository updated with the correct branches?
  i.e., the TST branch should be updated with these changes. Once the signed extension for PRD is received, the master/prd branch should be updated.
* Does the extension solution or code contain parts that do not follow the guidelines/best practices, for which you are requesting an exception/special approval?

  * If so, why?
* Have you read the programming standards and made sure the code is compliant with the standards?
* Have you followed the recommended naming conventions for extensions, methods, variables?
* Have you documented the extension code?
* Except for data setup, are there any other configuration or extension dependencies required to exist for this extension to work?
* Is a logger used in the extension?

  * If yes, is it only using debug level? (The extension will not be approved if any logger level other than debug is used)
* Have the AI recommendations / feedback been addressed? If no, why?

### Attachments
{: .no_toc }

* Exported extension in JSON format
* Exported dynamic tables in JSON format
* Amazon Q code review results (Mandatory for Infor-certified developers), or any AI equivalent code review results
* All attachments must be consolidated into a single ZIP file named using the submission date.

Effective **January 2026**, Infor-certified developers are required to attach the Amazon Q code review results when submitting XtendM3 review requests.
Please refer to the demo and guidelines on how to use Amazon Q for code reviews:
[Amazon Q XtendM3 Review](https://inforonline.sharepoint.com/:f:/r/sites/XtendM3Community/Shared%2520Documents/General/Amazon%2520Q%2520XtendM3%2520Review?csf=1&web=1&e=WQtWHN)

For partners, a similar code review using their available AI-assisted code review tools is also required.

**Disclaimer:**
AI-generated code review results are intended to assist developers and should not be considered definitive. Developers are responsible for reviewing, validating, and applying judgment to the findings, as AI tools may not be 100% accurate or context-aware.

## Mandatory Checklist

#### Please go through these checklists before sending the extension for approval
{: .no_toc }

* Certinia Project ID or Infor Services Work Order Number (attach signed SWO)
* Extensions are stored using a version-controlled repository like GitHub, BitBucket, Azure DevOps, or GitLab
  ([XtendM3 Example of a repository structure](https://github.com/infor-cloud/acme-corp-extensions))
* Repositories should be owned and/or managed by the customer.
* Extension JavaDoc has been created on top of the extension classes
* JavaDoc for extension methods has been created on top of the methods (except for the main() method)
* Extensions have been fully tested and verified to be working as intended
* Extensions have in place proper error handling logic
* Extensions adhere to the Programming Standards
* Naming conventions have been followed
* Logs have been reviewed in detail
* Direct database access has been reviewed in detail
* The number of API calls has been reviewed for efficiency
* AI code review results

## XtendM3 Review and Signing Process

The diagram below illustrates the XtendM3 review, feedback, approval, and signing process
for new requests, and changes to previously signed extensions.

<img src="../../../assets/attachments/approval-requirements/review-and-signing-process.png" />

Please ensure the SLA is considered and incorporated when solution estimates are created and given to customers.

**For new extensions**, a review will be scheduled;  
expect to receive a calendar invite for the meeting. The required attendee is the developer. The functional consultant and project manager are optional.

**The SLA for new extension requests is 10 days per up to 20 extensions.** Multiple requests from the same customer are not processed in parallel. For example, if 20 extensions are submitted in the first request, the SLA for any subsequent request will begin only after the first batch is completed.

**For previously reviewed and signed extensions,**
if only minor adjustments were made,
an email will be sent to you with the signed extension; otherwise, a meeting will be scheduled again for the review.

**The SLA for reviewing previously signed extensions is 48 hours.**

If recommendations are provided during the review,  
you will be requested to make the necessary revisions in order to comply with the recommendations.  
Once done, send the corrected extensions again for review and signing.

Once the review is completed and extensions are approved,
a signed packaged version of the extension will be emailed back to you.

## Review/Signing Process and Billing

Upon our receipt of the email request containing the extensions, 2-3 consultants will be reviewing the solution and code.
Consulting charges apply for this activity, so the consultants who will be reviewing the extensions will be billing their time spent against the project/customer or partner.

Effective **July 1, 2021**,
we will no longer release signed extensions without first billing our time spent for the review and signing.

### Billing Specifics
{: .no_toc }

We bill 1-2 hours per review of simple to medium complexity extensions.<br>
For complex extensions, it normally takes more time as it requires multiple cycles of review/discussions/revisions so the actual time spent will be charged.<br>
We go by GDS/COE Manila Offshore Principal Consultant rates, you can check with your Client Partners or Partner Account Manager to confirm the exact hourly rate.<br>

Recommendation:<br>
As per standard practice for our projects, we include the review hours in the work estimates for development of extensions.  
At a high level, budgeting for 5-10% of each extension development effort is enough time for the review/signing.

