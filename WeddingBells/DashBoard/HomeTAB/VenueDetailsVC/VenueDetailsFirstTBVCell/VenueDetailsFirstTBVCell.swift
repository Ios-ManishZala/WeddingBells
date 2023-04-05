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
    var onTapMessageAction:(()->()) = { }
    var onTapPhoneAction:(()->()) = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundView.makeRounded()
        self.roundView.addShadow()
        self.roundPhoenView.makeRounded()
        self.roundPhoenView.addShadow()
    }
    
    @IBAction func messageTapAction(_ sender: UIControl) {
        onTapMessageAction()
    }
    
    @IBAction func phoneTapAction(_ sender: UIControl) {
        onTapPhoneAction()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
