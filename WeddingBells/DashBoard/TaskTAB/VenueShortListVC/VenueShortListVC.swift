//
//  VenueShortListVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class VenueShortListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var weddingdecorData = WeddingDecorData.getWeddingDecorData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customNav.titleLabel.text = "Venue".localized()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: VenueShortlistTBVCell.self)
    }
}

extension VenueShortListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weddingdecorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: VenueShortlistTBVCell.self)
        cell.vendorShorlistData = self.weddingdecorData[indexPath.row]
        cell.onTapMessageAction = {
            self.pushVC(UserChatVC())
        }
        cell.onTapCallAction = {
            self.pushVC(CallVC())
        }
        cell.onTapFinalisedAction = {
            self.pushVC(CheckavailabiltyVC())
        }
        return cell
    }
}
