//
//  FunctionTypeVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class FunctionTypeVC: UIViewController {

    @IBOutlet weak var lblReception: UILabel!
    @IBOutlet weak var lblBirthdayCelebration: UILabel!
    @IBOutlet weak var lblMarraige: UILabel!
    @IBOutlet weak var lblRing_ceremony: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var functionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.functionView.addShadow()
    }

    //MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        self.lblTitle.text = "function_type".localized()
        self.lblRing_ceremony.text = "ring_ceremony".localized()
        self.lblMarraige.text = "marriage".localized()
        self.lblBirthdayCelebration.text = "birth_day".localized()
        self.lblReception.text = "reception".localized()
    }
    
    @IBAction func outerViewAction(_ sender: UIControl) {
        self.dismiss(animated: true)
    }
    
    @IBAction func selectInexAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
