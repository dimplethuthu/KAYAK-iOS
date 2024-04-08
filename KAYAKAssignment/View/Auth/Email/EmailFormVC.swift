//
//  EmailFormVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class EmailFormVC: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var viewForEmail: UIView!
    
    private lazy var vm: EmailFormVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBindings()
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tfEmail.becomeFirstResponder()
    }
    
    private func setUpUI() {
        viewForEmail.layer.borderColor = UIColor.green.cgColor
        viewForEmail.layer.borderWidth = 1.5
        
        tfEmail.delegate = self
        tfEmail.returnKeyType = .done
        
        btnContinue.isEnabled = false
        btnContinue.backgroundColor = .lightGray
    }
    
    private func initBindings() {
        tfEmail.addTarget(self, action: #selector(handleTF(_:)), for: .editingChanged)
        btnBack.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        btnContinue.addTarget(self, action: #selector(handleContine), for: .touchUpInside)
    }

    @objc func handleTF(_ tf: UITextField) {
        vm.check(for: tf.text)
    }
    
    @objc func handleContine() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Auth), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "SignupConfirmationVC") as! SignupConfirmationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension EmailFormVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if vm.isEmailValid {
            handleContine()
        }
        return true
    }
}

extension EmailFormVC: EmailFormDelegate {
    func onFillEmail() {
        btnContinue.isEnabled = vm.isEmailValid
        btnContinue.backgroundColor = vm.isEmailValid ? .primary : .lightGray
    }
}
