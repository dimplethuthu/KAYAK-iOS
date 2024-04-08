//
//  RegionDataSource.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

struct RegionDataSource {
    
    public static let shared = RegionDataSource()
    
    private var regions = RegionModel.mock()
    
    private init() {}
    
    func getRegions() -> [RegionModel] {
        return regions
    }
    
    
}
