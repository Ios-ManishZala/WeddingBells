//
//  VendoreTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class VendoreTBVCell: UITableViewCell {

    @IBOutlet weak var vrndorView: UIView!
    @IBOutlet weak var lblVendortype: UILabel!
    @IBOutlet weak var lblVendorName: UILabel!
    @IBOutlet weak var vendorImage: UIImageView!
    var vendorData:VendorModel? {
        didSet{
            self.vendorImage.image = vendorData?.vendorImage
            self.lblVendortype.text = vendorData?.vendorType
            self.lblVendorName.text = vendorData?.vendorName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.vrndorView.addShadow()
        self.vendorImage.makeLeftTopandBottomRound(10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
