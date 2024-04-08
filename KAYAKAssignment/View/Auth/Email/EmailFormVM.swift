//
//  EmailFormVM.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 08/04/2024.
//

import Foundation

protocol EmailFormDelegate {
    func onFillEmail()
}

final class EmailFormVM {
    
    var isEmailValid: Bool = false {
        didSet {
            delegate.onFillEmail()
        }
    }
    
    private let delegate: EmailFormDelegate
    
    init(delegate: EmailFormDelegate) {
        self.delegate = delegate
    }
    
    func check(for email: String?) {
        isEmailValid = email.isEmailValid()
    }
}
