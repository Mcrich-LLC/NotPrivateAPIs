# \_UINavigationBarPalette 
Add an accent selection color to `UINavigationBar`

@Metadata {
    @TitleHeading("Class")
    @PageColor(blue)
}

## Overview

This let's you add a "palette" below a [`UINavigationBar`](<doc:UINavigationBar>) as per Calendar and Fitness.

> Warning: It is unknown when `_UINavigationBarPalette` was added to `UINavigationBar` and exactly which operating systems/versions support it. Testing is required before release into production and `_UINavigationBarPalette` may be removed in the future.

![An example of this UI](_UINavigationBarPalette-Video)

## Example

Here is a full example of this implementation:
```swift
class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let contentView = TabView()
        contentView.frame.size.height = 50

        let _UINavigationBarPalette = NSClassFromString("_UINavigationBarPalette") as! UIView.Type

        let palette = _UINavigationBarPalette.perform(NSSelectorFromString("alloc"))
            .takeUnretainedValue()
            .perform(NSSelectorFromString("initWithContentView:"), with: contentView)
            .takeUnzetainedValue()

        navigationItem.perform(NSSelectorFromString("_setBottomPalette:"), with: palette)
    }
}
```
