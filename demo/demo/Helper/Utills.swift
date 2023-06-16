//
//  Utills.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 08/06/23.
//

import UIKit

protocol StoryBoarded { }

extension StoryBoarded where Self : UIViewController {
    
    static func instatiateStoryBoard(storyboardName: String) -> Self {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: .main)
        let id = String(describing: self)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}

extension UIViewController {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

