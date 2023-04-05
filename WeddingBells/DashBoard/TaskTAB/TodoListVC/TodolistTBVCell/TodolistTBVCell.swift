//
//  TodolistTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class TodolistTBVCell: UITableViewCell {

    @IBOutlet weak var lblListDetails: UILabel!
    @IBOutlet weak var yesmarkImage: UIImageView!
    @IBOutlet weak var yesmarkBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.yesmarkBgView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
