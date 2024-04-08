//
//  FlightCell.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class FlightCell: UITableViewCell {
    
    // MARK: Label
    @IBOutlet weak var lblFlightStartTime: UILabel!
    @IBOutlet weak var lblFlihhtEndTime: UILabel!
    @IBOutlet weak var lblFlightFromLocation: UILabel!
    @IBOutlet weak var lblFlightToLocation: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblFlightCost: UILabel!
    @IBOutlet weak var lblNumberOfSite: UILabel!
    @IBOutlet weak var lblFlightAgency: UILabel!
    
    // MARK: Button
    @IBOutlet weak var btnWish: UIButton!
    @IBOutlet weak var btnWishIcon: UIButton!
    
    // MARK: StackView
    @IBOutlet weak var stackViewBestCheap: UIStackView!
    @IBOutlet weak var stackViewForMiniImage: UIStackView!
    
    // MARK: View
    @IBOutlet weak var viewForBest: UIView!
    @IBOutlet weak var viewForCheapest: UIView!
    
    // MARK: ImageView
    @IBOutlet weak var imgAgency: UIImageView!
    
    var delegate: FlightDelegate?
    
    var flight: FlightModel! {
        didSet {
            lblFlightStartTime.text = flight.flightStartTime
            lblFlihhtEndTime.text = flight.flightEndTime
            lblFlightFromLocation.text = flight.flightStartLocation
            lblFlightToLocation.text = flight.flightEndLocation
            lblDuration.text = flight.flightDuration
            lblFlightCost.text = flight.flightOverallCost.toMMKCurrency
            lblFlightAgency.text = flight.flightAgencyName
            lblNumberOfSite.text = String(flight.flightSites) + "Sites"
            viewForBest.isHidden = !flight.isBest
            viewForCheapest.isHidden = !flight.isCheapest
            imgAgency.image = .init(named: flight.flightAgencyImage)
            btnWishIcon.setImage(flight.isFav ? .init(systemName: "heart.circle") : .init(systemName: "heart"), for: .normal)
            btnWishIcon.tintColor = .secondary
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initBinding()
    }
    
    private func initBinding() {
        btnWish.addTarget(self, action: #selector(handleWish), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func handleWish() {
        delegate?.bookmarkFav(for: flight)
    }
    
}
