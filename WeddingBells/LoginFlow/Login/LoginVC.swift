//
//  LoginVC.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 04/10/22.
//

import UIKit
import CountryList

class LoginVC: UIViewController,CountryListDelegate {

    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var lblPlease: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblFlag: UILabel!
    @IBOutlet weak var txtNumber: UITextField!
    var countryList = CountryList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryList.delegate = self
        self.numberView.addShadow()
        self.lblFlag.text = "+91"
    }
    
    //MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    func setValueBaseOnLanguage(){
        self.txtNumber.placeholder = "enter_number".localized()
        self.lblLogin.text = "login".localized()
        self.lblPlease.text = "intrection".localized()
        self.lblCountryName.text = "country_name".localized()
        self.btnLogin.setButtonTitleAndFunctionality("login".localized())
    }
    
    
    //MARK: - open countryList
    
    func selectedCountry(country: Country) {
        self.lblFlag.text = "+\(country.phoneExtension)"
    }
    
    @IBAction func presentCountryList(_ sender: Any) {
        let navController = UINavigationController(rootViewController: countryList)
        self.present(navController, animated: true, completion: nil)
    }
    
    @IBAction func btnLoginAction(_ sender: UIButton) {
        self.pushVC(RegisterVC())
    }
}


