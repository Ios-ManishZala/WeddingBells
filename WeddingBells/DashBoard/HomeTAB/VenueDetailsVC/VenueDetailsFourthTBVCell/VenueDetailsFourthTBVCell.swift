//
//  VenueDetailsFourthTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsFourthTBVCell: UITableViewCell {

    @IBOutlet weak var indoorView: UIView!
    @IBOutlet weak var outdoorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.outdoorView.addShadow()
        self.indoorView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
