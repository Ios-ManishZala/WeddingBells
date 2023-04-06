//
//  TermAndConditionVC.swift
//  RentalCar
//
//  Created by Keyur Baravaliya on 19/08/22.
//

import UIKit

class TermAndConditionVC: UIViewController {
    
    @IBOutlet weak var navigationView: TabNavigationBar!
    @IBOutlet weak var lblInfy3: UILabel!
    @IBOutlet weak var lblInfy2: UILabel!
    @IBOutlet weak var lblInfy: UILabel!
    @IBOutlet weak var lblInfy5: UILabel!
    @IBOutlet weak var lblinfy4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationView.titleLabel.text = "about_us".localized()
    }
}
