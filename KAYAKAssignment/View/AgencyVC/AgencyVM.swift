//
//  AgencyVM.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol AgencyDelegate {
    func onGetDeals()
    func onGetFlight()
}

final class AgencyVM {
    
    private (set) var flight: FlightModel? {
        didSet {
            delegate.onGetFlight()
        }
    }
    
    private (set) var deals: [DealModel] = [] {
        didSet {
            delegate.onGetDeals()
        }
    }
    
    private let dealRepository: DealRepository = DealRepositoryImpl()
    private let flightRepository: FlightRepository = FlightRepositoryImpl()
    private let delegate: AgencyDelegate
    
    init(delegate: AgencyDelegate) {
        self.delegate = delegate
    }
    
    func getDeals() {
        deals = dealRepository.getFlights()
    }
    
    func getFlight(for flightName: String) {
        flight = flightRepository.getFlight(for: flightName)
    }
    
    func bookMarkFlight(for flightName: String) {
        flightRepository.bookMark(for: flightName)
        delegate.onGetFlight()
    }
}
