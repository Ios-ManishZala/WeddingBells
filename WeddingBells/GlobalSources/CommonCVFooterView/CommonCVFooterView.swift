//
//  CommonCVFooterView.swift
//  SmartHome
//
//  Created by Keyur Baravaliya on 11/01/23.
//

import UIKit

class CommonCVFooterView: UICollectionReusableView {

    @IBOutlet weak var btnAddnewDevice: UIButton!
    var onTapAddnewDeviceACtion:(()->())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if getAppLanguagesCode() == "ar" {
            self.btnAddnewDevice.imageEdgeInsets.left = 20
        }else{
            self.btnAddnewDevice.imageEdgeInsets.right = 20
        }
    }
    
    @IBAction func btnAddnewAction(_ sender: UIButton) {
        if let getAct = self.onTapAddnewDeviceACtion {
            getAct()
        }
    }
    
}
