//
//  VenueDetailsVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsVC: UIViewController {

    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var leftCornerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var headerDetails = ["","About","Payment","Areas availabel","Albums(16)","Similar venue’s","Review"]
    var venueDescAttributedString: NSMutableAttributedString? = nil
    var reviewData = WeddingDecorData.getUserReviewData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.leftCornerView.makeTopLeft(5)
        self.customNav.btnBack.setImage(UIImage(named: "ic_white"), for: .normal)
        self.customNav.titleLabel.text = ""
        self.customNav.btnHeart.isHidden = false
        self.customNav.btnShare.isHidden = false
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
        readMoreOption()
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
            return venueFirstCell
        }else if indexPath.section == 1{
            let venueSecondCell = self.tableView.dequeueReusableCell(withType: VenueDetailsSecondTBVCell.self)
            return venueSecondCell
        }else if indexPath.section == 2{
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsThirdTBVCell.self)
            return venueCell
        }else if indexPath.section == 3 {
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsFourthTBVCell.self)
            return venueCell
        }else if indexPath.section == 4 {
            let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsFiveTBVCell.self)
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
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? .leastNonzeroMagnitude : 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    //MARK: TextView Delegate
//    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
//        if URL.absoluteString == "read_more" {
//            self.movieDescLessOption()
//        }else {
//            self.readMoreOption()
//        }
//
//        JSN.log("print url ===>%@", URL.absoluteString)
//        return false
//    }
}



extension VenueDetailsVC {

    func readMoreOption() {
        let attributedString = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ante aliquam consectetur feugiat cursus diam vivamus enim. Duis sit pellentesque sed vitae lectus quisque morbi integlesuada. Read more")
        attributedString.addAttribute(.link, value: "read_more", range: NSRange(location: (attributedString.string.count - ("Read more".count)), length: "Read more".count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.placeholderGray, range: NSRange(location: 0, length: attributedString.string.count))
        attributedString.addAttribute(.font, value: UIFont(name: "Montserrat-Medium", size: 14)!, range: NSRange(location: 0, length: attributedString.string.count))
        self.venueDescAttributedString = attributedString
        self.tableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
    }

    func movieDescLessOption() {
        let attributedString = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ante aliquam consectetur feugiat cursus diam vivamus enim. Duis sit pellentesque sed vitae lectus quisque morbi integlesuada. consectetur adipiscing elit. ante aliquam consectetur feugiat cursus diam vivamus enim. Duis sit pellentesque sed vitae lectus quisque morbi integlesuada less")
        attributedString.addAttribute(.link, value: "less", range: NSRange(location: (attributedString.string.count - ("Less".count)), length: "less".count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.placeholderGray, range: NSRange(location: 0, length: attributedString.string.count))
        attributedString.addAttribute(.font, value: UIFont(name: "Montserrat-Medium", size: 14)!, range: NSRange(location: 0, length: attributedString.string.count))
        self.venueDescAttributedString = attributedString
        self.tableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
    }
}
