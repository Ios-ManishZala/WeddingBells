//
//  GuestListVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class GuestListVC: UIViewController {

    @IBOutlet weak var lblAddGuest: UILabel!
    @IBOutlet weak var btnAddguest: UIButton!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    var guestListName = [
        "Jane Cooper",
        "Esther Howard",
        "Guy Hawkins",
        "Robert Fox",
        "Jacob Jones",
        "Cody Fisher",
        "Annette Black",
        "Devon Lane",
        "Theresa Webb",
        "Jane Cooper",
        "Eleanor Pena",
        "Jerome Bell",
        "Albert Flores",
        "Bessie Cooper",
        "Ralph Edwards",
        "Ralph Edwards",
        "Annette Black"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: GuestTBVCell.self)
        self.customNav.titleLabel.text = "guestlist".localized()
        self.lblAddGuest.text = "add_guest".localized()
    }

    @IBAction func btnAddguestAction(_ sender: UIButton) {
        let vc = AddGuestVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
}

extension GuestListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.guestListName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let guestCell = self.tableView.dequeueReusableCell(withType: GuestTBVCell.self)
        guestCell.lblGuestList.text = self.guestListName[indexPath.row]
        return guestCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GuestTBVCell
        cell.yesmarkImage.image = UIImage(named: "ic_yesmark")
        cell.yesMarkView.backgroundColor = .mainColor
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! GuestTBVCell
        cell.yesMarkView.backgroundColor = .white
    }
}
