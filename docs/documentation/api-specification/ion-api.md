---
layout: default
title: ION API
parent: API Specification
grand_parent: Documentation
nav_order: 6
---

# ION API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.6.0`  
**Context**: Any  
**Category**: Integration  
---

## Description
The ION API can be used to connect to M3 data by using ION API calls. There are several API methods to use the ION API depending on the user needs.


Imports and instances for every method:
```groovy
import groovy.json.JsonException
import groovy.json.JsonSlurper

public class SampleExtension extends ExtendM3Trigger {
  private final IonAPI ion
  private final LoggerAPI logger

  public SampleExtension(IonAPI ion, LoggerAPI logger) {
    this.ion = ion
    this.logger = logger
  }
```
JSON slurper parses text or reader content into a data structure of lists and maps.
Example:
```groovy
content = '{ "formats": ["pdf", "xml","xlsm", "jpg"] }'
JsonSlurper slurper = new JsonSlurper()    
Map parsed = (Map)slurper.parseText(content)
List<String> fileFormats = (List)parsed.get("formats")
for (String format : fileFormats) {
    println("Supporting format: ${format}")
}
```
Output:

```groovy
Supporting format: pdf
Supporting format: xml
Supporting format: xlsm
Supporting format: jpg
```
Parsing with JsonSlurper for ION methods:

```groovy
JsonSlurper slurper = new JsonSlurper()
Map parsed = (Map)slurper.parseText(content)
List<String> fileFormats = (List)parsed.get("SupportedFileFormats")
for (String format : fileFormats) {
  logger.debug("Supporting format: ${format}")
}

```

## Features
### POST method
This method performs a POST request and returns an ION Response object.

```groovy
@Override
void main() {
  def endpoint = "/IONAttachment/supportedfile/list"
  def headers = ["Accept": "application/json"]
  def queryParameters = (Map)null // define as map if there are any query parameters e.g. ["name1": "value1", "name2": "value2"]
  def formParameters = (Map)null // post URL encoded parameters
  IonResponse response = ion.post(endpoint, headers, queryParameters, formParameters)
  if (response.getError()) {
    logger.debug("Failed calling ION API, detailed error message: ${response.getErrorMessage()}")
    return
  }
  if (response.getStatusCode() != 200) {
    logger.debug("Expected status 200 but got ${response.getStatusCode()} instead")
    return
  }

  String content = response.getContent()
  if (content != null) {
    logger.debug("Expected content from the request but got no content")
    return
  }

```

### GET method
This method performs a GET request and returns an ION Response object.

```groovy
@Override
void main() {
  def endpoint = "/IONAttachment/supportedfile/list"
  def headers = ["Accept": "application/json"]
  def queryParameters = (Map)null // define as map if there are any query parameters e.g. ["name1": "value1", "name2": "value2"]
  IonResponse response = ion.get(endpoint, headers, queryParameters)
  if (response.getError()) {
    logger.debug("Failed calling ION API, detailed error message: ${response.getErrorMessage()}")
    return
  }
  if (response.getStatusCode() != 200) {
    logger.debug("Expected status 200 but got ${response.getStatusCode()} instead")
    return
  }
  String content = response.getContent()
  if (content != null) {
    logger.debug("Expected content from the request but got no content")
    return
  }
```

### PUT method
This method performs a PUT request and returns an ION Response object.
```groovy
@Override
void main() {
  def endpoint = "/IONAttachment/supportedfile/list"
  def headers = ["Accept": "application/json"]
  def queryParameters = (Map)null // define as map if there are any query parameters e.g. ["name1": "value1", "name2": "value2"]
  def formParameters = (Map)null //
  IonResponse response = ion.put(endpoint, headers, queryParameters, formParameters)
  if (response.getError()) {
    logger.debug("Failed calling ION API, detailed error message: ${response.getErrorMessage()}")
    return
  }
  if (response.getStatusCode() != 200) {
    logger.debug("Expected status 200 but got ${response.getStatusCode()} instead")
    return
  }

  String content = response.getContent()
  if (content != null) {
    logger.debug("Expected content from the request but got no content")
    return
  }
```

### DELETE method
This method performs a DELETE request and returns an ION Response object.
```groovy
@Override
void main() {
  def endpoint = "/IONAttachment/supportedfile/list"
  def headers = ["Accept": "application/json"]
  def queryParameters = (Map)null // define as map if there are any query parameters e.g. ["name1": "value1", "name2": "value2"]
  IonResponse response = ion.delete(endpoint, headers, queryParameters)
  if (response.getError()) {
    logger.debug("Failed calling ION API, detailed error message: ${response.getErrorMessage()}")
    return
  }
  if (response.getStatusCode() != 200) {
    logger.debug("Expected status 200 but got ${response.getStatusCode()} instead")
    return
  }
  String content = response.getContent()
  if (content != null) {
    logger.debug("Expected content from the request but got no content")
    return
  }
```

## Considerations and Guidelines
