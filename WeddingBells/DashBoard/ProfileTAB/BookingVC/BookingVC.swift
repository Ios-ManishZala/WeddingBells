//
//  BookingVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 06/04/23.
//

import UIKit

class BookingVC: UIViewController {

    @IBOutlet weak var emptyBookingView: UIView!
    @IBOutlet weak var lblNobooking: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var weddingdecorData = WeddingDecorData.getWeddingDecorData()
    var weddingBookingTitle = [
        "Venue booking",
        "Catering booking",
        "Photographers",
        "Bridal gown",
        "Makup artist"
    ]
    var isFromRemoveVC:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.customNav.titleLabel.text = "booking".localized()
        self.lblNobooking.text = "no_booking_yet".localized()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: BookingTBVCell.self)
    }
}

extension BookingVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weddingdecorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: BookingTBVCell.self)
        cell.vendorShorlistData = self.weddingdecorData[indexPath.row]
        cell.venueTitle.text = self.weddingBookingTitle[indexPath.row]
        cell.onTapMessageAction = {
            self.pushVC(UserChatVC())
        }
        cell.onTapCallAction = {
            self.pushVC(CallVC())
        }
        cell.onTapRemoveAction = {
            let vc = LogoutVC()
            vc.onTapRemoveAction = {
                self.dismiss(animated: true) {
                    self.weddingdecorData.remove(at: indexPath.row)
                    self.weddingBookingTitle.remove(at: indexPath.row)
                    self.tableView.reloadData()
                    
                    if self.weddingdecorData.count == 0 {
                        self.emptyBookingView.isHidden = false
                    }
                }
            }
            self.isFromRemoveVC = true
            vc.isFromRemoveVC = self.isFromRemoveVC
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
        return cell
    }
    
}
