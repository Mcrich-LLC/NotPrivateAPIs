# \_ \_largeTitleTwoLineMode 
Multiple lines for a `UINavigationItem`

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(green)
}

## Overview

You can achieve this two line large title in your navigation bar very easily with this extension of UINavigationItem.

![An example of this UI](__largeTitleTwoLineMode-Image)

## Extension

Here is the mentioned extension:
```swift
extension UINavigationItem {
    var largeTitleTwoLineMode: Int {
        get {
            value (forKey: "__largeTitleTwoLineMode") as? Int ?? 0
        } set { 
            setValue (newValue, forkey: "__largeTitleTwoLineMode")
        }
    }
}
```
