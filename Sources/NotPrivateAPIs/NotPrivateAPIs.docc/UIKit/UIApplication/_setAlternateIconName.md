# \_setAlternateIconName(\_:completionHandler:)

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

`_setAlternateAppIcon(_:completionHandler:)` is a completely private function in UIKit which is actually responsible for setting an app's alternate icon. According to [Bryce Bostwick](https://bryce.co), the typical `setAlternateAppIcon(_:completionHandler:)` just calls `_setAlternateAppIcon(_:completionHandler:)` and then adds the alert into the handling flow. 

> Note: We think that it is important to note that Bostwick also discovered that `_setAlternateAppIcon(_:)` ultimately calls the function `setAlternateIconName(_:completionHandler:)` in the completely private class called LSApplicationProxy.

> Warning: It is unknown when `_setAlternateAppIcon(_:completionHandler:)` became the backbone of `setAlternateAppIcon(_:completionHandler:)` and exactly which operating systems/versions support it. Testing is required before release into production and `_setAlternateAppIcon(_:completionHandler:)` may be removed in the future. 

> Note: Given that `setAlternateAppIcon(_:completionHandler:)` was added in iOS 10.3, we can speculate that it supports iOS 10.3+ 

For more information, watch Bostwick's [video](https://www.youtube.com/watch?v=KDVibKGtSVI) on the subject.

See the full documentation on [`setAlternateAppIcon(_:completionHandler:)`](https://developer.apple.com/documentation/uikit/uiapplication/2806818-setalternateiconname)

## Adding the Function to Swift

To make swift recognize this function, just bridge it with Objective-C. To do so, create a `UIApplication+Private.h` file with the following code: 
```objc
#indef UIApplication_Private_h
#define UIApplication_Private_h

@import UIKit;

@interface UIApplication (Private)

- (void)_setAlternateIconName:(NSString *)alternateIconName
           completionHandler:(void (^)(NSError *error))completionHandler;
@end

#endif
```
Then, add the following  to a [bridging header file](https://developer.apple.com/documentation/swift/importing-objective-c-into-swift) (you may need to create one):
```objc
#import "UIApplication+Private.h"
```

## Method

We can use roughly the same code as if we were using the public version of this API:
```swift
UIApplication.shared._setAlternateIconName(“AppIcon-2”) { error in
    print(“Error to set alternate icons:- \(error?.localizedDescription)”)
}
```

## Credits

 - [Bryce Bostwick](https://bryce.co)

## See Also

- <doc:setAlternateIconName>
- <doc:LSApplicationProxy>
- <doc:LSBundleProxy>
