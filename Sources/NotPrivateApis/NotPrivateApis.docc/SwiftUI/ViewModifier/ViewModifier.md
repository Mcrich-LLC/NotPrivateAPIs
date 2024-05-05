# ViewModifier

@Metadata {
    @TitleHeading("Protocol")
    @Available(iOS, introduced: "13.0")
    @Available("iPadOS", introduced: "13.0")
    @Available(macOS, introduced: "10.15")
    @Available("Mac Catalyst", introduced: "13.0")
    @Available(tvOS, introduced: "13.0")
    @Available(watchOS, introduced: "6.0")
    @Available(visionOS, introduced: "1.0")
    @PageColor(orange)
}
A modifier that you apply to a view or another view modifier, producing a different version of the original value.

## Overview
Adopt the [`ViewModifier`](https://developer.apple.com/documentation/swiftui/viewmodifier) protocol when you want to create a reusable modifier that you can apply to any view. The example below combines several modifiers to create a new modifier that you can use to create blue caption text surrounded by a rounded rectangle:
```swift
struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}
```
You can apply [`modifier(_:)`](https://developer.apple.com/documentation/swiftui/view/modifier\(_:\)) directly to a view, but a more common and idiomatic approach uses [`modifier(_:)`](https://developer.apple.com/documentation/swiftui/view/modifier\(_:\)) to define an extension to [`View`](https://developer.apple.com/documentation/swiftui/view) itself that incorporates the view modifier:
```swift
extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
```
You can then apply the bordered caption to any view, similar to this:
```swift
Image(systemName: "bus")
    .resizable()
    .frame(width:50, height:50)
Text("Downtown Bus")
    .borderedCaption()
```
![A screenshot showing the image of a bus with a caption reading Downtown Bus](ViewModifier-Image)

Full Documentation [Here](https://developer.apple.com/documentation/swiftui/ViewModifier)

## Topics

- <doc:variableBlur>
