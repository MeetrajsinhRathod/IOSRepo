//
//  CoordinatorBoard.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 09/04/23.
//

import UIKit

protocol CoordinatorBoard { }

extension CoordinatorBoard where Self : UIViewController {
    
     static func instatiateStoryBoard() -> Self {
        let storyBoard = UIStoryboard(name: "UINavigation", bundle: .main)
        let id = String(describing: self)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}
