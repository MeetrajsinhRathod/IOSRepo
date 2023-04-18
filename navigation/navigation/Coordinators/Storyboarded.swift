//
//  Storyboarded.swift
//  navigation
//
//  Created by Meetrajsinh Rathod on 18/04/23.
//

import UIKit

protocol Storyboarded {
    
}

extension Storyboarded {
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: "Main", bundle: .main)
        let id = String(describing: self)
        return storyBoard.instantiateViewController(withIdentifier: id) as! Self
    }
}
