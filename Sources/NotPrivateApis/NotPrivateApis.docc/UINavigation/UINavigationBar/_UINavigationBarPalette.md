# \_UINavigationBarPalette 
Add an accent selection color to `UINavigationBar`

@Metadata {
    @TitleHeading("Class")
}

## Overview

This let's you add a "palette" below a `UINavigationBar` as per Calendar and Fitness.

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
