# _setLargeBackground(\_:)

Sets the background view for large detents.

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

## Overview

This private method allows you to set a custom background view that is displayed when the sheet is in a "large" detent.

> Warning: It is unknown when `_setLargeBackground(_:)` was added to `UISheetPresentationController` and exactly which operating systems/versions support it. Testing is required before release into production and `_setLargeBackground(_:)` may be removed in the future.

### Parameters

- `object`: The background view to display. This can be a `UIColor` or a `_UIViewGlass` (See <doc:Liquid-Glass>).

## Example

You call this method using `perform(_:with:)` on the `UISheetPresentationController` instance.

```swift
// Example: Setting a glass background for large detents
let glassView = _UIViewGlass(variant: 4)
sheetPresentationController.perform(NSSelectorFromString("_setLargeBackground:"), with: glassView)
```

## Credits

 - [Seb Vidal](https://twitter.com/sebvidal_)
