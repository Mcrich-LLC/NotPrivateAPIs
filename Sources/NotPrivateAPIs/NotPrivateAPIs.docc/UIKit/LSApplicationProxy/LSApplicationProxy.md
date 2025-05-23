# LSApplicationProxy

@Metadata {
    @TitleHeading("Class")
    @PageColor(blue)
}

## Overview

Not much is known about `LSApplicationProxy`, but it seems to manage many components of application sandboxing and appearance. An instance of it can be generated by [`LSBundleProxy`](<doc:LSBundleProxy>) with the function [`bundleProxyForCurrentProcess()`](<doc:bundleProxyForCurrentProcess>).

> Important: `LSApplicationProxy` is not available until runtime. Adding the following linker flag in the build settings will alleviate this issue: `-Wl,-U,_OBJC_CLASS_$_LSBundleProxy`

## Topics

- <doc:setAlternateIconName>

## Credits

 - [Bryce Bostwick](https://bryce.co)

## See Also

- <doc:LSBundleProxy>
- <doc:setAlternateIconName>
- <doc:_setAlternateIconName>
