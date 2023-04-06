//
//  PrivacyPolicyVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 06/04/23.
//

import UIKit

class PrivacyPolicyVC: UIViewController {

    @IBOutlet weak var lbltermofuse: UILabel!
    @IBOutlet weak var lblPrivacypolicy: UILabel!
    @IBOutlet weak var customNav: TabNavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.customNav.titleLabel.text = "privacy_policy".localized()
        self.lblPrivacypolicy.text = "privacy_policy".localized()
        self.lbltermofuse.text = "terms_of_use".localized()
    }
}
