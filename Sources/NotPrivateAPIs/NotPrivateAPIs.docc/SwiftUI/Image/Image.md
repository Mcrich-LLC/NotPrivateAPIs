# Image
A view that displays an image.

@Metadata {
    @TitleHeading("Structure")
    @Available(iOS, introduced: "13.0")
    @Available("iPadOS", introduced: "13.0")
    @Available("Mac Catalyst", introduced: "13.0")
    @Available("macOS", introduced: "10.15")
    @Available(tvOS, introduced: "13.0")
    @Available(visionOS, introduced: "1.0")
    @Available(watchOS, introduced: "6.0")
    @PageColor(blue)
}

## Overview

Use an `Image` instance when you want to add images to your SwiftUI app. You can create images from many sources:

- Image files in your app’s asset library or bundle. Supported types include PNG, JPEG, HEIC, and more.
- Instances of platform-specific image types, like [`UIImage`](https://developer.apple.com/documentation/UIKit/UIImage) and [`NSImage`](https://developer.apple.com/documentation/AppKit/NSImage).
- A bitmap stored in a Core Graphics [`CGImage`](https://developer.apple.com/documentation/CoreGraphics/CGImage) instance.
- System graphics from the SF Symbols set.

The following example shows how to load an image from the app’s asset library or bundle and scale it to fit within its container:

```swift
Image("Landscape_4")
    .resizable()
    .aspectRatio(contentMode: .fit)
Text("Water wheel")
```

Full Documentation [Here](https://developer.apple.com/documentation/swiftui/image)

## Topics

### Initializers

- <doc:init_internalSystemName>
