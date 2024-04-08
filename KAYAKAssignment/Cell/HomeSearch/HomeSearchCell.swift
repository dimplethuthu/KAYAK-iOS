//
//  HomeSearchCell.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class HomeSearchCell: UITableViewCell {
    
    // MARK: Label
    @IBOutlet weak var lblMainTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // MARK: UIImageView
    @IBOutlet weak var imgTripLocation: UIImageView!
    
    var homeFlightGuide: HomeFlightGuideModel! {
        didSet {
            lblDescription.text = homeFlightGuide.guideDescription
            lblMainTitle.text = homeFlightGuide.guideName
            imgTripLocation.image = .init(named: homeFlightGuide.guideLocationImage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
