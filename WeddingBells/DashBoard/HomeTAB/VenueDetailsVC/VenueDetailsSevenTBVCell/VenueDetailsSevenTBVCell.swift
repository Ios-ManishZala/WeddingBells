//
//  VenueDetailsSevenTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsSevenTBVCell: UITableViewCell {

    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var imageCustomer: UIImageView!
    var reviewData:ReviewModel?{
        didSet{
            self.lblUsername.text = reviewData?.userName
            self.imageCustomer.image = reviewData?.userImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
