//
//  ProfileTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 06/04/23.
//

import UIKit

class ProfileTBVCell: UITableViewCell {

    @IBOutlet weak var imageLine: UIView!
    @IBOutlet weak var imageProfiletag: UIImageView!
    @IBOutlet weak var lblProfiletagName: UILabel!
    var profileDetailsData:ProfilSettingData?{
        didSet{
            self.imageProfiletag.image = profileDetailsData?.image
            self.lblProfiletagName.text = profileDetailsData?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
