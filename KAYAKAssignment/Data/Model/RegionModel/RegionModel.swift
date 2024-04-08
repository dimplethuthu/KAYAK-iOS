//
//  RegionModel.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import Foundation

class RegionModel: Mockable, Equatable {
    
    static func == (lhs: RegionModel, rhs: RegionModel) -> Bool {
        lhs.locationTitle == rhs.locationTitle
    }
    
    let mainTitle: String
    let locationTitle: String
    let locationDomain: String
    let currency: String
    let locationImage: String
    var isCheck: Bool
    
    private init(mainTitle: String, locationTitle: String, locationDomain: String, currency: String, locationImage: String, isCheck: Bool = false) {
        self.mainTitle = mainTitle
        self.locationTitle = locationTitle
        self.locationDomain = locationDomain
        self.currency = currency
        self.locationImage = locationImage
        self.isCheck = isCheck
    }
    
    static func mock() -> [RegionModel] {
        return [
            .init(mainTitle: "Current Region", locationTitle: "United States", locationDomain: "kayak.com", currency: "$ USD", locationImage: "USA", isCheck: true),
            .init(mainTitle: "Suggested Region", locationTitle: "Singapore", locationDomain: "kayak.sg", currency: "S$ (SGD)", locationImage: "Singapore"),
            .init(mainTitle: "Suggested Region", locationTitle: "Myanmar", locationDomain: "kayak.myanmar", currency: "MMK", locationImage: "Myanmar"),
            .init(mainTitle: "Suggested Region", locationTitle: "Thailand", locationDomain: "kayak.thai", currency: "Baht", locationImage: "Thailand")
        ]
    }
}
