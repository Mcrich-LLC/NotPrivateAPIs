# setAttributedPlaceholder(\_:)
A placeholder for UITextViews

@Metadata {
    @TitleHeading("Instance Method")
}

## Overview

Adding a placeholder string to a UITextView. Has been possible for a long time with UITextField, but for some reason not (publicly) with the text view counterpart. No more subclassing UITextView and manually showing/hiding a UILabel 

![An example of this UI](setAttributedPlaceholder-Video)

## Example

Here is a full example of this implementation:
```swift
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
