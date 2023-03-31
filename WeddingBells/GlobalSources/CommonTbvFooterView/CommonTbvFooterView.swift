//
//  CommonTbvFooterView.swift
//  Salon
//
//  Created by Keyur Baravaliya on 20/09/22.
//

import UIKit

class CommonTbvFooterView: UITableViewHeaderFooterView {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var btnAddnew: UIButton!
    @IBOutlet weak var btnBookAppointment: UIButton!
    var onTapBookAppointment:(()->())? = nil
    var onTapAddNew:(()->())? = nil
    
    
    @IBAction func btnBookAppointment(_ sender: UIButton) {
        if let getAct = self.onTapBookAppointment{
            getAct()
        }
    }
    
    @IBAction func btnAddNewAction(_ sender: UIButton) {
        if let getAct = self.onTapAddNew{
            getAct()
        }
    }
}
