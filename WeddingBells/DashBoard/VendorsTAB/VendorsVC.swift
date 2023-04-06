//
//  VendorsVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class VendorsVC: UIViewController {

    @IBOutlet weak var lblvendor: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var vendorData = WeddingDecorData.VenoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: VendoreTBVCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.lblvendor.text = "vendors".localized()
        self.tableView.reloadData()
    }
}

extension VendorsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vendorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withType: VendoreTBVCell.self)
        cell.vendorData = self.vendorData[indexPath.row]
        if getAppLanguagesCode() == "ar" {
            cell.vendorImage.makeRightTopandBottomRound(10)
        }else{
            cell.vendorImage.makeLeftTopandBottomRound(10)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushVC(VenueVC())
    }
}
