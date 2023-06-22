//
//  UITextViewExtension.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/06/23.
//

import UIKit

extension UITextView {

    func setLeftRightPadding(padding: Double) {
        self.contentInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
}
