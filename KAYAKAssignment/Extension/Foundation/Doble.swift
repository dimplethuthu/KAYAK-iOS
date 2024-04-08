//
//  Doble.swift
//  BookStore
//
//  Created by Zin Thu Htun on 16/03/2024.
//

import Foundation

extension Double {
    var toMMKCurrency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        numberFormatter.maximumFractionDigits = 0
        
        if let formattedString = numberFormatter.string(from: NSNumber(value: self)) {
            return formattedString
        } else {
            return String()
        }
    }
}
