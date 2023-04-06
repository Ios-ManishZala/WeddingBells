//
//  ContactUsVC.swift
//  HomeService
//
//  Created by apple on 08/01/23.
//

import UIKit

class ContactUsVC: UIViewController,UITextViewDelegate {

    @IBOutlet weak var lblMailus: UILabel!
    @IBOutlet weak var lblCallus: UILabel!
    @IBOutlet weak var lblCustomerinstruction: UILabel!
    @IBOutlet weak var lblWriteus: UILabel!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtEmailid: UITextField!
    @IBOutlet weak var lblEmailid: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameView.addShadow()
        self.emailView.addShadow()
        self.messageView.addShadow()
        self.txtView.delegate = self
        self.txtView.textColor = UIColor.placeholderGray
    }
    
    //MARK: - Lanuguage Update
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setValueBaseOnLanguage()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setValueBaseOnLanguage(){
        self.lblWriteus.text = "write_us".localized()
        self.lblCustomerinstruction.text = "customer_instruction".localized()
        self.btnSend.setButtonTitleAndFunctionality("send".localized())
        self.lblName.text = "name".localized()
        self.lblEmailid.text = "email_address".localized()
        self.lblMessage.text = "message".localized()
        self.txtName.placeholder = "enter_your_name".localized()
        self.txtEmailid.placeholder = "enter_your_email_id".localized()
        self.txtView.text = "write_message_here".localized()
        self.lblCallus.text = "call_us".localized()
        self.lblMailus.text = "mail_us".localized()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if  txtView.textColor == UIColor.placeholderGray{
            txtView.text = nil
            txtView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if  txtView.text.isEmpty{
            txtView.text = "write_message_here".localized()
            txtView.textColor = .placeholderGray
        }
    }
}
