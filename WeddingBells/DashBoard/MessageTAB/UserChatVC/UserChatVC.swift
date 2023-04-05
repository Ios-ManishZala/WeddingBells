//
//  UserChatVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class UserChatVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var sendeView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var messageList = WeddingDecorData.MessageListData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sendeView.makeRounded()
        self.sendeView.addShadow()
        self.messageView.addShadow()
        self.customNav.titleLabel.text = "Blue See Banquets"
        self.customNav.btnShare.setImage(UIImage.init(named: "ic_blackphone"), for: .normal)
        self.customNav.btnShare.isHidden = false
        self.customNav.onTapShareAction = {
            self.pushVC(CallVC())
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: ReciverMessageTBVCell.self)
        tableView.register(of: SenderMessageTBVCell.self)
        txtMessage.delegate = self
    }
    
    @IBAction func btnSendAction(_ sender: UIButton) {
        if txtMessage.text == "" {
            
        }else{
            self.messageList.append(Message(message: txtMessage.text!, Time: "2.0 am"))
            self.tableView.reloadData()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if  self.txtMessage.textColor == .mainColor {
            self.txtMessage.text = ""
            self.txtMessage.textColor = .black
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  self.txtMessage.textColor == .black {
            self.txtMessage.text = "Type your text here...."
            self.txtMessage.textColor = .mainColor
        }
    }
}

extension UserChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5 {
            let leftCell = tableView.dequeueReusableCell(withType: ReciverMessageTBVCell.self)
            leftCell.setup(messageList[indexPath.row])
            return leftCell
        }else{
            let rightCell = tableView.dequeueReusableCell(withType: SenderMessageTBVCell.self)
            rightCell.setup(messageList[indexPath.row])
            return rightCell
        }
    }
}
