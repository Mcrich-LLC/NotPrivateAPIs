# \_separatedHeaderContentViewController(\_:)

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

Use a separate view controller as a custom header for your alert content.

## Overview

`_separatedHeaderContentViewController(_:)` is a private property of `UIAlertController` that allows you to assign a custom `UIViewController` to act as a header above the alert's main content.

Unlike the public `setValue(_:forKey:)` approach for modifying `title` and `message`, this API lets you embed fully custom layouts — including images, labels, or any UIKit view — above the system alert buttons and actions, without needing to subclass or reimplement the entire alert.

> Warning: It is unknown when `_separatedHeaderContentViewController(_:)` was introduced and exactly which operating systems/versions support it. Testing is required before release into production and this property may be removed in the future.

![An example of this UI](_separatedHeaderContentViewController-Image)

## Example

```swift
import UIKit

extension UIAlertController {
    var separatedHeaderContentViewController: UIViewController? {
        get {
            let key = "_separatedHeaderContentViewController"
            let selector = NSSelectorFromString(key)
            guard responds(to: selector) else { return nil }
            return value(forKey: key) as? UIViewController
        } set {
            let selector = NSSelectorFromString("_setSeparatedHeaderContentViewController:")
            guard responds(to: selector) else { return }
            perform(selector, with: newValue)
        }
    }
}

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let separatedHeaderContentViewController = SeparatedHeaderContentViewController()
        let okAction = UIAlertAction(title: "OK", style: .default)
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alertController.separatedHeaderContentViewController = separatedHeaderContentViewController
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
```

## Notes

- `UIAlertController` still performs internal layout of this custom view controller.
- The height of the header must be explicitly set via constraints.
- Best results are seen with `.alert` style rather than `.actionSheet`.

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
