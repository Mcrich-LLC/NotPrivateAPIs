# UICustomViewMenuElement 
Include a custom element in your `UIMenu`

@Metadata {
    @TitleHeading("Instance Property")
    @PageColor(green)
}

## Overview

UICustomViewMenuElement is a class that inherits from UIMenuElement and lets you initialise a menu item with a custom content view.

It's used in frameworks like ChatKit for the Messages app. 

> Warning: It is unknown when `UICustomViewMenuElement` was added to `UIMenu` and exactly which operating systems/versions support it. Testing is required before release into production and these properties may be removed in the future.

![An example of this UI](UICustomViewMenuElement-Image)

## Method

We can use this code to build our `UICustomViewMenuElement`:
```swift
let UICustomViewMenuElement = NSClassFromString("UICustomViewMenuElement") as! NSObject.Type
let elementWithViewProviderSelector = NSSelectorFromString("elementWithViewProvider:")
let elementWithViewProviderBlock: @convention(block) (UIMenuElement) -> UIView = { _ in return CustomContentView() }
let customViewMenuElement = UICustomViewMenuElement
    .perform(elementWithViewProviderSelector, with: elementWithViewProviderBlock)
    .takeUnretainedValue() as! UIMenuElement

let primaryActionHandlerSelector = NSSelectorFromString("setPrimaryActionHandler:")
let primaryActionHandlerBlock: @convention(block) (UIMenuElement) -> Void = { _ in print("Hello, World!") }
customViewMenuElement.perform(primaryActionHandlerSelector, with: primaryActionHandlerBlock)
```

## Example

Here is a full example of this implementation:
```swift
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let UICustomViewMenuElement = NSClassFromString("UICustomViewMenuElement") as! NSObject.Type
        let elementWithViewProviderSelector = NSSelectorFromString("elementWithViewProvider:")
        let elementWithViewProviderBlock: @convention(block) (UIMenuElement) -> UIView = { _ in return CustomContentView() }
        let customViewMenuElement = UICustomViewMenuElement
            .perform(elementWithViewProviderSelector, with: elementWithViewProviderBlock)
            .takeUnretainedValue() as! UIMenuElement
        
        let primaryActionHandlerSelector = NSSelectorFromString("setPrimaryActionHandler:")
        let primaryActionHandlerBlock: @convention(block) (UIMenuElement) -> Void = { _ in print("Hello, World!") }
        customViewMenuElement.perform(primaryActionHandlerSelector, with: primaryActionHandlerBlock)
        
        let editBarButtonItem = UIBarButtonItem(systemItem: .edit)
        editBarButtonItem.menu = buildMenu(with: customViewMenuElement)
        
        navigationItem.leftBarButtonItem = editBarButtonItem
    }
    
    func buildMenu(with customViewMenuElement: UIMenuElement) -> UIMenu {
        let selectMessagesElement = UIAction(title: "Select Messages", image: UIImage(systemName: "checkmark.circle")) { _ in }
        let recentlyDeletedElement = UIAction(title: "Show Recently Deleted", image: UIImage(systemName: "trash")) { _ in }
        let editPinsElement = UIAction(title: "Edit Pins", image: UIImage(systemName: "pin")) { _ in }
        
        let menu = UIMenu(children: [
            UIMenu(options: .displayInline, children: [customViewMenuElement]),
            UIMenu(options: .displayInline, children: [selectMessagesElement, editPinsElement]),
            UIMenu(options: .displayInline, children: [recentlyDeletedElement])
        ])
        
        return menu
    }
}

class CustomContentView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageView = UIImageView()
        imageView.image = .avatar
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        imageView.layer.cornerCurve = .circular
        imageView.backgroundColor = .systemTeal
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            imageView.widthAnchor.constraint(equalToConstant: 50),
            imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 9),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        let titleLabel = UILabel()
        titleLabel.text = "Seb Vidal"
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        
        stackView.addArrangedSubview(titleLabel)
        
        let detailLabel = UILabel()
        detailLabel.text = "Name & Photo"
        detailLabel.textColor = .secondaryLabel
        detailLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        stackView.addArrangedSubview(detailLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

## Credits

 - [Seb Vidal](https://x.com/SebJVidal)
