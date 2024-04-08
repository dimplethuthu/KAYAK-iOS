//
//  NotificationVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class NotificationVC: UIViewController {

    @IBOutlet weak var btnEnableNotification: UIButton!
    @IBOutlet weak var btnSkipNow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        initBinding()
    }
    
    private func setUpUI() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func initBinding() {
        btnSkipNow.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        btnEnableNotification.addTarget(self, action: #selector(handleNotification), for: .touchUpInside)
    }
    
    @objc func handleNotification() {
        (navigationController as? RootNC)?.goToOnboarding()
    }
    
    @objc func handleSkip() {
        (navigationController as? RootNC)?.goToOnboarding()
    }
    
}
