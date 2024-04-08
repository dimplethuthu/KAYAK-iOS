//
//  HomeFlightRepository.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol HomeFlightRepository {
    var homeFlightDataSource: HomeFlightDataSource { get set }
    func getFlights() -> [HomeFlightGuideModel]
}

final class HomeFlightRepositoryImpl: HomeFlightRepository {
    var homeFlightDataSource: HomeFlightDataSource = .shared
    func getFlights() -> [HomeFlightGuideModel] {
        homeFlightDataSource.getHomeFlights()
    }
}
