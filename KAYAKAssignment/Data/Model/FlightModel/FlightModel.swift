//
//  FlightModel.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import Foundation

class FlightModel: Mockable {
    let isBest: Bool
    let isCheapest: Bool
    let flightAgencyImage: String
    let flightStartTime: String
    let flightEndTime: String
    let flightStartLocation: String
    let flightEndLocation: String
    let flightDuration: String
    let flightOverallCost: Double
    let flightSites: Int
    let flightAgencyName: String
    var isFav: Bool
    
    init(isBest: Bool, isCheapest: Bool, flightAgencyImage: String, flightStartTime: String, flightEndTime: String, flightStartLocation: String, flightEndLocation: String, flightDuration: String, flightOverallCost: Double, flightSites: Int, flightAgencyName: String, isFav: Bool = false) {
        self.isBest = isBest
        self.isCheapest = isCheapest
        self.flightAgencyImage = flightAgencyImage
        self.flightStartTime = flightStartTime
        self.flightEndTime = flightEndTime
        self.flightStartLocation = flightStartLocation
        self.flightEndLocation = flightEndLocation
        self.flightDuration = flightDuration
        self.flightOverallCost = flightOverallCost
        self.flightSites = flightSites
        self.flightAgencyName = flightAgencyName
        self.isFav = isFav
    }
    
    static func mock() -> [FlightModel] {
        return [
            .init(isBest: false, isCheapest: true, flightAgencyImage: "DummyAgency", flightStartTime: "9:15a", flightEndTime: "1:15p", flightStartLocation: "LDN", flightEndLocation: "USA", flightDuration: "1 hr 15 min", flightOverallCost: 1200.0, flightSites: 0, flightAgencyName: "ABC"),
            .init(isBest: true, isCheapest: false, flightAgencyImage: "DummyAgency", flightStartTime: "10: 25a", flightEndTime: "12:00 p", flightStartLocation: "SGN", flightEndLocation: "BKK", flightDuration: "12 hr", flightOverallCost: 0.0, flightSites: 10, flightAgencyName: "DEF")
        ]
    }
}

extension FlightModel: Equatable {
    static func == (lhs: FlightModel, rhs: FlightModel) -> Bool {
        lhs.flightAgencyName == rhs.flightAgencyName
    }
    
}
