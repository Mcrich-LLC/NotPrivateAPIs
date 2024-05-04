# variableBlur(maxRadius: CGFloat, mask: Image, opaque: Bool)

@Metadata {
    @TitleHeading("Instance Method")
}

Apply a variable blur overlay to a view.

## Overview

Modify a view to have variable layers of blur.

![An example of this UI](SwiftUI-variableBlur-Image)

> Important: SwiftUI already has the symbols for a variable blur modifier, they can be found at link time. you just need to add some stubs to the *.swiftinterface files. See Sam Henry Gold's [Tweet](https://twitter.com/samhenrigold/status/1786399498308059482) for more information or use [SwiftUI-HiddenApi](https://github.com/Wouter01/SwiftUI-HiddenAPI?tab=readme-ov-file)

## Modifier

We can use this code to add the blur effect:
```swift
.variableBlur(maxRadius: 8, mask: Image ("maskGradient"), opaque: false)
```

## Example

Here is a full example of this implementation:
```swift
struct ContentView: View {
    @State private var notifyMeAbout: NotifyMeAboutType = .anything
    @State private var playNotificationSounds = false
    @State private var sendReadReceipts = false
    @State private var profileImageSize: ProfileImageSize = .small

    var body: some View {
        NavigationStack {
            Form｛•••｝
        }
        .variableBlur(maxRadius: 8, mask: Image ("maskGradient"), opaque: false)
        .ignoresSafeArea()
    }
}
```
