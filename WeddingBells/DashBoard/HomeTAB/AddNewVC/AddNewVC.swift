//
//  AddNewVC.swift
//  Salon
//
//  Created by Keyur Baravaliya on 23/09/22.
//

import UIKit
import YRPayment

class AddNewVC: UIViewController {

    @IBOutlet weak var cvvView: UIView!
    @IBOutlet weak var exipryView: UIView!
    @IBOutlet weak var cardnumberView: UIView!
    @IBOutlet weak var cardtxtView: UIView!
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var btnPayment: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCvv: UITextField!
    @IBOutlet weak var txtValidity: UITextField!
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var lblcardName: UILabel!
    @IBOutlet weak var lblCardNumber: UILabel!
    @IBOutlet weak var lblMMYY: UILabel!
    @IBOutlet weak var lblCvv: UILabel!
    var card: YRPaymentCreditCard!
    var payment: YRPayment!
    @IBOutlet weak var navigationView: TabNavigationBar!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Creating a Credit Card object
        card = YRPaymentCreditCard()
        card.backgroundColor = .mainColor
        
        // Creating Payment object with our card
        payment = YRPayment(creditCard: card)

        // Setting Credit Card position
        cardView.addSubview(card)
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 0),
            card.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 0),
            card.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0),
            card.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 0),
        ])
        
        // textField Assign
        payment.holderNameTextField = self.txtName
        payment.numberTextField = self.txtNumber
        payment.cryptogramTextField = self.txtCvv
        payment.validityTextField = self.txtValidity
        
        self.cardtxtView.addShadow()
        self.cardnumberView.addShadow()
        self.cvvView.addShadow()
        self.exipryView.addShadow()
       
    }
   // MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setValueBaseOnLanguage()
    }

    func setValueBaseOnLanguage(){
        self.navigationView.titleLabel.text = "paymet_informaion".localized()
        self.lblCvv.text = "cvv_code".localized()
        self.lblMMYY.text = "expire_date".localized()
        self.lblCardNumber.text = "card_number".localized()
        self.lblcardName.text = "card_holder_name".localized()
        self.txtName.placeholder = "enter_your_name".localized()
        self.txtNumber.placeholder = "xxxxxxxxxxxxx".localized()
        self.txtValidity.placeholder = "xx/xx".localized()
        self.txtCvv.placeholder = "xxx".localized()
        self.btnPayment.setButtonTitleAndFunctionality("payment".localized())
    }
    
    @IBAction func btnPaymentAction(_ sender: UIButton) {
        self.pushVC(SucessVC())
    }
}
