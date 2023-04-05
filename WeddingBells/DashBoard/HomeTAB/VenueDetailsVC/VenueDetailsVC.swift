//
//  VenueDetailsVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsVC: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var leftCornerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var headerDetails = ["","About","Payment","Areas availabel","Albums(16)","Similar venue’s","Review"]
    var venueDescAttributedString: NSMutableAttributedString? = nil
    var reviewData = WeddingDecorData.getUserReviewData()
    var isFromWeddingPackagedetails:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isFromWeddingPackagedetails == true{
            self.imageview.image = UIImage(named: "ic_wediingDecor6")
        }else{
            self.imageview.image = UIImage(named: "ic_venuefront")
        }
        self.leftCornerView.makeTopLeft(5)
        self.customNav.btnBack.setImage(UIImage(named: "ic_white"), for: .normal)
        self.customNav.titleLabel.text = ""
        self.customNav.btnHeart.isHidden = false
        self.customNav.btnShare.isHidden = false
        self.customNav.onTapHeartAction = { sender in
            sender.isSelected = !sender.isSelected
        }
        self.initTableview()
       
    }
        
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func initTableview(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: VenueDetailsFirstTBVCell.self)
        tableView.register(of: VenueDetailsSecondTBVCell.self)
        tableView.register(of: VenueDetailsThirdTBVCell.self)
        tableView.register(of: VenueDetailsFourthTBVCell.self)
        tableView.register(of: VenueDetailsFiveTBVCell.self)
        tableView.register(of: VenueDetailsSixTBVCell.self)
        tableView.register(of: VenueDetailsSevenTBVCell.self)
        tableView.registerHeaderFooterView(of: CommonTbvHeaderView.self)
    }
    
    @IBAction func btnCheckAvailblityAction(_ sender: UIButton) {
        self.pushVC(CheckavailabiltyVC())
    }
    
}

//MARK: - Datasource.

extension VenueDetailsVC: UITableViewDelegate, UITableViewDataSource,UITextViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.headerDetails.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 6 ? self.reviewData.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let venueFirstCell = self.tableView.dequeueReusableCell(withType: VenueDetailsFirstTBVCell.self)
            venueFirstCell.onTapPhoneAction = {
                self.pushVC(CallVC())
            }
            venueFirstCell.onTapMessageAction = {
                self.pushVC(UserChatVC())
            }
            return venueFirstCell
        }else if indexPath.section == 1{
            let venueSecondCell = self.tableView.dequeueReusableCell(withType: VenueDetailsSecondTBVCell.self)
            venueSecondCell.onTapReadMoreAction = {
                venueSecondCell.readMoreView.isHidden = true
                venueSecondCell.readLessView.isHidden = false
                self.tableView.reloadData()
            }
            venueSecondCell.onTapReadLessAction = {
                venueSecondCell.readLessView.isHidden = true
                venueSecondCell.readMoreView.isHidden = false
                UIView.transition(with: tableView,
                                  duration: 0.35,
                                  options: .transitionCrossDissolve,
                                  animations: { self.tableView.reloadData() })
            }
            return venueSecondCell
        }else if indexPath.section == 2{
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsThirdTBVCell.self)
            return venueCell
        }else if indexPath.section == 3 {
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsFourthTBVCell.self)
            return venueCell
        }else if indexPath.section == 4 {
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsFiveTBVCell.self)
            venueCell.onTapFamousIndex = {
                self.pushVC(DiningAreaVC())
            }
            return venueCell
        }else if indexPath.section == 5 {
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsSixTBVCell.self)
            return venueCell
        }else{
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsSevenTBVCell.self)
            venueCell.reviewData = self.reviewData[indexPath.row]
            return venueCell
        }
    }
    
    //MARK: - headerView confirgation.
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withType: CommonTbvHeaderView.self)
        headerView.lblTitle.text = self.headerDetails[section]
        (section == 4) || (section == 6) ? (headerView.btnSeeAll.isHidden = false) :  (headerView.btnSeeAll.isHidden = true)
        if section == 4 {
            headerView.onTapSeeAll = {
                self.pushVC(AlbumsVC())
            }
        }
        if section == 6 {
            headerView.onTapSeeAll = {
                self.pushVC(CustomerReviewVC())
            }
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? .leastNonzeroMagnitude : 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
}
