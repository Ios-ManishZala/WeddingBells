//
//  CustomerReviewVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class CustomerReviewVC: UIViewController {

    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    var reviewData = WeddingDecorData.getUserReviewData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNav.titleLabel.text = "review".localized()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: VenueDetailsSevenTBVCell.self)
    }
}

//MARK: - Datasource.

extension CustomerReviewVC: UITableViewDelegate, UITableViewDataSource,UITextViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.reviewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let venueCell = self.tableView.dequeueReusableCell(withType: VenueDetailsSevenTBVCell.self)
        venueCell.reviewData = self.reviewData[indexPath.row]
        return venueCell
    }
}
