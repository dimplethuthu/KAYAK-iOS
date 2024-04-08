//
//  DealRepository.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol DealRepository {
    var dealDataSource: DealDataSource { get set }
    func getFlights() -> [DealModel]
}

final class DealRepositoryImpl: DealRepository {
    var dealDataSource: DealDataSource = .shared
    func getFlights() -> [DealModel] {
        dealDataSource.getDeals()
    }
}
