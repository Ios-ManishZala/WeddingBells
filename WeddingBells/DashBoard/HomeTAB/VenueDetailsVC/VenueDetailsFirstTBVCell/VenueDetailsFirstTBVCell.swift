//
//  VenueDetailsFirstTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsFirstTBVCell: UITableViewCell {

    @IBOutlet weak var roundView:UIView!
    @IBOutlet weak var roundPhoenView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundView.makeRounded()
        self.roundView.addShadow()
        self.roundPhoenView.makeRounded()
        self.roundPhoenView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
