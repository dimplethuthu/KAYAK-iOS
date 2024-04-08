//
//  View+Extension.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import Foundation
import UIKit

extension Array where Element == UIView? {
    func roundCorner(_ radius: CGFloat) {
        self.compactMap {
            $0
        }.forEach {
            $0.layer.cornerRadius = radius
        }
    }
    
    func addBorder(_ width: CGFloat, color: UIColor) {
        self.compactMap {
            $0
        }.forEach {
            $0.layer.borderWidth = width
            $0.layer.borderColor = color.cgColor
        }
    }
}
