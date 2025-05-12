# LSBundleProxy

@Metadata {
    @TitleHeading("Class")
    @PageColor(blue)
}

## Overview

Not much is known about `LSBundleProxy`, but it seems to manage components of application sandboxing and appearance. With the function [`bundleProxyForCurrentProcess`](<doc:bundleProxyForCurrentProcess>), `LSBundleProxy` can generate instances of [`LSApplicationProxy`](<doc:LSApplicationProxy>).

> Important: `LSBundleProxy` is not available until runtime. Adding the following linker flag in the build settings will alleviate this issue: `-Wl,-U,_OBJC_CLASS_$_LSBundleProxy`

## Topics

- <doc:bundleProxyForCurrentProcess>

## Credits

 - [Bryce Bostwick](https://bryce.co)

## See Also

- <doc:LSApplicationProxy>
- <doc:setAlternateIconName>
- <doc:_setAlternateIconName>
