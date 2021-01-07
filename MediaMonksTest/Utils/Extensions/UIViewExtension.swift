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
    
    func addShadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1.0
    }
    
    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
}
