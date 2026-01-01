# _setNonLargeBackground(\_:) 

Sets the background view for non-large detents.

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

## Overview

This private method allows you to set a custom background view that is displayed when the sheet is in a "non-large" detent (e.g., medium).

> Warning: It is unknown when `_setNonLargeBackground(_:)` was added to `UISheetPresentationController` and exactly which operating systems/versions support it. Testing is required before release into production and `_setNonLargeBackground(_:)` may be removed in the future.

### Parameters

- `object`: The background view to display. This can be a `UIColor` or a `_UIViewGlass` (See <doc:Liquid-Glass>).

## Example

You call this method using `perform(_:with:)` on the `UISheetPresentationController` instance.

```swift
// Example: Setting a glass background for non-large detents
let glassView = _UIViewGlass(variant: 4)
sheetPresentationController.perform(NSSelectorFromString("_setNonLargeBackground:"), with: glassView)
```

## Credits

 - [Seb Vidal](https://twitter.com/sebvidal_)
