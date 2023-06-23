//
//  UIView+Extensions.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 23/06/
//

import UIKit

// MARK: Extension
extension UIView {
    @IBInspectable public var rounded: Bool {
        get {
            return true
        } set(newValue) {
            if newValue {
                roundView()
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }


    func roundView() {
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
}
