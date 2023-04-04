//
//  UserChatVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class UserChatVC: UIViewController {

    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var sendeView: UIView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var messageList:[Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.sendeView.makeRounded()
        self.sendeView.addShadow()
        self.messageView.addShadow()
        self.customNav.titleLabel.text = "Blue See Banquets"
        self.customNav.btnShare.setImage(UIImage.init(named: "ic_blackphone"), for: .normal)
        self.customNav.btnShare.isHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: ReciverMessageTBVCell.self)
        tableView.register(of: SenderMessageTBVCell.self)
    }

}

extension UserChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leftCell = tableView.dequeueReusableCell(withType: ReciverMessageTBVCell.self)
        leftCell.setup(messageList[indexPath.row])
        return leftCell
    }
}
