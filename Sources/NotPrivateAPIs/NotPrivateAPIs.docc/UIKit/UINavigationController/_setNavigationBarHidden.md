# \_setNavigationBarHidden(\_:edge:duration:)

Hides or shows the navigation bar with a specified animation edge and duration.

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

## Overview

This private method allows you to animate the hidden state of the navigation bar with a specific edge animation and duration, offering more control than the standard `setNavigationBarHidden(_:animated:)`.

> Warning: It is suspected that `_setNavigationBarHidden(_:edge:duration:)` was added to `UINavigationController` in iOS 26.0, but it is unknown exactly which operating systems/versions support it. Testing is required before release into production and `_setNavigationBarHidden(_:edge:duration:)` may be removed in the future.

### Parameters

- `hidden`: A Boolean value indicating whether the navigation bar should be hidden.
- `edge`: An integer representing the edge for the animation (e.g., `15`).
- `duration`: The duration of the animation in seconds.

## Demo
@TabNavigator {
    @Tab("With Edge Animation") {
        ![Toolbar before adopting Liquid Glass](_setNavigationBarHidden-edge.gif)
    }

    @Tab("Without Edge Animation") {
        ![Toolbar after adopting Liquid Glass](_setNavigationBarHidden-fade.gif)
    }
}

## Example

You can access this method using `unsafeBitCast`.

```swift
extension UINavigationController {
    func setNavigationBarHidden(_ hidden: Bool, edge: Int, duration: TimeInterval) {
        let selector = NSSelectorFromString("_setNavigationBarHidden:edge:duration:")
        
        guard responds(to: selector) else { return }
        
        let type = (@convention(c) (UINavigationController, Selector, Bool, Int, TimeInterval) -> Void).self
        let implementation = method(for: selector)
        let method = unsafeBitCast(implementation, to: type)
        
        method(self, selector, hidden, edge, duration)
    }
}
```

## Credits

 - [Seb Vidal](https://twitter.com/sebvidal_)
