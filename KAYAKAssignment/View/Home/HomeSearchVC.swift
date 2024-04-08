//
//  SearchVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

class HomeSearchVC: UIViewController {
    
    @IBOutlet weak var btnFlight: UIButton!

    @IBOutlet weak var tvFlighLocations: UITableView!
    
    private lazy var vm: HomeVM = .init(delegate: self)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tabBarItem = .init(title: "Search", image: .magnify, selectedImage: .magnify)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        setUpUI()
        initBinding()
    }
    
    private func setUpUI() {
        setUpTableView()
    }
    
    private func initBinding() {
        vm.getHomeFlights()
        btnFlight.addTarget(self, action: #selector(handleFlight), for: .touchUpInside)
    }
    
    private func setUpTableView() {
        tvFlighLocations.registerCell(ofType: HomeSearchCell.self)
        tvFlighLocations.dataSource = self
        tvFlighLocations.delegate = self
        tvFlighLocations.backgroundColor = .clear
        tvFlighLocations.separatorStyle = .none
        tvFlighLocations.contentInset = .zero
        tvFlighLocations.showsVerticalScrollIndicator = false
    }
    
    @objc func handleFlight() {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "FlightSelectionVC") as! FlightSelectionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeSearchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.homeFlights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvFlighLocations.deque(HomeSearchCell.self, indexPath)
        cell.homeFlightGuide = vm.homeFlights[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "GuideAgencyWebViewVC") as! GuideAgencyWebViewVC
        self.present(vc, animated: true)
    }
}

extension HomeSearchVC: HomeDelegate {
    func onGetFlights() {
        tvFlighLocations.reloadData()
    }
}
