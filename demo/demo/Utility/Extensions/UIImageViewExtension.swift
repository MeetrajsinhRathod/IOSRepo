//
//  UIImageViewExtension.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/06/23.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        self.isSkeletonable = true
        self.showAnimatedGradientSkeleton()
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.hideSkeleton()
                        self?.image = image
                    }
                }
            }
        }
    }
}
