# bundleProxyForCurrentProcess()

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

Get the current `LSApplicationProxy`.

## Overview

According to [Bryce Bostwick](https://bryce.co), this function gets the current [`LSApplicationProxy`](<doc:LSApplicationProxy>).

> Warning: It is unknown when `bundleProxyForCurrentProcess()` was added to Apple's platforms and exactly which operating systems/versions support it. Testing is required before release into production and `bundleProxyForCurrentProcess()` may be removed in the future. 

For more information, watch Bostwick's [video](https://www.youtube.com/watch?v=KDVibKGtSVI) on the subject.

## Adding the Function to Swift

To make swift recognize this function, just bridge it with Objective-C. To do so, create a `LSBundleProxy.h` file with the following code: 
```objc
#import <Foundation/Foundation.h>

@interface LSBundleProxy: NSObject

+ (nonnull LSApplicationProxy *)bundleProxyForCurrentProcess;

@end
```
Then, add the following  to a [bridging header file](https://developer.apple.com/documentation/swift/importing-objective-c-into-swift) (you may need to create one):
```objc
#import "LSBundleProxy.h"
```

## Method

We can create this constant to retrieve the [`LSApplicationProxy`](<doc:LSApplicationProxy>):
```swift
let appProxy: LSApplicationProxy = LSBundleProxy.bundleProxyForCurrentProcess()
```

## See Also

- <doc:LSApplicationProxy>
- <doc:setAlternateIconName>
- <doc:_setAlternateIconName>
