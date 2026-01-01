# ``NotPrivateAPIs``

@Metadata {
    @DisplayName("NotPrivateAPIs")
    @TitleHeading("Tool")
    @PageColor(purple)
}

Totally Not Uncovering Private Apis

## Overview

NotPrivateAPIs is _**not**_ a project to document Apple's Private Apis and publish what Apple will not.

## What is a Private API?

A private api is an api that a platform (in this case Apple) creates but attempts to hide from standard developers. This can be for a multitude of reasons including instability, volitilaty, and/or impending breaking changes.

**BUT** a private api can also be powerful. If the world is your oyster, private apis make the galaxy your oyster. They can be very powerful and do a multitude of things. In the case of Apple, most of these should be public apis instead of private.

## Obfuscating Private API Usage

You may be wondering why do I need to obfuscate my usage of private apis?

This is because Apple does a basic analysis of your code and if they see any of these private apis in plain text, it will be rejected from the App Store. Therefore, what we must do instead is obfuscate our code.

There are many methods to obfuscate code, but two very good ones are array splitting and base64 encoding.

### Array Splitting

Most of the time, static code analysis is for pure strings, something arrays are not detected as. Therefore, when desired, an easy obfuscation method to implement is Array Splitting.

Array Splitting is very simple. If we want to obfuscate the string `"Hello World!"`, we simply break it up: 
```swift
["H", "e", "l", "l", "o", " ", "W", "o", "r", "l", "d", "!"].joined()
```
In addition to being tedious to type, if Apple were to change their static analysis, this would be very easy to detect.

### Base64 Encoding

Base64 is a bit better for obfuscation, because it is not standard plain text in code. Base64 is instead the characters encoded as data to make it slightly more difficult and time consuming to read back.

If we take the same example string as before: `"Hello World!"` and [encode](https://www.base64encode.org) it with base64, it becomes 
```
"SGVsbG8gV29ybGQh"
```

However, this can be very tedious to encode to. Luckily, [Morris Richman](https://twitter.com/morrisinlife) created [PrivateObfuscationMacro](https://github.com/Mcrich23/PrivateObfuscationMacro) to handle this for you.

## PrivateObfuscationMacro

[PrivateObfuscationMacro](https://github.com/Mcrich23/PrivateObfuscationMacro) is very simple to use. Just import the package, enable the macro, and where obfuscation is desired, call `#arrayEncoded("foo")` or `#base64Encoded("foo")` and replace `foo` with your own string. 

At compile time, PrivateObfuscationMacro will do the heavy lifting for you and convert it to one of these methods but stil allow you to pass it to functions as a string at runtime.


## Topics

### UIKit

- <doc:Liquid-Glass>
- <doc:LSApplicationProxy>
- <doc:LSBundleProxy>
- <doc:UIAlertController>
- <doc:UIApplication>
- <doc:UIMenu>
- <doc:UINavigationBar>
- <doc:UINavigationItem>
- <doc:UITextView>
- <doc:UIImage>
- <doc:UINavigationController>
- <doc:UISheetPresentationController>

### SwiftUI

- <doc:Image>
- <doc:ViewModifier>

### NSObject

- <doc:ByDevice>
