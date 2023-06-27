//
//  ViewProtocol.swift
//  Earable
//
//  Created by FPT Software on 6/1/22.
//  Copyright © 2022 Earable. All rights reserved.
//

import UIKit

protocol NibLoadable {
    static func getNibName() -> String
    static func getNib() -> UINib
}

extension NibLoadable where Self: UIView {
    static func getNibName() -> String {
        String(describing: self)
    }
    
    static func getNib() -> UINib {
        let mainBundle = Bundle.main
        return UINib(nibName: self.getNibName(), bundle: mainBundle)
    }
}

extension UITextField {
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }

    func addPadding(_ padding: PaddingSide) {
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        switch padding {
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

protocol pushNavigation {
    func didTapButton()
}
