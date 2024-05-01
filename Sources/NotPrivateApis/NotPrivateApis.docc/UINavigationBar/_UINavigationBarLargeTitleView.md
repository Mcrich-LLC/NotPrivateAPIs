# \_accessoryView 

@Metadata {
    @TitleHeading("UINavigationBar/_UINavigationBarLargeTitleView")
}

## Overview

UINavigationBar’s \_UINavigationBarLargeTitleView subview has an \_accessoryView property that acts as a sort of bar button item that aligns with the large title label.

This is used in all sorts of system apps like Health, Music, and Podcasts.

![An example of this UI](_UINavigationBarLargeTitleView-Video)

## Method

We can use this code to present a `UIAlertController` with our custom header:
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
