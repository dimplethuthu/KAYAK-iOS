//
//  String.swift
//  helloworldinteraction
//
//  Created by Zin Thu Htun on 03/03/2024.
//

import Foundation

extension String? {
    func isValid() -> Bool {
        guard let self = self, !self.isEmpty else {
            return false
        }
        return true
    }
}

extension Optional where Wrapped == String {
    func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}

extension String {
    static func storyboard(of name: StoryBoardHelper) -> String {
        switch name {
        case .Auth:
            return "Auth"
        case .Home:
            return "Home"
        case .Main:
            return "Main"
        case .Onboarding:
            return "Onboarding"
        }
    }
}
