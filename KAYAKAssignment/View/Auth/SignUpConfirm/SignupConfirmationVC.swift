//
//  SignupConfirmationVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class SignupConfirmationVC: UIViewController {
    
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var imgCheckIcon: UIImageView!
    
    var isCheck: Bool = false {
        didSet {
            imgCheckIcon.image = isCheck ? .checkFill : .check
            btnCreateAccount.isEnabled = isCheck
            btnCreateAccount.backgroundColor = isCheck ? .primary : .lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        initBindings()
    }
    
    private func setUpUI() {
        btnCreateAccount.isEnabled = false
        btnCreateAccount.backgroundColor = .lightGray
    }
    
    private func initBindings() {
        btnCheck.addTarget(self, action: #selector(handleCheck), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        btnCreateAccount.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleCheck() {
        isCheck.toggle()
    }
    
    @objc func handleCreateAccount() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Auth), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
