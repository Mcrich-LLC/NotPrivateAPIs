//
//  GlassEffectViewController.swift
//  GlassVariants
//
//  Converted from Objective-C++ to Swift
//

import UIKit

class GlassEffectViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    // MARK: - Private Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "0"))
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var containerView: UIVisualEffectView = {
        // UIGlassContainerEffect methods:
        // - (double) spacing
        // - (void) setSpacing:(double)arg1
        let effectClass: AnyClass? = NSClassFromString("UIGlassContainerEffect")
        let effect: UIVisualEffect? = {
            guard let effectClass = effectClass else { return nil }
            return (effectClass as! NSObject.Type).init() as? UIVisualEffect
        }()
        
        let containerView = UIVisualEffectView(effect: effect)
        
        containerView.contentView.addSubview(visualEffectView1)
        containerView.contentView.addSubview(visualEffectView2)
        
        visualEffectView1.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            visualEffectView1.centerXAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.centerXAnchor),
            visualEffectView1.centerYAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.centerYAnchor),
            visualEffectView1.widthAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            visualEffectView1.heightAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            
            visualEffectView2.leadingAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.leadingAnchor),
            visualEffectView2.trailingAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.trailingAnchor),
            visualEffectView2.centerYAnchor.constraint(equalTo: containerView.contentView.safeAreaLayoutGuide.centerYAnchor),
            visualEffectView2.heightAnchor.constraint(equalTo: visualEffectView1.heightAnchor, multiplier: 0.5)
        ])
        
        return containerView
    }()
    
    private lazy var visualEffectView1: UIVisualEffectView = {
        let effect = createGlassEffect()
        let visualEffectView = UIVisualEffectView(effect: effect)
        visualEffectView.layer.cornerRadius = 30.0
        return visualEffectView
    }()
    
    private lazy var visualEffectView2: UIVisualEffectView = {
        let effect = createGlassEffect()
        let visualEffectView = UIVisualEffectView(effect: effect)
        visualEffectView.layer.cornerRadius = 30.0
        return visualEffectView
    }()
    
    private lazy var menuBarButtonItem: UIBarButtonItem = {
        UIBarButtonItem(
            title: "Menu",
            image: UIImage(systemName: "filemenu.and.selection"),
            target: nil,
            action: nil,
            menu: makeMenu()
        )
    }()
    
    private lazy var sheetBarButtonItem: UIBarButtonItem = {
        UIBarButtonItem(title: "Sheet", style: .plain, target: self, action: #selector(presentSheet))
    }()
    
    private var glass: NSObject? = {
        guard let glassClass = NSClassFromString("_UIViewGlass") as? NSObject.Type else {
            return nil
        }
        return glassClass.init()
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        navigationItem.rightBarButtonItem = menuBarButtonItem
        navigationItem.leftBarButtonItem = sheetBarButtonItem
    }
    
    // MARK: - Private Methods
    
    private func createGlassEffect() -> UIVisualEffect? {
        // UIGlassEffect:
        // Class Methods:
        //  + (id) effectWithGlass:(id)arg1
        //  + (id) effectWithStyle:(long)arg1
        // Instance Methods:
        //  - (void) setStyle:(long)arg1
        //  - (long) style
        //  - (void) setInteractive:(BOOL)arg1
        //  - (id) glass
        //  - (BOOL) isInteractive
        //  - (void) setTintColor:(id)arg1
        //  - (id) tintColor
        guard let glassEffectClass = NSClassFromString("UIGlassEffect"),
              let glass = self.glass else {
            return nil
        }
        
        let selector = NSSelectorFromString("effectWithGlass:")
        
        guard glassEffectClass.responds(to: selector) else {
            return nil
        }
        
        let method = glassEffectClass.method(for: selector)
        typealias EffectWithGlassFunc = @convention(c) (AnyClass, Selector, NSObject) -> UIVisualEffect?
        let effectWithGlass = unsafeBitCast(method, to: EffectWithGlassFunc.self)
        
        return effectWithGlass(glassEffectClass, selector, glass)
    }
    
    private func createGlass(withVariant variant: Int) -> NSObject? {
        guard let glassClass = NSClassFromString("_UIViewGlass") as? NSObject.Type else {
            return nil
        }
        
        let selector = NSSelectorFromString("initWithVariant:")
        let allocated = glassClass.perform(NSSelectorFromString("alloc")).takeUnretainedValue() as! NSObject
        
        guard allocated.responds(to: selector) else {
            return nil
        }
        
        let method = allocated.method(for: selector)
        typealias InitWithVariantFunc = @convention(c) (NSObject, Selector, Int) -> NSObject?
        let initWithVariant = unsafeBitCast(method, to: InitWithVariantFunc.self)
        
        return initWithVariant(allocated, selector, variant)
    }
    
    private func getVariant(from glass: NSObject) -> Int {
        let selector = NSSelectorFromString("variant")
        
        guard glass.responds(to: selector) else {
            return 0
        }
        
        let method = glass.method(for: selector)
        typealias VariantFunc = @convention(c) (NSObject, Selector) -> Int
        let getVariant = unsafeBitCast(method, to: VariantFunc.self)
        
        return getVariant(glass, selector)
    }
    
    private func makeMenu() -> UIMenu {
        let element = UIDeferredMenuElement.uncached { [weak self] completion in
            guard let self = self, let glass = self.glass else {
                completion([])
                return
            }
            
            let currentVariant = self.getVariant(from: glass)
            
            let actions: [UIAction] = (0..<10).map { variant in
                let action = UIAction(title: "\(variant)", image: nil, identifier: nil) { [weak self] _ in
                    guard let self = self else { return }
                    
                    if let newGlass = self.createGlass(withVariant: variant) {
                        self.glass = newGlass
                        self.updateEffect()
                    }
                }
                
                action.state = (currentVariant == variant) ? .on : .off
                return action
            }
            
            let menu = UIMenu(title: "Variant", children: actions)
            completion([menu])
        }
        
        return UIMenu(children: [element])
    }
    
    @objc private func presentSheet() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.text = "Hello World"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        viewController.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])
        
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            
            sheet.perform(NSSelectorFromString("_setLargeBackground:"), with: glass)
            sheet.perform(NSSelectorFromString("_setNonLargeBackground:"), with: glass)
        }
        
        present(viewController, animated: true)
    }

    private func updateEffect() {
        guard let effect = createGlassEffect() else { return }
        visualEffectView1.effect = effect
        visualEffectView2.effect = effect
    }
}
