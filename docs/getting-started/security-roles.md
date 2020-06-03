---
layout: default
title: Security Roles
parent: Getting Started
nav_order: 2
---

# Security Roles
To work with XtendM3 you should make sure you have the right IFS security roles.

## Required Roles
To access XtendM3 you must have one of the following required roles.

### Managing Extensions
To be able to administrate XtendM3 you should have `M3BE-ExtensionsAdmin` IFS access role. With this role you are able to:

* View Extensions
* Create Extensions (except in production tenant)
* Modify Extensions (except in production tenant)
* Delete Extensions 
* Activate/Deactivate Extensions
* Import/Export Extensions

### Viewing Extensions
To be able to view XtendM3, you should have `M3BE-ExtensionsViewer` IFS access role. With this role you are able to:

* View Extensions
* Export Extensions

## Optional Roles
To fully leverage all different tools and be able to develop, troubleshoot and monitor extensions easily we recommend the
developer to have the following access roles as well:

* `M3BE-FndUser` to access M3 Job admin tool and monitor jobs that use the extension
* `M3BE-LogEnabler` to activate logs on her 
* `M3MDP-User` to access MetaData Publisher tool to view source codes and metadata information of M3 BE components
* `M3BE-FileViewer` to access files that extensions might create