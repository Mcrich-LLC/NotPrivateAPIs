# \_UIViewGlass
The backbone of Liquid Glass

@Metadata {
    @TitleHeading("Class")
    @PageColor(blue)
    @Available(iOS, introduced: "26.0")
    @Available("iPadOS", introduced: "26.0")
    @Available("Mac Catalyst", introduced: "26.0")
    @Available(tvOS, introduced: "26.0")
}

## Overview

`_UIViewGlass` is presumably the backbone of Apple's Liquid Glass. To use it directly, you must specify a variant. Currently there are 9 variants known:

![An example of the variants](_UIViewGlass-variants)

> Warning: _UIViewGlass is a Liquid Glass element and should only be used where Liquid Glass is supported by the operating system. Otherwise, there may be runtime errors.

## Usage

To generate a `_UIViewGlass` object, you can use the function below:

```swift
public func _UIViewGlass(variant: Int) -> NSObject? {
    let glassClass = objc_lookUpClass("_UIViewGlass")! as AnyObject
    let glass = glassClass._alloc()._init(variant: 3)
    return glass as? NSObject
}

/// Registers Objective-C methods Swift needs.
fileprivate final class PrivateSelectors: NSObject {

    @objc(alloc)
    func _alloc() -> AnyObject {
        fatalError("Do not call")
    }

    @objc(initWithVariant:)
    func _init(variant: Int) -> AnyObject {
        fatalError("Do not call")
    }
}
```

## Sample Project
[집돌이](https://x.com/_silgen_name) made an incredibly useful sample project containing a UI interface to mess with these variants and properties. You can check it out [here](https://github.com/pookjw/MiscellaneousWWDC25/tree/main/MiscellaneousUIKit).

## Properties

- `variant`: The shown variant
- `smoothness`: Recommended is 1
- `tintColor`: The tint of the glass
- `highlightsDisplayAngle`: Recommended for variants 4 & 5
- `flexible`

## Credits

 - [Morris Richman](https://x.com/morrisinlife)
 - [Seb Vidal](https://x.com/SebJVidal)
 - [집돌이](https://x.com/_silgen_name)

## See Also

