---
layout: default
title: Trigger Extension Templates
parent: Templates
grand_parent: Examples
nav_order: 2
---

# Trigger Extension Templates
{: .no_toc }

Working with the Trigger Extensions in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
This document contains diffrent templates with usage of a Trigger Extension (with diffrent APIs).


### Check whether program should run

#### Description
This template allows user to implement code, which can be useful while designing some functionality where it is necessary to check authorization for specific users (or group of users etc.).

#### Code template
```groovy
class CheckShouldRun extends ExtendM3Trigger {
  private final ProgramAPI program
  private final InteractiveAPI interactive
  private final LoggerAPI logger
  private final MICallerAPI miCaller
  private final String[] runOnlyForUsers = [] // Leave the array empty if it should be run for everyone, otherwise add authorized usernames

  FindDuplicateCustomers(ProgramAPI program, InteractiveAPI interactive, LoggerAPI logger, MICallerAPI miCaller) {
    this.program = program
    this.interactive = interactive
    this.logger = logger
    this.miCaller = miCaller
  }

  void main() {
    // Ckecks if program should run
    if (!shouldRun()) {
      return;
    }
  }

  /**
   * Check if script should run or not
   * @return true if script should run
   */
  boolean shouldRun() {
    if (runOnlyForUsers.length != 0) {
      String currentUser = program.LDAZD.get("RESP").toString().trim()
      boolean authorizedToRun = runOnlyForUsers.contains(currentUser) // checkes if currentUser is contained inside the runOnlyForUsers table
      logger.debug("User {$currentUser} authorization check result was ${authorizedToRun}")
      return authorizedToRun
    }
    return true
  }
```

## Important notes
- It is a good practice to use a test compilation of the program just to check if everything is working properly.
- Data presented in the examples is random.
- Remember to check the name of created extension while using ready templates/examples
 
 
## See also
- [API documentation](../../../documentation/api-specification)
- [Use cases](../../../examples/use-cases)
- [Examples](../../../examples)
