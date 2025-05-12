# setAlternateIconName(\_:completionHandler:)

@Metadata {
    @TitleHeading("Instance Method")
    @Available(iOS, introduced: "10.3")
    @Available("iPadOS", introduced: "10.3")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS, introduced: "10.2")
    @Available(visionOS, introduced: "1.0")
    @PageColor(red)
}

Set an alternate app icon without an alert

## Overview

`setAlternateIconName(_:completionHandler:)` is a completely private function in UIKit which is actually responsible for setting an app's alternate icon. According to [Bryce Bostwick](https://bryce.co), this is called down the chain by [`_setAlternateIconName(_:completionHandler:)`](<doc:_setAlternateIconName>).

> Note: We think that it is important to note that Bostwick also discovered that `setAlternateIconName(_:completionHandler:)` ultimately calls the function `setAlternateIconName(_:completionHandler:)` in the completely private class called LSApplicationProxy.

> Warning: It is unknown when `setAlternateIconName(_:completionHandler:)` became the backbone of `setAlternateIconName(_:completionHandler:)` and exactly which operating systems/versions support it. Testing is required before release into production and `setAlternateIconName(_:completionHandler:)` may be removed in the future. 

> Note: Given that `setAlternateAppIcon(_:completionHandler:)` in `UIApplication` was added in iOS 10.3, we can speculate that it supports iOS 10.3+ 

For more information, watch Bostwick's [video](https://www.youtube.com/watch?v=KDVibKGtSVI) on the subject.

## Adding the Function to Swift

To make swift recognize this function, just bridge it with Objective-C. To do so, create a `LSApplicationProxy.h` file with the following code: 
```objc
#import <Foundation/Foundation.h>

@interface LSApplicationProxy: NSObject

- (void)setAlternateIconName:(nullable NSString *)name
                  withResult:(void (^_Nonnull)(BOOL success, NSError *_Nullable))result;

@end
```
Then, add the following  to a [bridging header file](https://developer.apple.com/documentation/swift/importing-objective-c-into-swift) (you may need to create one):
```objc
#import "LSApplicationProxy.h"
```

## Method

We can use roughly the same code as if we were using the public version of this API in [`UIApplication`](<doc:UIApplication>):
```swift
let appProxy: LSApplicationProxy = LSBundleProxy.bundleProxyForCurrentProcess()
appProxy.setAlternateIconName(iconName) { success, error in
    if !success || error != nil {
        print("Error: \(error as Any)")
        return
    }
}
```
As seen above, this function also requires the use of [`LSBundleProxy`](<doc:LSBundleProxy>) and [`bundleProxyForCurrentProcess()`](<doc:bundleProxyForCurrentProcess>).

> Important: It is critical to note that unlike other variations of this function, `LSApplicationProxy` requires that the completion handler have a bool value first. This is assumed to be if the operation succeeded or not.

## Credits

 - [Bryce Bostwick](https://bryce.co)

## See Also

- <doc:LSBundleProxy>
- <doc:bundleProxyForCurrentProcess>
- <doc:_setAlternateIconName>
