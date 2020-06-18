---
layout: default
title: Metadata
parent: Documentation
nav_order: 6
---

# Metadata
{: .no_toc }


Metadata file for your extensions
{: .fs-6 .fw-300 }
![](/assets/images/warning-24px.svg) **️IN PROGRESS, NOT COMPLETE YET**

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Format
Metadata file is written in the YAML format with the structure similar to below:

```yaml
metadataVersion: 1
extensions:
  - name: ValidateInvoiceDateInteractive.groovy
    triggers:
      - type: METHOD
        program: MMS001
        method: PEINZ
        advice: POST
      - type: METHOD
        program: MMS002
        method: PEINZ
        advice: PRE
    utilities:
      - NumberUtils
      - DateUtils
  - name: ValidateInvoiceDateMI.groovy
    triggers:
      - type: TRANSACTION
        program: MMS200MI
        transaction: UpdItem
        advice: PRE
    utilities:
      - NumberUtils
      - DateUtils
apis:
  - name: EXT200MI
    transactions:
      - name: UpdInvoiceDate
        description: Cool transaction
        type: SINGLE
        inputs:
          - name: CONO
            description: Company
            length: 3
            type: NUMERIC
            mandatory: true
          - name: ITNO
            description: Item Number
            length: 15
            type: ALPHANUMERIC
            mandatory: true
        outputs:
          - name: ITDS
            description: Item Description
            length: 40
            type: ALPHANUMERIC
utilities:
  - name: NumberUtils
  - name: DateUtils
```
