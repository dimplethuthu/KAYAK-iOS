//
//  FlightSelectionModel.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

class FlightSelectionModel {
    var fromLocation: String?
    var toLocation: String?
    var date: String?
    
    init(fromLocation: String? = nil, toLocation: String? = nil, date: String? = nil) {
        self.fromLocation = fromLocation
        self.toLocation = toLocation
        self.date = date
    }
}
