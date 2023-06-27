//
//  UIStoryboardExtension.swift
//  Dokusho-ios
//
//  Created by Nguyen Quang on 25/10/2022.
//

import Foundation
import UIKit

extension UIStoryboard {
    static let Splash = UIStoryboard(name: "Main", bundle: nil)
}

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(viewControllerType: T.Type) -> T {
        guard let viewController =
                instantiateViewController(withIdentifier: String(describing: viewControllerType)) as? T else {
            fatalError("Could not instantiateViewController with identifier: \(viewControllerType)")
        }
        
        return viewController
    }
}

extension UIApplication {
    
    func getTopViewController(base: UIViewController? = UIApplication.shared.mainKeyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
    
    var mainKeyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
        } else {
            return keyWindow
        }
    }
    
    var heightOfTabbar: CGFloat {
        if #available(iOS 11.0, *) {
            return 86
        } else {
            return 66
        }
    }
}
