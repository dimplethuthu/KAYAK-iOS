//
//  RegionSelectionCell.swift
//  KAYAKAssignment
//
//  Created by Zin Thu Htun on 26/03/2024.
//

import UIKit

class RegionSelectionCell: UITableViewCell {
    
    //MARK: Label
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblLocationDomain: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    
    // MARK: Button
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var btnCheckIcon: UIButton!
    
    // MARK: Image
    @IBOutlet weak var imgFlag: UIImageView!
    
    var delegate: RegionSelectionDelegate?
    
    var region: RegionModel! {
        didSet {
            lblTitle.text = region.mainTitle
            lblLocation.text = region.locationTitle
            lblLocationDomain.text = region.locationDomain
            lblCurrency.text = region.currency
            btnCheckIcon.setImage(region.isCheck ? .checkFill : .check, for: .normal)
            imgFlag.image = .init(named: region.locationImage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        initBinding()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initBinding() {
        btnCheck.addTarget(self, action: #selector(handleCheck), for: .touchUpInside)
    }
    
    @objc func handleCheck() {
        delegate?.didSelectRegion(of: region)
    }
    
}
