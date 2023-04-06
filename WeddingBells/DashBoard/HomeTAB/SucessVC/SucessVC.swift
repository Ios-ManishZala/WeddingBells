//
//  SucessVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class SucessVC: UIViewController {

    @IBOutlet weak var btnBacktohome: UIButton!
    @IBOutlet weak var lblSucesstitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - update langauge
     
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         setValueBaseOnLanguage()
     }

     func setValueBaseOnLanguage(){
         self.lblSucesstitle.text = "sucess_message".localized()
         self.btnBacktohome.setTitle("back_to_home".localized(), for: .normal)
     }
    
    @IBAction func btnBacktoHomeAction(_ sender: UIButton) {
        self.navigateToHome()
    }
}
