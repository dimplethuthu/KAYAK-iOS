//
//  FlightSelectionVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class FlightSelectionVC: UIViewController {
    
    // MARK: Textfields
    
    @IBOutlet weak var tfFromLocation: UITextField!
    @IBOutlet weak var tfToLocation: UITextField!
    @IBOutlet weak var tfDob: UITextField!
    
    // MARK: Buttons
    
    @IBOutlet weak var btnSearchFlight: UIButton!
    @IBOutlet weak var btnReverse: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btn1Traveler: UIButton!
    @IBOutlet weak var btnEconomy: UIButton!
    @IBOutlet weak var btnCarryOnChecked: UIButton!
    @IBOutlet weak var btnAnyStops: UIButton!
    // MARK: Date Picker
    
    lazy var flightDatePicker: UIDatePicker = {
        let datePicker: UIDatePicker = .init()
        datePicker.minimumDate = Date()
        datePicker.preferredDatePickerStyle = .inline
        return datePicker
    }()
    
    @IBOutlet weak var viewForReverse: UIView!
    @IBOutlet weak var viewForTraveler: UIView!
    @IBOutlet weak var viewForEconomy: UIView!
    @IBOutlet weak var viewForCheckCarry: UIView!
    @IBOutlet weak var viewForAnyStop: UIView!
 
    var isViewForTraveler: Bool = false {
        didSet {
            viewForTraveler.layer.borderColor = isViewForTraveler ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    var isViewForEconomy: Bool = false {
        didSet {
            viewForEconomy.layer.borderColor = isViewForEconomy ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    var isViewForCheckCarry: Bool = false {
        didSet {
            viewForCheckCarry.layer.borderColor = isViewForCheckCarry ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    var isViewForAnyStop: Bool = false {
        didSet {
            viewForAnyStop.layer.borderColor = isViewForAnyStop ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        }
    }
    
    private lazy var vm: FlightSelectionVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        initBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tfFromLocation.becomeFirstResponder()
    }
    
    func setUpUI() {
        tfDob.inputView = flightDatePicker
        tfToLocation.delegate = self
        tfFromLocation.delegate = self
        addToolbarToTextField()
        viewForReverse.layer.borderColor = UIColor.white.cgColor
        viewForReverse.layer.borderWidth = 1
        [viewForTraveler, viewForEconomy, viewForCheckCarry, viewForAnyStop].roundCorner(10)
        [viewForTraveler, viewForEconomy, viewForCheckCarry, viewForAnyStop].addBorder(3, color: .systemGray5)
        [btnSearchFlight, btnReverse].disable()
    }
    
    func initBinding() {
        [tfToLocation, tfFromLocation].addTarget(for: self, action: #selector(handleTF))
        btnSearchFlight.addTarget(self, action: #selector(onTapSearchFlight), for: .touchUpInside)
        btnReverse.addTarget(self, action: #selector(revsere), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        tfDob.addTarget(self, action: #selector(hanldDatePicker), for: .valueChanged)
        btn1Traveler.addTarget(self, action: #selector(handleTraveler), for: .touchUpInside)
        btnAnyStops.addTarget(self, action: #selector(handleAnyStop), for: .touchUpInside)
        btnCarryOnChecked.addTarget(self, action: #selector(handleCarryOn), for: .touchUpInside)
        btnEconomy.addTarget(self, action: #selector(handleEconomy), for: .touchUpInside)
    }
    
    func addToolbarToTextField() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [flexibleSpace, doneButton]
        tfDob.inputAccessoryView = toolbar
    }
    
    // Action for the done button
    @objc func doneButtonTapped() {
        // Dismiss the keyboard
        tfDob.text = flightDatePicker.date.userBirthDate
        vm.flightSelectionModel.date = tfDob.text
        vm.handleFields()
        tfDob.resignFirstResponder()
    }
    
    @objc func onTapSearchFlight() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "FlightsVC") as! FlightsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleTF() {
        vm.flightSelectionModel.fromLocation = tfFromLocation.text
        vm.flightSelectionModel.toLocation = tfToLocation.text
        vm.handleFields()
    }
    
    @objc func hanldDatePicker() {
        vm.flightSelectionModel.date = tfDob.text
        vm.handleFields()
    }
    
    @objc func revsere() {
        vm.isReverse.toggle()
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTraveler() {
        isViewForTraveler.toggle()
    }
    
    @objc func handleEconomy() {
        isViewForEconomy.toggle()
    }
    
    @objc func handleCarryOn() {
        isViewForCheckCarry.toggle()
    }
    
    @objc func handleAnyStop() {
        isViewForAnyStop.toggle()
    }
}

extension FlightSelectionVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfFromLocation {
            tfFromLocation.resignFirstResponder()
            tfToLocation.becomeFirstResponder()
        } else {
            tfToLocation.resignFirstResponder()
            tfDob.becomeFirstResponder()
        }
        return true
    }
}

extension FlightSelectionVC: FlightSelectionDelegate {
    func onReceiveFields() {
        btnSearchFlight.isEnabled = vm.isEveryFieldFilled
        btnSearchFlight.backgroundColor = vm.isEveryFieldFilled ? .primary : .lightGray
        btnReverse.isEnabled = vm.isEveryFieldFilled
        btnReverse.backgroundColor = vm.isEveryFieldFilled ? .systemGray5 : .lightGray
    }
    
    func onReverse() {
        tfToLocation.text = vm.swapValueToLocation
        tfFromLocation.text = vm.swapValueFormLocation
    }
}
