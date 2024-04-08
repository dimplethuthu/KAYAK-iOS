//
//  FlightDataSource.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

struct FlightDataSource {
    
    static let shared = FlightDataSource()
    private let flights = FlightModel.mock()
    
    private init() {}
    
    func getFlights() -> [FlightModel] {
        return flights
    }
    
    func getFlight(for flightAgencyName: String) -> FlightModel? {
        return flights.first { $0.flightAgencyName == flightAgencyName }
    }
}
