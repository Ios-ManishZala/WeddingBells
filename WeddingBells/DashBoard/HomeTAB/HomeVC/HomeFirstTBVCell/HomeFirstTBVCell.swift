//
//  HomeFirstTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class HomeFirstTBVCell: UITableViewCell {

    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    var onTapNotificationAction:(()->()) = { }
    var onTapSelectCountryAction:(()->()) = { }
    var onTapSearchAction:(()->()) = { }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.searchView.addShadow()
    }
    
    @IBAction func btnSearchAction(_ sender: UIButton) {
        onTapSearchAction()
    }
    
    @IBAction func btnNotificationAction(_ sender: UIButton) {
        onTapNotificationAction()
    }
    
    @IBAction func btnSelectCityAction(_ sender: UIButton) {
        onTapSelectCountryAction()
    }
}
