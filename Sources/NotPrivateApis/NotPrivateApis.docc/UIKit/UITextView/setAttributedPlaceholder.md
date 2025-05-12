# setAttributedPlaceholder(\_:)
A placeholder for UITextViews

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

## Overview

Adding a placeholder string has been possible for a long time with [`UITextField`](https://developer.apple.com/documentation/uikit/UITextField), but for some reason not (publicly) with the [`UITextView`](<doc:UITextView>) counterpart. No more subclassing [`UITextView`](<doc:UITextView>) and manually showing/hiding a [`UILabel`](https://developer.apple.com/documentation/uikit/UILabel)

> Warning: It is unknown when `setAttributedPlaceholder(_:)` was added to `UITextView` and exactly which operating systems/versions support it. Testing is required before release into production and `setAttributedPlaceholder(_:)` may be removed in the future.

![An example of this UI](setAttributedPlaceholder-Video)

## Example

Here is a full example of this implementation:
```swift
import UIKit

class TextViewController: UIViewController (
    override func viewDidLoad) {
        super.viewDidLoad()

        let textView = UITextView()
        textView.font = .preferredFont(forTextStyle: .body) 
        textView.backgroundColor = .secondarySystemBackground
        textView.translatesAutoresizingMaskIntoConstraints = false

        let string = NSAttributedString(string: "Placeholder")
        textView.perform(NSSelectorFromString("setAttributedPlaceholder:"), with: string)

        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalto: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.widthAnchor.constraint(equalToConstant: 200), textView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}
```

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
