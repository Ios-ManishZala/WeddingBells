//
//  VenueShortlistTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class VenueShortlistTBVCell: UITableViewCell {

    @IBOutlet weak var venueView: UIView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblVenueName: UILabel!
    @IBOutlet weak var imgaeVenue: UIImageView!
    var vendorShorlistData:DecorPackageModel? {
        didSet{
            self.imgaeVenue.image = vendorShorlistData?.decorImageName
            self.lblVenueName.text = vendorShorlistData?.decorpackageName
            self.lblAmount.text = "$150"
        }
    }
    var onTapFinalisedAction:(()->()) = { }
    var onTapCallAction:(()->()) = { }
    var onTapMessageAction:(()->()) = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.venueView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnFinalisedAction(_ sender: UIButton) {
        onTapFinalisedAction()
    }
    
    @IBAction func btnCallAction(_ sender: UIButton) {
        onTapCallAction()
    }
    
    @IBAction func btnMessageAction(_ sender: UIButton) {
        onTapMessageAction()
    }
}
