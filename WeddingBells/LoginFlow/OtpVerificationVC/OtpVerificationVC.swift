//
//  OtpVerificationVC.swift
//  StoryTime
//
//  Created by Keyur Baravaliya on 22/12/22.
//

import UIKit
import OTPFieldView
import ProgressHUD

class OtpVerificationVC: UIViewController {
    
    @IBOutlet weak var btnResend: UIButton!
    @IBOutlet weak var otpTextFieldView: OTPFieldView!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var lblConfirmation: UILabel!
    @IBOutlet weak var lblOtpVerification: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupOtpView()
        self.setValueBaseOnLanguage()
        self.setupProgressBar()
    }

    func setValueBaseOnLanguage(){
        self.lblOtpVerification.text = "otp_verification".localized()
        self.lblConfirmation.text = "otp_subtitle".localized()
        self.btnVerify.setButtonTitleAndFunctionality("verify".localized())
        self.btnResend.setTitle("resend".localized(), for: .normal)
    }
    
    
    //MARK: - otpSetup
    
    func setupOtpView(){
            self.otpTextFieldView.fieldsCount = 4
            self.otpTextFieldView.fieldBorderWidth = 1.5
            self.otpTextFieldView.defaultBorderColor = .clear
            self.otpTextFieldView.cursorColor = UIColor.mainColor
            self.otpTextFieldView.fieldFont = UIFont(name: "Montserrat-SemiBold", size: 20)!
            self.otpTextFieldView.displayType = .roundedCorner
            self.otpTextFieldView.fieldSize = 50
            self.otpTextFieldView.separatorSpace = 20
            self.otpTextFieldView.shouldAllowIntermediateEditing = false
            self.otpTextFieldView.delegate = self
            self.otpTextFieldView.initializeUI()
            self.otpTextFieldView.defaultBackgroundColor = UIColor.white
            self.otpTextFieldView.filledBackgroundColor = UIColor.white
            self.otpTextFieldView.addShadow()
        }

    
    @IBAction func btnVerifyAction(_ sender: UIButton) {
        ProgressHUD.show("Please Wait")
        
        DispatchQueue.main.asyncAfter(deadline: .now() +  2.0, execute: {
            ProgressHUD.dismiss()
            self.pushVC(TabBarVC())
        })
    }
}

extension OtpVerificationVC: OTPFieldViewDelegate {
    
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
}
