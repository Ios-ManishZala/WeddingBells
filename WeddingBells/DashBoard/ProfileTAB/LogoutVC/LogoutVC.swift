//
//  LogoutVC.swift
//  SmartHome
//
//  Created by Keyur Baravaliya on 18/01/23.
//

import UIKit

class LogoutVC: UIViewController {

    @IBOutlet weak var imageLogout: UIImageView!
    @IBOutlet weak var dashedLine: UIView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var lblLoginSubtitle: UILabel!
    var isFromRemoveVC:Bool = false
    var onTapRemoveAction:(()->()) = { }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myView.addShadow()
        
        
        if isFromRemoveVC == true{
            self.lblLoginSubtitle.text = "remove_subtitle".localized()
            self.imageLogout.image = UIImage.init(named: "ic_delete")
            self.btnLogout.setTitle("yes".localized(), for: .normal)
        }else{
            self.lblLoginSubtitle.text = "logout_subtitle".localized()
            self.imageLogout.image = UIImage.init(named: "ic_logout")
            self.btnLogout.setTitle("logout".localized(), for: .normal)
        }
        self.btnCancel.setTitle("cancel".localized(), for: .normal)
    }
    
    @IBAction func btnCancelAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnLogoutAction(_ sender: UIButton) {
        if isFromRemoveVC == true{
             onTapRemoveAction()
        }else{
            self.navigateToLogin()
        }
    }
}
