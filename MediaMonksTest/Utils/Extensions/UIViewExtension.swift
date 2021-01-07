//
//  UIViewExtension.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import UIKit

extension UIView {
    func setCorner(cornerRadius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}
