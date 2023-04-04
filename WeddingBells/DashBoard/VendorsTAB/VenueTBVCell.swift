//
//  VenueTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class VenueTBVCell: UITableViewCell {

    @IBOutlet weak var venueView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblVenueLocationName: UILabel!
    @IBOutlet weak var venueImage: UIImageView!
    var famousDecorData:DecorPackageModel?{
        didSet{
            self.lblVenueLocationName.text = famousDecorData?.decorpackageName
            self.lblAmount.text = famousDecorData?.decorAmount
            self.venueImage.image = famousDecorData?.decorImageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.numberView.makeRounded()
        self.messageView.makeRounded()
        self.venueView.addShadow()
        self.numberView.addShadow()
        self.messageView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
