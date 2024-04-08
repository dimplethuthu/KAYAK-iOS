//
//  HomeFlightDataSource.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

struct HomeFlightDataSource {
    static let shared = HomeFlightDataSource()
    
    private init() {}
    
    func getHomeFlights() -> [HomeFlightGuideModel] {
        return HomeFlightGuideModel.mock()
    }
}
