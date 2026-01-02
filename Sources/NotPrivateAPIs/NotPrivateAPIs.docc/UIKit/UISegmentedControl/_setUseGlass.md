# \_setUseGlass(\_:)

Enables or disables the Liquid Glass appearance for the segmented control.

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

## Overview

This private method enables the Liquid Glass material on a `UISegmentedControl`. When enabled, the segmented control adopts the glassy appearance consistent with iOS 26's Liquid Glass design language. This works for both UIKit and SwiftUI (via `UIViewRepresentable` or appearance proxies) on UIKit devices.

> Warning: It is suspected that `_setUseGlass(_:)` was added to `UISegmentedControl` in iOS 26.0, but it is unknown exactly which operating systems/versions support it. Testing is required before release into production and `_setUseGlass(_:)` may be removed in the future.

## Demo

@TabNavigator {
    @Tab("Default") {
        ![Default segmented control](_setUseGlass-default)
    }

    @Tab("Glass") {
        ![Glass segmented control](_setUseGlass-glass)
    }
}

## Example

You can access this method using `perform(_:with:)`.

```swift
let segmentedControl = UISegmentedControl(items: ["One", "Two", "Three"])
segmentedControl.perform(NSSelectorFromString("_setUseGlass:"), with: true)
```

## Setting all UISegmentedControls to use glass

To set all `UISegmentedControl` instances to use glass, you can use the following code:

```swift
UISegmentedControl.appearance().perform(NSSelectorFromString("_setUseGlass:"), with: true)
```

## Credits

 - [ビスター(Vistar)](https://x.com/Lmssync)
