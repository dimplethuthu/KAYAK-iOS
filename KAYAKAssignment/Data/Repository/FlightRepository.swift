//
//  FlightRepository.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol FlightRepository {
    var flightDataSource: FlightDataSource { get set }
    func getFlights() -> [FlightModel]
    func getFlight(for flightName: String) -> FlightModel?
    func bookMark(for flightName: String)
}

final class FlightRepositoryImpl: FlightRepository {
    var flightDataSource: FlightDataSource = .shared
    
    func getFlights() -> [FlightModel] {
        flightDataSource.getFlights()
    }
    
    func getFlight(for flightName: String) -> FlightModel? {
        flightDataSource.getFlight(for: flightName)
    }
    
    func bookMark(for flightName: String) {
        flightDataSource.getFlights().first {
            $0.flightAgencyName == flightName
        }?.isFav.toggle()
    }
}
