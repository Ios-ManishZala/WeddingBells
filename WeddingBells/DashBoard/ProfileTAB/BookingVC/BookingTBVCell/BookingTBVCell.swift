//
//  BookingTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 06/04/23.
//

import UIKit

class BookingTBVCell: UITableViewCell {

    @IBOutlet weak var dashedLine: UIView!
    @IBOutlet weak var venueTitle: UILabel!
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
    var onTapRemoveAction:(()->()) = { }
    var onTapCallAction:(()->()) = { }
    var onTapMessageAction:(()->()) = { }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.venueView.addShadow()
        self.dashedLine.makeDashedBorderLine(color: .mainColor, strokeLength: 3, gapLength: 2, width: 1, orientation: .horizontal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnRemoveAction(_ sender: UIControl) {
        onTapRemoveAction()
    }
    
    @IBAction func btnCallAction(_ sender: UIControl) {
        onTapCallAction()
    }
    
    @IBAction func btnMessageAction(_ sender: UIControl) {
        onTapMessageAction()
    }
}
