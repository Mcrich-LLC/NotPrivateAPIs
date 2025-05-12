# UIAlertController

@Metadata {
    @TitleHeading("Class")
    @Available(iOS, introduced: "8.0")
    @Available("iPadOS", introduced: "8.0")
    @Available("Mac Catalyst", introduced: "13.1")
    @Available(tvOS, introduced: "9.0")
    @Available(visionOS, introduced: "1.0")
    @PageColor(blue)
}
An object that displays an alert message.

## Overview
Use this class to configure alerts and action sheets with the message that you want to display and the actions from which to choose. After configuring the alert controller with the actions and style you want, present it using the [`present(_:animated:completion:)`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621380-present) method. UIKit displays alerts and action sheets modally over your app’s content.
In addition to displaying a message to a user, you can associate actions with your alert controller to give people a way to respond. For each action you add using the [`addAction(_:)`](https://developer.apple.com/documentation/uikit/uialertcontroller/1620094-addaction) method, the alert controller configures a button with the action details. When a person taps that action, the alert controller executes the block you provided when creating the action object. The following code shows how to configure an alert with a single action.
```swift
let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert) 
alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in 
NSLog("The \"OK\" alert occured.")
}))
self.present(alert, animated: true, completion: nil)
```
When configuring an alert with the [`UIAlertController.Style.alert`](https://developer.apple.com/documentation/uikit/uialertcontroller/style/alert) style, you can also add text fields to the alert interface. The alert controller lets you provide a block for configuring your text fields prior to display. The alert controller maintains a reference to each text field so that you can access its value later.

Full Documentation [Here](https://developer.apple.com/documentation/uikit/UIAlertController)

## Topics

- <doc:_setHeaderContentViewController>
- <doc:contentViewController>
