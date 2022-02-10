---
layout: default
title: Version Controlling
parent: Documentation
nav_order: 4
---

# Version Controlling
{: .no_toc }


Guideline for securing your extensions using a version control system
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Introduction
XtendM3 Extensions are <b>required</b> to be version controlled outside of M3 <b>using a version control system</b>. This is a <b>mandatory</b> key 
requirements to approve extensions for deploy to production. Version controlling the extensions help us to

* Have better visibility of what has changed and by whom, to understand the code and troubleshoot it easier later on
* Ease the collaboration between different developers
* Have centralized overview of current extensions in different tenants
* Compile and test extensions regularly on every change to make sure that the extension has not been broken

## Repository Format
The recommended way of storing the extension is in a Maven project stored in a Git Repository. The reason Maven is used 
is to manage the build and test lifecycle of extensions locally. Using Maven you can compile your extensions locally with 
the SDK and make sure the code is compilable. We can also create unit tests and run them to simulate and debug locally or 
integrate it with the build lifecycle and a pipeline on the repository to continuously build and test the extensions on 
every push to the repository. 

## Branching
The recommended branching strategy is to have the `master` as the production branch i.e. containing all of the extensions 
in production and create one branch per each other tenant. Suppose that we have a DEM tenant and a PRD. This means that 
we will then have one `master` branch and one `dem` branch. Developers will be working on the `dem` branch during development 
and as soon as it is completely verified, approved and signed it can be merged into `master` i.e. meaning applying changes 
from `dem` branch to `master` 

## Example
To show an example the below repository is provided as template to generate new projects from and work locally/remotely. 

[XtendM3 Example of a repository](https://github.com/infor-cloud/acme-corp-extensions).