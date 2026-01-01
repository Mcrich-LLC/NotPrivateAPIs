//
//  GlassSheet.swift
//  Project Rovo
//
//  Created by Morris Richman on 12/31/25.
//

import Foundation
import SwiftUI

extension View {
    public func glassSheet(variant: Int = 4) -> some View {
        background{ VCWrapper(variant: variant) }
    }
}

fileprivate struct VCWrapper: UIViewControllerRepresentable {
    let variant: Int
    
    @MainActor final class DummyVC: UIViewController {
        let variant: Int
        
        init(variant: Int) {
            self.variant = variant
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func didMove(toParent parent: UIViewController?) {
            super.didMove(toParent: parent)
            
            guard let sheetPresentationController = parent?.sheetPresentationController else {
                return
            }
            
            let glassView = _UIViewGlass(variant: variant)
            
            sheetPresentationController.perform(NSSelectorFromString("_setLargeBackground:"), with: glassView)
            sheetPresentationController.perform(NSSelectorFromString("_setNonLargeBackground:"), with: glassView)
        }
    }

    func makeUIViewController(context: Context) -> DummyVC {
        .init(variant: variant)
    }
    func updateUIViewController(_ uiViewController: DummyVC, context: Context) {
    }
}

public func _UIViewGlass(variant: Int) -> NSObject? {
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
