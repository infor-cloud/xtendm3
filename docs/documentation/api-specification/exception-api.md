---
layout: default
title: Exception API
parent: API Specification
grand_parent: Documentation
nav_order: 14
---

# Exception API
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---
**Since**: `0.5.0`
**Context**: Any  
**Category**: Generic  
---

## Description
The Exception API is used to throw various XtendM3 specific exceptions, as an alternative to throwing the exception using Groovy syntax.

## Features
Listing each API and its features.

### Interactive Exceptions
The following exceptions are only available to throw from interactive contexts. 

Code example:

```groovy
public class testingExceptionAPI extends ExtendM3Trigger {
  private final ExceptionAPI exception;
  private final MessageAPI message;

  public testingExceptionAPI(ExceptionAPI exception, MessageAPI message) {
    this.exception = exception;
	  this.message = message;
  }

  public void main() {
    String customMessage = "Failed to perform task, exception thrown";
		String messageId = message.getMessage("XC00001",[]);
    if(!doWork()) {
    	exception.throwShowOkDialogException(customMessage);
    }
		if(!doOtherWork()) {
			exception.throwShowInfoException(messageId);
		}
  }
}
```

* **throwShowOkDialogException(String message)**
	*	Throws an exception and shows dialog window with 'Ok' button.
	* Takes a custom message String as parameter.  
<br>


* **throwShowWarningDialogException(String message)**
	* Throws an exception and shows dialog window with 'Ok' and 'Cancel' buttons. 
	* If the user does not click the 'Ok' button the program will be flagged for error.
	* Intended for use during PRE PxCHK.
	* Takes a custom message String as parameter.  
<br>


* **throwShowCustomErrorException(String field, String message)**
	* Throws an exception and shows custom message to the user.
	* Sets focus on given field and flags program for error.
<br>


* **throwShowErrorException(String messageID, String field)**
	* Throws an exception and shows message window to the user.
	* Sets focus on given field and flags program for error.
	* Takes messageID String and field String as parameters, messageIDs can be fetched using the MessageAPI.
<br>


* **throwShowErrorException(String messageID, String messageData, String field)**
	* Throws an exception and shows message window to the user.
	* Sets focus on given field and flags program for error.
	* Takes messageID String, messageData String and field String as parameters, messageIDs can be fetched using the MessageAPI and messageData is for passing data to the message.
<br>


* **throwShowCustomInfoException(String message)**
	* Throws an exception and shows a custom message window to the user.
	* Takes a custom message String as parameter.
<br>


* **throwShowInfoException(String messageID)**
	* Throws an exception and shows a message window to the user.
	* Takes a messageID String as parameter, messageIDs can be fetched using the MessageAPI.
<br>


* **throwShowInfoException(String messageID, String messageData)**
	* Throws an exception and shows a message window to the user. 
	* Takes a messageID String and messageData String as parameters, messageIDs can be fetched using the MessageAPI and messageData is for passing data to the message.
<br>


### MI Response Exceptions 
These exceptions are for throwing exceptions from Transaction contexts, to indicate write error.

Code example:
```groovy
public class testingExceptionAPI extends ExtendM3Transaction {
	private final MIAPI mi;
	private final ExceptionAPI exception;

	public testingExceptionAPI(MIAPI mi, ExceptionAPI exception) {
		this.mi = mi;
		this.exception = exception;
	}

	public void main() {
		int salesPrice = mi.inData.get("INSAPR");
		int basePrice = mi.inData.get("INAIPR");
		validateData(salesPrice, basePrice);
		int profitMargin = salesPrice - basePrice;
		mi.inData.set("OUTPM");
		if(!mi.write()) {
			String message = "Failed to write MI out parameter";
			exception.throwErrorMIResponseException(message);
		}
	}

	private void validateData(int param1, int param2) {
		if(param1 == 0 || param2 == 0) {
			String message = "One or both of the given parameters have value zero.";
			exception.throwErrorMIResponseException(message);
		}
	}
}
```

* **throwErrorMIResponseException(String message)** 
	* Throws an exception and writes error response.
	* The transaction will be unable to write responses after calling this method.
<br>

* **throwErrorMIResponseException(String message, String field, String errorCode)**
	* Throws an exception and writes error response.
	* The transaction will be unable to write responses after calling this method.
	* Takes custom message String, field String and errorCode String as parameters. 
<br>

### Adaptive Exception
The adaptive exception will adapt to the situation and throw exceptions depending on the context they are being thrown from. 
For instance, an adaptive exception thrown from a Transaction extension will adapt to a ErrorMIResponseException. But the same exception thrown from a Trigger extension will adapt to a ShowOkDialogException.

* **throwAdaptiveShortCircuitException**
	* Throws an exception, depending on context.
	* Will default to ShowOkDialogException in interactive contexts and ErrorMIResponseException in noninteractive contexts.
	* Takes custom message String as parameter.