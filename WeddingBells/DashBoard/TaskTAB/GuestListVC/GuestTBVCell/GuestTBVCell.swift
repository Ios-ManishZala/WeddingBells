//
//  GuestTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class GuestTBVCell: UITableViewCell {

    @IBOutlet weak var lblGuestList: UILabel!
    @IBOutlet weak var yesmarkImage: UIImageView!
    @IBOutlet weak var yesMarkView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.yesMarkView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
