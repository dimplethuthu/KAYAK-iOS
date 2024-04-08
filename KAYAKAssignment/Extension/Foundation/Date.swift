//
//  Date.swift
//  helloworldinteraction
//
//  Created by Zin Thu Htun on 09/03/2024.
//

import Foundation

extension Date {
    var userBirthDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIZ")
        return dateFormatter.string(from: self)
    }
}
