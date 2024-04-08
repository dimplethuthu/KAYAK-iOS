//
//  DealModel.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import Foundation

class DealModel: Mockable {
    let dealName: String
    let dealCost: String
    
    init(dealName: String, dealCost: String) {
        self.dealName = dealName
        self.dealCost = dealCost
    }
    
    static func mock() -> [DealModel] {
        return [
            .init(dealName: "Sample", dealCost: "12$"),
            .init(dealName: "Sample1", dealCost: "13$"),
            .init(dealName: "Sample2", dealCost: "14$")
        ]
    }
}
