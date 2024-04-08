//
//  TabBarVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class TabBarVC: UITabBarController {
    
    private var homeVc: HomeSearchVC {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "HomeSearchVC") as! HomeSearchVC
        return vc
    }
    
    private var exploreVc: ExploreVC {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "ExploreVC") as! ExploreVC
        return vc
    }
    
    private var tripsVc: TripsVC {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "TripsVC") as! TripsVC
        return vc
    }
    
    private var profileVc: ProfileVC {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        return vc
    }
    
    class CustomTabBar: UITabBar {
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            super.sizeThatFits(size)
            let height = size.height + 60
            return .init(width: size.width, height: height)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            homeVc,
            exploreVc,
            tripsVc,
            profileVc
        ]
    }
    
    init() {
        super.init(nibName: nil, bundle: .main)
        
        tabBar.items?.forEach({
            let selectedColor: [NSAttributedString.Key: UIColor] = [.foregroundColor: UIColor(named: "Primary")!]
            let unselectedColor: [NSAttributedString.Key: UIColor] = [.foregroundColor: .black]
            
            $0.setTitleTextAttributes(selectedColor, for: .selected)
            $0.setTitleTextAttributes(unselectedColor, for: .normal)
        })
        
        tabBar.backgroundColor = .white
        UITabBar.appearance().tintColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required to Set Up init coder")
    }
}
