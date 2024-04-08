//
//  ExploreVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class ExploreVC: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tabBarItem = .init(title: "Explore", image: .globe, selectedImage: .globe)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
}
