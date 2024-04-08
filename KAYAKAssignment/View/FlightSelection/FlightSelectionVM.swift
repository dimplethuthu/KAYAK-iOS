//
//  FlightSelectionVM.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol FlightSelectionDelegate {
    func onReceiveFields()
    func onReverse()
}

final class FlightSelectionVM {
    
    var flightSelectionModel: FlightSelectionModel = .init()
    
    var isReverse: Bool = false {
        didSet {
            reverse()
        }
    }
    
    private (set) var isEveryFieldFilled: Bool = false {
        didSet {
            delegate.onReceiveFields()
        }
    }
    
    private(set) var swapValueFormLocation: String? {
        didSet {
            delegate.onReverse()
        }
    }
    
    private(set) var swapValueToLocation: String? {
        didSet {
            delegate.onReverse()
        }
    }
    
    private let delegate: FlightSelectionDelegate
    
    init(delegate: FlightSelectionDelegate) {
        self.delegate = delegate
    }
    
    func handleFields() {
        isEveryFieldFilled = (flightSelectionModel.fromLocation != nil && flightSelectionModel.fromLocation?.isEmpty == false)
        && (flightSelectionModel.toLocation != nil && flightSelectionModel.toLocation?.isEmpty == false) &&
        (flightSelectionModel.date != nil && flightSelectionModel.date?.isEmpty == false)
    }
    
    func reverse() {
        swapValueFormLocation = isReverse ? flightSelectionModel.toLocation: flightSelectionModel.fromLocation
        swapValueToLocation = isReverse ? flightSelectionModel.fromLocation : flightSelectionModel.toLocation
    }
}
