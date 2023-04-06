//
//  CallVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class CallVC: UIViewController {

    @IBOutlet weak var lblcalling: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblcalling.text = "calling".localized()
        self.lblName.text = "leslie_alexand".localized()
    }

    @IBAction func btnEndCallAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
