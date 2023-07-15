//
//  ImageViewExtension.swift
//  Crave
//
//  Created by Yousuf on 15/7/23.
//

import Foundation
import UIKit

extension UIImageView {
    func rotate(degree : CGFloat) {
        let angle = degree * CGFloat(Double.pi / 180 )
        self.transform = CGAffineTransform(rotationAngle: angle)
    }
}
