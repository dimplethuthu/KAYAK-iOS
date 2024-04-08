//
//  DealsTableViewCell.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class DealsTableViewCell: UITableViewCell {
    
    // MARK: Label
    @IBOutlet weak var lblDealTitle: UILabel!
    @IBOutlet weak var lblDealPrice: UILabel!
    
    // MARK: Button
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnViewDeal: UIButton!
    
    var deal: DealModel! {
        didSet {
            lblDealTitle.text = deal.dealName
            lblDealPrice.text = deal.dealCost
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
