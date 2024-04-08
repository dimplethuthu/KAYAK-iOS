//
//  HomeVM.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol HomeDelegate {
    func onGetFlights()
}

final class HomeVM {
    private let repository: HomeFlightRepository = HomeFlightRepositoryImpl()
    
    private(set) var homeFlights: [HomeFlightGuideModel] = [] {
        didSet {
            delegate.onGetFlights()
        }
    }
    
    private let delegate: HomeDelegate
    
    init(delegate: HomeDelegate) {
        self.delegate = delegate
    }
    
    func getHomeFlights() {
        homeFlights = repository.getFlights()
    }
}
