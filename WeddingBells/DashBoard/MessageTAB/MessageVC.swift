//
//  MessageVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class MessageVC: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var txtSerch: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var userChatDetails = WeddingDecorData.MessageData()
    var serchResult = WeddingDecorData.MessageData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: MessageTBVCell.self)
        self.searchView.addShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.lblMessage.text = "message".localized()
        self.txtSerch.placeholder = "search".localized()
        self.tableView.reloadData()
    }

    // MARK: - filter array
    
    @IBAction func txtserchAction(_ sender: Any) {
        if let getSerchText = txtSerch.text,getSerchText.isEmpty == false{
            self.userChatDetails = self.serchResult.filter({ String in
                return ((String.name).lowercased().contains(getSerchText.lowercased()) == true)
            })
        }
        else {
            self.userChatDetails = self.serchResult
        }
        self.tableView.reloadData()
    }
}

extension MessageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userChatDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageCell = self.tableView.dequeueReusableCell(withType: MessageTBVCell.self)
        messageCell.userDeiatlsData = self.userChatDetails[indexPath.row]
        return messageCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushVC(UserChatVC())
    }
}
