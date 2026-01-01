# UIImage
An object that manages image data in your app.

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "2.0")
    @Available("iPadOS", introduced: "2.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS)
    @Available(visionOS, introduced: "1.0")
    @Available(watchOS, introduced: "2.0")
    @PageColor(blue)
}

## Overview

You use image objects to represent image data of all kinds, and the [`UIImage`](https://developer.apple.com/documentation/uikit/uiimage) class is capable of managing data for all image formats supported by the underlying platform. Image objects are immutable, so you always create them from existing image data, such as an image file on disk or programmatically created image data. An image object may contain a single image or a sequence of images for use in an animation.

You can use image objects in several different ways:
- Assign an image to a [`UIImageView`](https://developer.apple.com/documentation/uikit/uiimageview) object to display the image in your interface.
- Use an image to customize system controls such as buttons, sliders, and segmented controls.
- Draw an image directly into a view or other graphics context.
- Pass an image to other APIs that might require image data.

Although image objects support all platform-native image formats, it’s recommended that you use PNG or JPEG files for most images in your app. Image objects are optimized for reading and displaying both formats, and those formats offer better performance than most other image formats. Because the PNG format is lossless, it’s especially recommended for the images you use in your app’s interface.

Full Documentation [Here](https://developer.apple.com/documentation/uikit/uiimage)

## Topics

- <doc:_systemImageNamed>
