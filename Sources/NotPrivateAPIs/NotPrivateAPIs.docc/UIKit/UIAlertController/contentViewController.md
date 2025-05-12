# contentViewController

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(orange)
}

Embed a custom view controller inside a `UIAlertController`.

## Overview

`contentViewController` is a private property of `UIAlertController` that allows you to insert your own `UIViewController` inside the alert's main content area, beneath the title and message.

This property is used internally by Apple in various system alerts, such as permission sheets with embedded maps. Using this property enables similar custom views inside alerts, such as images, custom layout views, or complex controls.

> Warning: It is unknown when `contentViewController` was added to `UIAlertController` and exactly which operating systems/versions support it. Testing is required before release into production and `contentViewController` may be removed in the future.

![An example of this UI](contentViewController-Image)

## Method

You can access `contentViewController` through Swift’s key-value coding interface:

```swift
extension UIAlertController {
    var contentViewController: UIViewController? {
        get {
            let key = "contentViewController"
            let selector = NSSelectorFromString(key)
            guard responds(to: selector) else { return nil }
            return value(forKey: key) as? UIViewController
        } set {
            let selector = NSSelectorFromString("setContentViewController:")
            guard responds(to: selector) else { return }
            perform(selector, with: newValue)
        }
    }
}
```

This dynamic property wrapper allows you to safely interact with the undocumented `contentViewController` property at runtime.

## Example

This example demonstrates embedding a custom image view controller inside a `UIAlertController`:

```swift
class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let contentViewController = ContentViewController()
        let okAction = UIAlertAction(title: "OK", style: .default)
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.contentViewController = contentViewController
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
```

This displays a simple alert with a bold system image embedded under the title/message content area.

## Notes

- `UIAlertController` will layout the embedded content automatically, but constraints should be carefully considered.

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
