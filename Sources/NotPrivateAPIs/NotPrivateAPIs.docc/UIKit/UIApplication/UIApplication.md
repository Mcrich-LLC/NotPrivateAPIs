# UIApplication

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "2.0")
    @Available("iPadOS", introduced: "2.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}
An object that displays an alert message.

## Overview

Every iOS app has exactly one instance of UIApplication (or, very rarely, a subclass of UIApplication). When an app launches, the system calls the [`UIApplicationMain(_:_:_:_:)`](https://developer.apple.com/documentation/uikit/1622933-uiapplicationmain) function. Among its other tasks, this function creates a singleton UIApplication object that you access using [`shared`](https://developer.apple.com/documentation/uikit/uiapplication/1622975-shared).

Your app’s application object handles the initial routing of incoming user events. It dispatches action messages forwarded to it by control objects (instances of the [`UIControl`](https://developer.apple.com/documentation/uikit/uicontrol) class) to appropriate target objects. The application object maintains a list of open windows ([`UIWindow`](https://developer.apple.com/documentation/uikit/uiwindow) objects), which it can use to retrieve any of the app’s [`UIView`](https://developer.apple.com/documentation/uikit/uiview) objects.

The [`UIApplication`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate) class defines a delegate that conforms to the UIApplicationDelegate protocol and must implement some of the protocol’s methods. The application object informs the delegate of significant runtime events—for example, app launch, low-memory warnings, and app termination—giving it an opportunity to respond appropriately.

Apps can cooperatively handle a resource, such as an email or an image file, through the [`open(_:options:completionHandler:)`](https://developer.apple.com/documentation/uikit/uiapplication/1648685-open) method. For example, an app that calls this method with an email URL causes the Mail app to launch and display the message.

The APIs in this class allow you to manage device-specific behavior. Use your UIApplication object to do the following:

- Temporarily suspend incoming touch events ([`beginIgnoringInteractionEvents()`](https://developer.apple.com/documentation/uikit/uiapplication/1623047-beginignoringinteractionevents)\)
- Register for remote notifications ([`registerForRemoteNotifications()`](https://developer.apple.com/documentation/uikit/uiapplication/1623078-registerforremotenotifications)\)
- Trigger the undo-redo UI ([`applicationSupportsShakeToEdit`](https://developer.apple.com/documentation/uikit/uiapplication/1623127-applicationsupportsshaketoedit)\)
- Determine whether there is an installed app registered to handle a URL scheme ([`canOpenURL(_:)`](https://developer.apple.com/documentation/uikit/uiapplication/1622952-canopenurl)\)
- Extend the execution of the app so that it can finish a task in the background ([`beginBackgroundTask(expirationHandler:)`](https://developer.apple.com/documentation/uikit/uiapplication/1623031-beginbackgroundtask) and [`beginBackgroundTask(withName:expirationHandler:)`](https://developer.apple.com/documentation/uikit/uiapplication/1623051-beginbackgroundtask)\)
- Schedule and cancel local notifications ([`scheduleLocalNotification(_:)`](https://developer.apple.com/documentation/uikit/uiapplication/1623005-schedulelocalnotification) and [`cancelLocalNotification(_:)`](https://developer.apple.com/documentation/uikit/uiapplication/1623082-cancellocalnotification)\)
- Coordinate the reception of remote-control events ([`beginReceivingRemoteControlEvents()`](https://developer.apple.com/documentation/uikit/uiapplication/1623126-beginreceivingremotecontrolevent) and [`endReceivingRemoteControlEvents()`](https://developer.apple.com/documentation/uikit/uiapplication/1623057-endreceivingremotecontrolevents)\)
- Perform app-level state restoration tasks (methods in the [Managing state restoration](https://developer.apple.com/documentation/uikit/uiapplication#1657552) task group)

Full Documentation [Here](https://developer.apple.com/documentation/uikit/UIAlertController)

## Topics

- <doc:_setAlternateIconName>
