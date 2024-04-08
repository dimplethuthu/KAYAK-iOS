//
//  OnboardingVC.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 25/03/2024.
//

import UIKit

protocol RegionSelectionDelegate {
    func didSelectRegion(of region: RegionModel)
}

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnUnitedStates: UIButton!
    @IBOutlet weak var btnSuggestedRegion: UIButton!
    @IBOutlet weak var btnMoreOptions: UIButton!
    
    @IBOutlet weak var tvRegions: DynamicTV!
    
    @IBOutlet weak var heightConstTv: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private lazy var vm = OnboardingVM(delegate: self)
    
    
    var isMoreOption: Bool = false {
        didSet {
            tvRegions.reloadData()
            heightConstTv.constant = tvRegions.contentSize.height
            btnMoreOptions.setTitle(isMoreOption ? "Less Options" : "More Options", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.getRegions()
        setUpUI()
        initBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        heightConstTv.constant = tvRegions.contentSize.height
    }
    
    func initBindings() {
        btnContinue.addTarget(self, action: #selector(onTapContinue), for: .touchUpInside)
        btnMoreOptions.addTarget(self, action: #selector(handleMoreOption), for: .touchUpInside)
    }
    
    @objc func onTapContinue() {
        (navigationController as? RootNC)?.goToHome()
    }
    
    @objc func handleMoreOption() {
        isMoreOption.toggle()
    }
    
    private func setUpUI() {
        scrollView.delegate = self
        setUpTableView()
    }
    
    private func setUpTableView() {
        tvRegions.registerCell(ofType: RegionSelectionCell.self)
        tvRegions.registerCell(ofType: EmptyCell.self)
        tvRegions.dataSource = self
        tvRegions.delegate = self
        tvRegions.backgroundColor = .clear
        tvRegions.contentInset = .zero
        tvRegions.showsVerticalScrollIndicator = false
        tvRegions.separatorStyle = .none
        tvRegions.estimatedRowHeight = 140
        tvRegions.rowHeight = UITableView.automaticDimension
    }
    
}

extension OnboardingVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isMoreOption ? vm.regions.count: 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvRegions.deque(RegionSelectionCell.self, indexPath)
        cell.region = vm.regions[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        heightConstTv.constant = tvRegions.contentSize.height
    }
}

extension OnboardingVC: RegionSelectionDelegate {
    func didSelectRegion(of region: RegionModel) {
        vm.updateRegion(with: region)
    }
}

extension OnboardingVC: OnBoardingDelegate {
    func onGetRegion() {
        btnMoreOptions.isHidden = vm.regions.count < 2
        tvRegions.reloadData()
    }
    
    func isRegionSelected() {
        btnContinue.isEnabled = vm.isAtLeastOneRegionSelected
        btnContinue.backgroundColor = vm.isAtLeastOneRegionSelected ? .primary : .systemGray5
        tvRegions.reloadData()
    }
}
