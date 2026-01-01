# UIGlassEffect

An effect object that creates a liquid glass visual effect.

@Metadata {
    @TitleHeading("Class")
    @PageColor(blue)
    @Available(iOS, introduced: "26.0")
    @Available("iPadOS", introduced: "26.0")
    @Available("Mac Catalyst", introduced: "26.0")
    @Available(tvOS, introduced: "26.0")
}

## Overview

`UIGlassEffect` creates a visual effect based on a `_UIViewGlass` object. It provides properties to configure the style, interactivity, and tint color of the effect.

> Warning: `UIGlassEffect` is a Liquid Glass element and should only be used where Liquid Glass is supported by the operating system. Otherwise, there may be runtime errors.

## Usage

You typically create a `UIGlassEffect` using the public [`effectWithStyle:`](https://developer.apple.com/documentation/uikit/uiglasseffect/init(style:)) method or the private `effectWithGlass:` class method.

```swift
private func createGlassEffect(with glass: NSObject) -> UIVisualEffect? {
    guard let glassEffectClass = NSClassFromString("UIGlassEffect") else {
        return nil
    }
    
    let selector = NSSelectorFromString("effectWithGlass:")
    
    guard glassEffectClass.responds(to: selector) else {
        return nil
    }
    
    let method = glassEffectClass.method(for: selector)
    typealias EffectWithGlassFunc = @convention(c) (AnyClass, Selector, NSObject) -> UIVisualEffect?
    let effectWithGlass = unsafeBitCast(method, to: EffectWithGlassFunc.self)
    
    return effectWithGlass(glassEffectClass, selector, glass)
}
```

## Methods

- `setStyle(_:)`: Sets the style.
- `setInteractive(_:)`: Sets whether the effect is interactive.
- `setTintColor(_:)`: Sets the tint color.

## Properties

- `style`: Returns the style.
- `isInteractive`: Returns whether the effect is interactive.
- `tintColor`: Returns the tint color.
- `glass`: Returns the glass object.

## Credits

 - [집돌이](https://x.com/_silgen_name)
