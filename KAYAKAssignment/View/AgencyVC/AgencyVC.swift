//
//  AgencyVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class AgencyVC: UIViewController {
    
    // MARK: Images
    @IBOutlet weak var imgAgency: UIImageView!
    
    // MARK: Label
    @IBOutlet weak var lblAgencyDestination: UILabel!
    @IBOutlet weak var lblFromToDetstination: UILabel!
    @IBOutlet weak var lblDestinationDate: UILabel!
    @IBOutlet weak var lblAgencyName: UILabel!
    @IBOutlet weak var lblFromDestination: UILabel!
    @IBOutlet weak var lblFromLocationDepatureTime: UILabel!
    @IBOutlet weak var lblToDestination: UILabel!
    @IBOutlet weak var lblToDestinationDepartureTime: UILabel!
    @IBOutlet weak var lblToDestinationFullName: UILabel!
    @IBOutlet weak var lblFromDestinationFullName: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblPolicy: UILabel!
    
    // MARK: TableView
    @IBOutlet weak var tvDeals: DynamicTV!
    
    // MARK: Buttons
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnMoreDeals: UIButton!
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnExpandIcon: UIButton!
    @IBOutlet weak var btnEconomy: UIButton!
    
    // MARK: NSLayoutConstraint
    @IBOutlet weak var heightConstTvDeal: NSLayoutConstraint!
    
    // MARK: ScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    var flightName: String!
    
    var isExpand: Bool = false {
        didSet {
            lblPolicy.isHidden = !isExpand
        }
    }
    
    var isShowMore: Bool = false {
        didSet {
            btnMoreDeals.setTitle(!isShowMore ? "4 more deals for $21" : "Show Less", for: .normal)
            tvDeals.reloadData()
            heightConstTvDeal.constant = tvDeals.contentSize.height
        }
    }
    
    private lazy var vm: AgencyVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initBinding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heightConstTvDeal.constant = tvDeals.contentSize.height
    }
    
    private func setupUI() {
        setUpTableView()
        scrollView.delegate = self
        lblPolicy.isHidden = true
    }
    
    private func initBinding() {
        vm.getDeals()
        vm.getFlight(for: flightName)
        btnMoreDeals.addTarget(self, action: #selector(handleShowMore), for: .touchUpInside)
        btnHeart.addTarget(self, action: #selector(handleFav), for: .touchUpInside)
        btnExpand.addTarget(self, action: #selector(handleExpand), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
    }
    
    private func setUpTableView() {
        tvDeals.registerCell(ofType: DealsTableViewCell.self)
        tvDeals.registerCell(ofType: EmptyCell.self)
        tvDeals.dataSource = self
        tvDeals.backgroundColor = .clear
        tvDeals.contentInset = .zero
        tvDeals.showsVerticalScrollIndicator = false
        tvDeals.separatorStyle = .none
        tvDeals.estimatedRowHeight = 85
        tvDeals.rowHeight = UITableView.automaticDimension
    }
    
    @objc func handleShowMore() {
        isShowMore.toggle()
    }
    
    @objc func handleExpand() {
        isExpand.toggle()
    }
    
    @objc func handleBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func handleFav() {
        vm.bookMarkFlight(for: flightName)
    }
}

extension AgencyVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isShowMore ? vm.deals.count : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvDeals.deque(DealsTableViewCell.self, indexPath)
        cell.deal = vm.deals[indexPath.row]
        cell.contentView.sizeToFit()
        cell.contentView.layoutIfNeeded()
        return cell
    }
}

extension AgencyVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        heightConstTvDeal.constant = tvDeals.contentSize.height
    }
}

extension AgencyVC: AgencyDelegate {
    func onGetDeals() {
        btnMoreDeals.isHidden = !(vm.deals.count > 2)
        tvDeals.reloadData()
        heightConstTvDeal.constant = tvDeals.contentSize.height
    }
    
    func onGetFlight() {
        guard let flight = vm.flight else { return }
        lblAgencyDestination.text = flight.flightStartLocation + flight.flightEndLocation
        lblAgencyName.text = flight.flightAgencyName
        lblFromToDetstination.text = flight.flightStartLocation + flight.flightEndLocation
        lblFromDestination.text = flight.flightStartLocation
        lblToDestination.text = flight.flightEndLocation
        lblFromLocationDepatureTime.text = flight.flightStartTime
        lblToDestinationDepartureTime.text = flight.flightEndTime
        btnHeart.setImage(flight.isFav ? .init(systemName: "heart.circle") : .init(systemName: "heart"), for: .normal)
    }
}
