//
//  FlightsVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

protocol FlightDelegate {
    func bookmarkFav(for flight: FlightModel)
}

class FlightsVC: UIViewController {
    
    // MARK: TableView
    @IBOutlet weak var tvFlights: UITableView!
    
    // MARK: View
    @IBOutlet weak var viewForSort: UIView!
    @IBOutlet weak var viewForStops: UIView!
    @IBOutlet weak var viewForTime: UIView!
    @IBOutlet weak var viewForAirlines: UIView!
    
    // MARK: UIButton
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var btnTime: UIButton!
    @IBOutlet weak var btnAirlines: UIButton!
    @IBOutlet weak var btnSortBest: UIButton!
    @IBOutlet weak var btbBack: UIButton!
    
    private lazy var vm: FlightsVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        initBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm.getFlights()
    }
    
    private func setUpUI() {
        setUpTableView()
        [viewForSort, viewForStops, viewForTime, viewForAirlines].addBorder(2, color: .systemGray5)
        [viewForSort, viewForStops, viewForTime, viewForAirlines].roundCorner(10)
    }
    
    private func initBinding() {
        btbBack.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    private func setUpTableView() {
        tvFlights.registerCell(ofType: FlightCell.self)
        tvFlights.dataSource = self
        tvFlights.delegate = self
        tvFlights.backgroundColor = .clear
        tvFlights.contentInset = .zero
        tvFlights.showsVerticalScrollIndicator = false
        tvFlights.separatorStyle = .none
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FlightsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvFlights.deque(FlightCell.self, indexPath)
        cell.flight = vm.flights[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard.init(name: .storyboard(of: .Home), bundle: .main)
        let vc = sb.instantiateViewController(withIdentifier: "AgencyVC") as! AgencyVC
        vc.flightName = vm.flights[indexPath.row].flightAgencyName
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FlightsVC: FlightDelegate {
    func bookmarkFav(for flight: FlightModel) {
        vm.bookMark(for: flight)
    }
}

extension FlightsVC: FlightsDelegate {
    func onGetFlights() {
        tvFlights.reloadData()
    }
}
