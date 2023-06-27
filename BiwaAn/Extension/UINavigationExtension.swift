//
//  UINavigationExtension.swift
//  Dokusho-ios
//
//  Created by Nguyen Quang on 25/10/2022.
//

import UIKit

extension UINavigationController {
    func push(viewController vc: UIViewController,
              isAnimated: Bool = true,
              ishidesBottomBar: Bool = false) {
        vc.hidesBottomBarWhenPushed = ishidesBottomBar
        self.pushViewController(vc, animated: isAnimated)
    }
    
    func pushViewController<T: UIViewController>(storyboard: String,
                                                 controllerType: T.Type,
                                                 isAnimated: Bool = true,
                                                 ishidesBottomBar: Bool = true) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType: T.self)
//        viewController.hidesBottomBarWhenPushed = ishidesBottomBar
        self.pushViewController(viewController, animated: isAnimated)
    }
    
    func setRootViewController<T: UIViewController>(storyboard: String,
                                                    controllerType: T.Type,
                                                    isAnimated: Bool = true,
                                                    ishidesBottomBar: Bool = true) {
        guard let window = UIApplication.shared.mainKeyWindow else { return }
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewController(viewControllerType: T.self)
        window.rootViewController = UINavigationController.init(rootViewController: viewController)
        window.makeKeyAndVisible()
    }
    
 
}
