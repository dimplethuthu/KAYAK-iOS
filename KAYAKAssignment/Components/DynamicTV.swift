//
//  DynamicTV.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import Foundation
import UIKit

class DynamicTV: UITableView {
    
    var maxHeight: CGFloat = .greatestFiniteMagnitude
    
    open override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    open override var intrinsicContentSize: CGSize {
        setNeedsLayout()
        layoutIfNeeded()
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}
