//
//  DealDataSource.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

struct DealDataSource {
    static let shared = DealDataSource()
    
    private init() {}
    
    func getDeals() -> [DealModel] {
        return DealModel.mock()
    }
}
