# \_systemImageNamed(\_:withConfiguration:allowPrivate:)

Creates a system symbol image with the specified name, configuration, and private access.

@Metadata {
    @TitleHeading("Type Method")
    @PageColor(red)
}

## Overview

This private method allows you to load system images (SF Symbols), including private symbols that are normally not accessible via the public `systemImage(named:)` API. See [PrivateSymbols](https://github.com/quentinfasquel/PrivateSymbols) for discovering private symbols.

> Warning: It is unknown when `_systemImageNamed(_:withConfiguration:allowPrivate:)` was added to `UIImage` and exactly which operating systems/versions support it. Testing is required before release into production and `_systemImageNamed(_:withConfiguration:allowPrivate:)` may be removed in the future.

### Parameters

- `name`: The name of the system symbol to load.
- `configuration`: An optional `UIImage.SymbolConfiguration` to apply to the image.
- `allowPrivate`: A boolean indicating whether to allow loading of private symbols. Set this to `true` to access private symbols.

## Example

You can access this method using `unsafeBitCast` to bypass the private API restriction.

```swift
import UIKit

extension UIImage {
    static func privateSymbol(named name: String) -> UIImage? {
        let selector = NSSelectorFromString("_systemImageNamed:withConfiguration:allowPrivate:")
        
        guard responds(to: selector) else { return nil }
        
        // Define the function type matching the objective-c selector signature
        let type = (@convention(c) (AnyClass, Selector, String, UIImage.SymbolConfiguration?, Bool) -> UIImage?).self
        let implementation = UIImage.method(for: selector)
        let method = unsafeBitCast(implementation, to: type)
        
        // Call the method with allowPrivate set to true
        return method(UIImage.self, selector, name, nil, true)
    }
}
```

Then you simply use it like this:
```swift
let image = UIImage.privateSymbol(named: "apple.visual.intelligencess")
```

## Credits

 - [Seb Vidal](https://twitter.com/sebvidal_)
