//
//  RegisterVC.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 04/10/22.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var lblRegisterSubTitle: UILabel!
    @IBOutlet weak var lblRegisterTitle: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var mailView: UIView!
    @IBOutlet weak var lblEmailaddress: UILabel!
    @IBOutlet weak var lblMobilenumber: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameView.addShadow()
        self.numberView.addShadow()
        self.mailView.addShadow()
    }
    
    //MARK: - update language
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        self.lblRegisterTitle.text = "register_title".localized()
        self.lblRegisterSubTitle.text = "register_subTitle".localized()
        self.txtName.placeholder = "enter_your_name".localized()
        self.txtEmail.placeholder = "enter_your_email_id".localized()
        self.txtNumber.placeholder = "enter_number".localized()
        self.btnRegister.setButtonTitleAndFunctionality("register".localized())
        self.lblName.text = "name".localized()
        self.lblEmailaddress.text = "email_address".localized()
        self.lblMobilenumber.text = "mobile_number".localized()
    }
    
    @IBAction func btnRegisterAction(_ sender: UIButton) {
        self.pushVC(OtpVerificationVC())
    }
}
