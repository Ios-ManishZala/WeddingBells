//
//  NotifiactionVC.swift
//  RentalCar
//
//  Created by Keyur Baravaliya on 18/08/22.
//

import UIKit

class NotifiactionVC: UIViewController, UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate{
    

    @IBOutlet weak var emptyNotificationView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var notificationDetaillist = WeddingDecorData.NotificationData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: NotificationCell.self)
        self.customNav.titleLabel.text = "Notification"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationDetaillist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationCell
        cell.Setup(notificationDetaillist[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            self.notificationDetaillist.remove(at: indexPath.row)
                if self.notificationDetaillist.count == 0{
                    emptyNotificationView.isHidden = false
            }
            self.tableView.reloadData()
        }
    }
}
