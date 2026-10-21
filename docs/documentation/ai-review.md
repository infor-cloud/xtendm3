---
layout: default
title: AI Review
parent: Documentation
nav_order: 2
---

# XtendM3 AI Review
{: .no_toc }
Code reviewer right in the online editor.
{: .fs-6 .fw-300 }

The AI Review is an optional tool built into the XtendM3 code editor, it sends the extension code to Infor GenAI and returns a structured list of findings. <br> 
Running the extension through AI review for submission is not required, but highly recommended - it surfaces common issues early making the overall review and signing process faster.

**Note:** AI reviews can contain mistakes, getting an approved AI review does not guarantee that the submitted extension will be approved and signed.

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Using the tool
The AI Review is accessed directly from the XtendM3 code editor. Open the extension you want to review, then click the **AI Review** button(far right) in the editor toolbar. The results appear in a panel below the editor without leaving the page. <br>

---

The review panel has three sections; the Rule Compliance Table, the Executive Summary, and the Findings list.

### Rule Compliance Table
The table lists every rule the AI checks, what each rule looks for, a verdict, and a note explaining the outcome. <br>

The rules may either pass, fail, or not be applicable for the code:
<img src="../../../assets/attachments/ai-review/rule-compliance-table.png" />

### Executive Summary & Findings
Contains a table that lists the severity and number of code violation(s), together with an overall verdict regarding if the extension passed the review. <br>
Below that is a full list of findings from the review.

<img src="../../../assets/attachments/ai-review/executive-summary-findings.png" />

## Activating & Getting Access
In order to get access to the XtendM3 AI Review, the customer needs to complete required paperwork to obtain the 'GenAI Embedded Experience' SKU. This SKU is required before GenAI can be provisioned for the tenant(s). <br>
If Velocity Suite is already acquired/provisioned, the GenAI SKU is not required.

## Usage & Tokens
An AI review costs GenAI tokens, the amount of tokens depends on the amount of code reviewed. <br>
However, with Velocity Suite users can use Infor GenAI without concern for token consumption.