# UISheetPresentationController
A presentation controller that manages the appearance and behavior of a sheet.

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "15.0")
    @Available("iPadOS", introduced: "15.0")
    @Available("Mac Catalyst", introduced: "15.0")
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}

## Overview

[`UISheetPresentationController`](https://developer.apple.com/documentation/uikit/uisheetpresentationcontroller) lets you present your view controller as a sheet. Before you present your view controller, configure the sheet presentation controller in its [`sheetPresentationController`](https://developer.apple.com/documentation/uikit/uiviewcontroller/sheetpresentationcontroller) property with the behavior and appearance you want for your sheet.
```swift
// In a subclass of UIViewController, customize and present the sheet.
func showMyViewControllerInACustomizedSheet() {
    let viewControllerToPresent = MyViewController()
    if let sheet = viewControllerToPresent.sheetPresentationController {
        sheet.detents = [.medium(), .large()]
        sheet.largestUndimmedDetentIdentifier = .medium
        sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        sheet.prefersEdgeAttachedInCompactHeight = true
        sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
    }
    present(viewControllerToPresent, animated: true, completion: nil)
}
```
Sheet presentation controllers specify a sheet’s size based on a _detent_, a height where a sheet naturally rests. Detents allow a sheet to resize from one edge of its fully expanded frame while the other three edges remain fixed. You specify the detents that a sheet supports using [`detents`](https://developer.apple.com/documentation/uikit/uisheetpresentationcontroller/detents), and monitor its most recently selected detent using [`selectedDetentIdentifier`](https://developer.apple.com/documentation/uikit/uisheetpresentationcontroller/selecteddetentidentifier).

Full Documentation [Here](https://developer.apple.com/documentation/uikit/uisheetpresentationcontroller)

## Topics

- <doc:_setLargeBackground>
- <doc:_setNonLargeBackground>

## Credits

 - [Seb Vidal](https://twitter.com/sebvidal_)
