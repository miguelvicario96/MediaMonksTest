//
//  CGPointExtension.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 06/01/21.
//

import CoreGraphics

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return sqrt(pow(point.x - self.x, 2) + pow(point.y - self.y, 2))
    }
}
