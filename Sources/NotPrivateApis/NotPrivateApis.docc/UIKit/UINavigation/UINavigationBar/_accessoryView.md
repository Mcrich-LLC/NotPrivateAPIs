# \_accessoryView 
Include an inline large view in your `UINavigationBar`

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(green)
}

## Overview

[`UINavigationBar`](<doc:UINavigationBar>)’s \_UINavigationBarLargeTitleView subview has an \_accessoryView property that acts as a sort of bar button item that aligns with the large title label.

This is used in all sorts of system apps like Health, Music, and Podcasts.

> Warning: It is unknown when `_accessoryView` and `_UINavigationBarLargeTitleView` were added to `UINavigationBar` and exactly which operating systems/versions support it. Testing is required before release into production and these properties may be removed in the future.

![An example of this UI](_accessoryView-Video)

## Method

We can use this code to add our accessory to the `UINavigationBar`:
```swift
let accessoryView = ProfileButton(type: .system)
accessoryView.frame.size = CGSize(width: 34, height: 34)
navigationItem.perform(Selector(("_setLargeTitleAccessoryView:")), with: accessoryView)
```

## Example

Here is a full example of this implementation:
```swift
import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        let accessoryView = ProfileButton(type: .system)
        accessoryView.frame.size = CGSize(width: 34, height: 34)

        navigationItem.perform(Selector(("_setLargeTitleAccessoryView:")), with: accessoryView)
    }
｝

class ProfileButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(.profile.withRenderingMode(.alwaysOriginal), for: .normal)
    ｝
    required init? (coder: NSCoder) {
        fatalError ("init(coder:) has not been implemented")
    }
}
```

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
