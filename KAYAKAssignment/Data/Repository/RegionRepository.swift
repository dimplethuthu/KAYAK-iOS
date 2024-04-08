//
//  RegionRepository.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol RegionRepository {
    var regionDataSource: RegionDataSource { get set }
    func getRegions() -> [RegionModel]
}

final class RegionRepositoryImpl: RegionRepository {
    var regionDataSource: RegionDataSource = .shared
    
    func getRegions() -> [RegionModel] {
        return regionDataSource.getRegions()
    }
}
