//
//  VendorShorlistVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class VendorShorlistVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var vendorShorlistData = WeddingDecorData.VendorShortlistData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNav.titleLabel.text = "vendor_shortlist".localized()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: VendoreTBVCell.self)
        tableView.register(of: VendorShortlistTBVCell.self)
    }
}

extension VendorShorlistVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vendorShorlistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vendorDicValue = self.vendorShorlistData[indexPath.row]
        if vendorDicValue.isCreatShortlist == false {
            let cell = tableView.dequeueReusableCell(withType: VendoreTBVCell.self)
            cell.lblVendorName.text = vendorDicValue.title
            cell.lblVendortype.text = vendorDicValue.addtoshortlist
            cell.vendorImage.image = vendorDicValue.vendorImage
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withType: VendorShortlistTBVCell.self)
            cell.lblTitle.text = vendorDicValue.title
            cell.lblSubtitle.text = vendorDicValue.addtoshortlist
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vendorDicValue = self.vendorShorlistData[indexPath.row]
        if vendorDicValue.isCreatShortlist == false {
            self.pushVC(VenueShortListVC())
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let vendorDicValue = self.vendorShorlistData[indexPath.row]
        if editingStyle == .delete && vendorDicValue.isCreatShortlist == false{
            self.vendorShorlistData.remove(at: indexPath.row)
        }
        self.tableView.reloadData()
    }
}
