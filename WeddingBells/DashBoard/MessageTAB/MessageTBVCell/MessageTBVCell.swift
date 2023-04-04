//
//  MessageTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class MessageTBVCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLastMessage: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var userDeiatlsData:ChatDetails?{
        didSet{
            self.lblTime.text = userDeiatlsData?.time
            self.lblUserName.text = userDeiatlsData?.name
            self.lblLastMessage.text = userDeiatlsData?.message
            self.userImage.image = userDeiatlsData?.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.userImage.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
