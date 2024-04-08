//
//  RootNC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class RootNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            goToLogin()
        }
    }
    
    func goToOnboarding() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Onboarding), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingVC
        pushViewController(vc, animated: true)
    }
    
    func goToHome() {
        let tabVc = TabBarVC.init()
        tabVc.selectedIndex = 0
        self.pushViewController(tabVc, animated: true)
    }
    
    func goToLogin() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Auth), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        pushViewController(vc, animated: true)
    }

}
