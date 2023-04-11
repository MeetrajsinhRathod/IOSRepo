//
//  customVariationForIpad.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 10/04/23.
//

import UIKit

class customVariationForIpad: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override public var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isPortrait {
            return UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: .regular), UITraitCollection(verticalSizeClass: .regular)])
        }
        else if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isLandscape {
            return UITraitCollection(traitsFrom: [UITraitCollection(horizontalSizeClass: .regular), UITraitCollection(verticalSizeClass: .compact)])
        }
        return super.traitCollection
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attr = NSMutableAttributedString(string: "Click here")
        
        attr.addAttribute(.link, value: "https://google.com", range: NSRange(location: 0, length: attr.length))
        label.attributedText = attr
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openLink))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
    }
    
    @objc
    func openLink() {
        let attributeValue = label.attributedText?.attribute(NSAttributedString.Key.link, at: 0, effectiveRange: nil)
        if let attributeValue = attributeValue {
            UIApplication.shared.open((URL(string: (attributeValue as? String ?? "https://google.com")) ?? URL(string: "https://google.com"))!)
        }
    }


}
