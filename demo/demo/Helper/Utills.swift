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

extension String {
    
    func getFormattedDateWithTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return "--"}
        dateFormatter.dateFormat = "dd-MMM-yyyy, HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return "--"}
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func convertToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        guard let date = dateFormatter.date(from: self) else { return Date()}
        return date
    }
}

