---
layout: default
title: Batch Scheduling
parent: Documentation
nav_order: 1
---

# Batch Scheduling
{: .no_toc }

Scheduling XtendM3 Batch Extensions
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
   {:toc}

---

## SHS010/SHS010MI
SHS010, or SHS010MI for the interactive version, is the scheduler for XtendM3 Batch Extensions. It works in a similar fashion to SHS050, which is used to schedule M3 Batch Jobs, and in the background also schedules executions through this.

### Available parameters
This section lists the available SHS010MI parameters. 

#### Same day once
* XNOW: execute now
* XTOD: execute today, needs to be paired with XJTM

#### Next weekday once
To consider, each of these parameters needs to be pared with a time(XJTM).
* XNMO: execute next Monday
* XNTU: execute next Tuesday
* XNWE: execute next Wednesday
* XNTH: execute next Thursday
* XNFR: execute next Friday
* XNSA: execute next Saturday
* XNSU: execute next Sunday

#### Schedule executions
To consider, each of these parameters needs to be pared with a time(XJTM).
* XEMO: execute every Monday
* XETU: execute every Tuesday
* XEWE: execute every Wednesday
* XETH: execute every Thursday
* XEFR: execute every Friday
* XESA: execute every Saturday
* XESU: execute every Sunday
* XEMT: execute every Month. <b>Note</b>, needs to be paired with day(XRDY) parameter

<b>Note</b>, mon-sun is allowed to be multi-submission. All others must be single-submission.

* XJTM: time, format is xxxx. Ex. 1340. Timezone will be the users local timezone, gathered from MNS151, MNS150 and MNS100
* XRDY: day, format is xx. Ex. 25
