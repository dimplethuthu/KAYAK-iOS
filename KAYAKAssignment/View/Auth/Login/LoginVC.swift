//
//  LoginVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnContinueWithApple: UIButton!
    @IBOutlet weak var btnContinueWithEmail: UIButton!
    @IBOutlet weak var btnSignInOptions: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        initBindings()
    }
    
    private func initBindings() {
        btnSkip.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        btnSignInOptions.addTarget(self, action: #selector(handleSignInOptions), for: .touchUpInside)
        btnContinueWithApple.addTarget(self, action: #selector(handleContinueWithApple), for: .touchUpInside)
        btnContinueWithEmail.addTarget(self, action: #selector(handleContinueWithEmail), for: .touchUpInside)
    }
    
    @objc func handleSkip() {
        (navigationController as? RootNC)?.goToOnboarding()
    }
    
    @objc func handleContinueWithApple() {
        (navigationController as? RootNC)?.goToOnboarding()
    }

    @objc func handleContinueWithEmail() {
        (navigationController as? RootNC)?.goToOnboarding()
    }
    
    @objc func handleSignInOptions() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Auth), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "EmailFormVC") as! EmailFormVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
