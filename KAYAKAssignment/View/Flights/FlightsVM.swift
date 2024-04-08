//
//  FlightsVM.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol FlightsDelegate {
    func onGetFlights()
}

final class FlightsVM {
    
    private (set) var flights: [FlightModel] = [] {
        didSet {
            delegate.onGetFlights()
        }
    }
    private let repository: FlightRepository = FlightRepositoryImpl()
    
    private let delegate: FlightsDelegate
    
    init(delegate: FlightsDelegate) {
        self.delegate = delegate
    }
    
    func getFlights() {
        flights = repository.getFlights()
    }
    
    func bookMark(for flight: FlightModel) {
        flights.first { $0 == flight }?.isFav.toggle()
        delegate.onGetFlights()
    }
}
