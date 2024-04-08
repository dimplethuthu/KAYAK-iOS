//
//  OnboardingVM.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol OnBoardingDelegate {
    func onGetRegion()
    func isRegionSelected()
}

class OnboardingVM {
    private let delegate: OnBoardingDelegate
    
    private (set) var isAtLeastOneRegionSelected: Bool = false {
        didSet {
            delegate.isRegionSelected()
        }
    }
    
    private (set) var regions: [RegionModel] = [] {
        didSet {
            delegate.onGetRegion()
        }
    }
    
    private let repository: RegionRepository = RegionRepositoryImpl()
    
    init(delegate: OnBoardingDelegate) {
        self.delegate = delegate
    }
    
    func getRegions()  {
        regions = repository.getRegions()
    }
    
    func updateRegion(with region: RegionModel) {
        regions.first { $0 == region }?.isCheck.toggle()
        regions.filter { $0 != region }.forEach { $0.isCheck = false }
        isAtLeastOneRegionSelected = regions.filter { $0.isCheck == true }.count >= 1
    }
}
