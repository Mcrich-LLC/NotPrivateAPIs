# \_actionWithContentViewController(\_:style:handler:)

@Metadata {
    @TitleHeading("Type Method")
    @PageColor(blue)
}

Create a custom `UIAlertAction` with an embedded view controller.

## Overview

`_actionWithContentViewController(_:style:handler:)` is a private initializer on `UIAlertAction` that allows you to embed a full `UIViewController` as the visual content of an alert action.

This method enables rich, interactive components (e.g. toggles, image views, or multi-line descriptions) to be inserted into the alert’s action stack. The embedded content behaves similarly to standard actions but without a text label, offering full visual customization within the bounds of the system alert.

> Warning: It is unknown when `_actionWithContentViewController(_:style:handler:)` was introduced and exactly which operating systems/versions support it. Testing is required before release into production and this method may be removed in the future.

![An example of this UI](_actionWithContentViewController-Image)
## Method

After adding the following extension, you can just call `UIAlertAction.action` to create this new type of action.
```swift
extension UIAlertAction {
    static func action(contentViewController: UIViewController, style: Style, handler: Handler? = nil) -> UIAlertAction? {
        let selector = NSSelectorFromString("_actionWithContentViewController:style:handler:")
        guard responds(to: selector) else { return nil }
        let implementation = method(for: selector)
        let method = unsafeBitCast(implementation, to: ActionWithContentViewControllerStyleHandler.self)
        return method(UIAlertAction.self, selector, contentViewController, style, handler)
    }
    private typealias ActionWithContentViewControllerStyleHandler = @convention(c) (NSObject.Type, Selector, UIViewController, Style, Handler?) -> UIAlertAction
    typealias Handler = @convention(block) (UIAlertAction) -> Void
}
```

> Note: You must still add the action to a `UIAlertController` via `addAction(_:)`. The embedded view controller’s view must also have its height explicitly defined via Auto Layout.

## Example

```swift
import UIKit

extension UIAlertAction {
    static func action(contentViewController: UIViewController, style: Style, handler: Handler? = nil) -> UIAlertAction? {
        let selector = NSSelectorFromString("_actionWithContentViewController:style:handler:")
        guard responds(to: selector) else { return nil }
        let implementation = method(for: selector)
        let method = unsafeBitCast(implementation, to: ActionWithContentViewControllerStyleHandler.self)
        return method(UIAlertAction.self, selector, contentViewController, style, handler)
    }
    private typealias ActionWithContentViewControllerStyleHandler = @convention(c) (NSObject.Type, Selector, UIViewController, Style, Handler?) -> UIAlertAction
    typealias Handler = @convention(block) (UIAlertAction) -> Void
}

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let ratingViewController = RatingViewController()
        let ratingAction = UIAlertAction.action(contentViewController: ratingViewController, style: .default) { action in
            // Do something...
        }!
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let submitAction = UIAlertAction(title: "Submit", style: .default)
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.addAction(ratingAction)
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
}
```

> Important: For simplicity, in the example above, we are force unwrapping the result of the call to `UIAlertAction.action(contentViewController:style:handler:)` - this is an awful idea. If you're going to use this in production apps, safely unwrap the optional value as, in the future, the API may change or be removed entirely, causing a crash.

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
