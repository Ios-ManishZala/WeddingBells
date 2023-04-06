//
//  FAQsTBVcell.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 11/10/22.
//

import UIKit

class FAQsTBVcell: UITableViewCell {

    @IBOutlet weak var mainContatintView: UIView!
    @IBOutlet weak var imageUpAndDown: UIImageView!
    @IBOutlet weak var lblTitleCategories: UILabel!
    @IBOutlet weak var headingView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainContatintView.addShadow()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
