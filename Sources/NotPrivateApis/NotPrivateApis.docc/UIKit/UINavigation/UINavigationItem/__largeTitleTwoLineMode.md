# \_ \_largeTitleTwoLineMode 
Multiple lines for a `UINavigationItem`

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(green)
}

## Overview

You can achieve this two line large title in your navigation bar very easily with this extension of [`UINavigationItem`](<doc:UINavigationItem>).

> Warning: It is unknown when `__largeTitleTwoLineMode` was added to `UINavigationItem` and exactly which operating systems/versions support it. Testing is required before release into production and `__largeTitleTwoLineMode` may be removed in the future.

![An example of this UI](__largeTitleTwoLineMode-Image)

## Extension

Here is the mentioned extension:
```swift
import UIKit

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

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
