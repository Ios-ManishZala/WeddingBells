//
//  VenueVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class VenueVC: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var weddingdecorData:[DecorPackageModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: VenueTBVCell.self)
        self.searchView.addShadow()
        self.customNav.titleLabel.text = "Venue"
        
        for weddingData in WeddingDecorData.getWeddingDecorData() {
            weddingdecorData.append(weddingData)
        }
        for weddingData in WeddingDecorData.getFamouesDecorData() {
            weddingdecorData.append(weddingData)
        }
        for weddingData in WeddingDecorData.getTrendingDecorData() {
            weddingdecorData.append(weddingData)
        }
    }

}

//MARK: - Datasource.

extension VenueVC : UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weddingdecorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withType: VenueTBVCell.self)
        categoryCell.famousDecorData = weddingdecorData[indexPath.row]
        categoryCell.lblAmount.text = "$150"
        return categoryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushVC(VenueDetailsVC())
    }
}
