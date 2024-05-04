# \_setHeaderContentViewController(\_:)

@Metadata {
    @TitleHeading("Instance Method")
    @PageColor(red)
}

Set any UIViewController as a custom header for your alert

## Overview

UIAlertController's `_setHeaderContentViewController(_:)` method lets you set any UIViewController as a custom header for your alert.

Apple use this in the new Journal app's UI to present a date picker in an action sheet, as pointed out in 
[lickability](https://x.com/lickability/status/1775577442117190067)'s design critique.

![An example of this UI](_setHeaderContentViewController-Video)

## Method

We can use this code to present a `UIAlertController` with our custom header:
```swift
let selector = NSSelectorFromString("_setHeaderContentViewController:")
let headerContentViewController = CalendarViewController()

let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
alertController.perform(selector, with: headerContentViewController)
alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in})

present(alertController, animated: true)
```

## Example

Here is a full example of this implementation:
```swift
class ViewController: UIViewController {
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        
        let button = UIButton(type: .system)
        button.setTitle("Show Calendar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showAlertController), for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    @objc private func showAlertController(_ sender: UIButton) {
        let selector = NSSelectorFromString("_setHeaderContentViewController:")
        let headerContentViewController = CalendarViewController()
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.perform(selector, with: headerContentViewController)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in})
        
        present(alertController, animated: true)
    }
}

class CalendarViewController: UIViewController {
    // MARK: - Private Properties
    private var calendarView: UICalendarView!
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        
        calendarView = UICalendarView()
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(calendarView)
        
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - viewDidLayoutSubviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = calendarView.intrinsicContentSize.height
        preferredContentSize = CGSize(width: -1, height: height)
    }
}
```
