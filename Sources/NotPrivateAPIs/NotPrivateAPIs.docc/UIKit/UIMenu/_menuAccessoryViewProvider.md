# \_menuAccessoryViewProvider

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(blue)
}

Enhance your context menu previews with accessory views.

## Overview

`_menuAccessoryViewProvider` is a private property on `UIContextMenuConfiguration` that allows you to add a persistent accessory view alongside your context menu preview.

This API was recently covered by [Seb Vidal](https://x.com/SebJVidal) in his blog post [*Accessorise Your Context Menu Interactions*](https://sebvidal.com/blog/accessorise-your-context-menu-interactions/). For a full explainer and example, click here: https://sebvidal.com/blog/accessorise-your-context-menu-interactions/

> Warning: It is unknown when `_menuAccessoryViewProvider` was introduced and exactly which operating systems/versions support it. Testing is required before release into production, and `_menuAccessoryViewProvider` may be removed in the future.

![An example of this UI](_menuAccessoryViewProvider-Image)
## Method

You can assign a block that returns a `UIView` to `_menuAccessoryViewProvider` using dynamic member lookup in Swift.

```swift
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interaction = UIContextMenuInteraction(delegate: self)
        view.addInteraction(interaction)
    }
}

extension ViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                                 configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: {
            let label = UILabel()
            label.text = "Preview Content"
            label.textAlignment = .center
            label.backgroundColor = .systemGray5
            return label
        }, actionProvider: { _ in
            return UIMenu(title: "", children: [])
        })
        
        // Define the accessory view provider block
        let accessoryViewProvider: @convention(block) () -> UIView = {
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.startAnimating()
            return indicator
        }
        
        // Use dynamic member lookup to set the private property
        let configObject = configuration as AnyObject
        let selector = NSSelectorFromString("_setMenuAccessoryViewProvider:")
        if configObject.responds(to: selector) {
            configObject.perform(selector, with: accessoryViewProvider)
        }
        
        return configuration
    }
}
```

## Example

For a complete project example, check out [Seb Vidal](https://x.com/SebJVidal)'s [GitHub Repository](https://github.com/sebjvidal/_UIContextMenuAccessoryView-Demo)
