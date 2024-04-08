//
//  Button+Extension.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 27/03/2024.
//

import Foundation
import UIKit

extension Array where Element == UIButton? {
    func disable() {
        self.compactMap {
            $0
        }.forEach {
            $0.isEnabled = false
            $0.backgroundColor = .lightGray
            $0.layer.cornerRadius = 10
        }
    }
}
