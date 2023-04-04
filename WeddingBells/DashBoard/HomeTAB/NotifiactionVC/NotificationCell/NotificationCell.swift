//
//  NotificationCell.swift
//  RentalCar
//
//  Created by Keyur Baravaliya on 18/08/22.
//

import UIKit

class NotificationCell: UITableViewCell {

    @IBOutlet weak var notificationRoundView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        notificationView.addShadow()
        self.notificationRoundView.makeRounded()
        self.notificationRoundView.addShadow()
    }

    func Setup(_ slide : NotificationDetails){
        lblTitle.text = slide.title
        lblDescription.text = slide.Description
        lblTime.text = slide.time
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }
    
}
