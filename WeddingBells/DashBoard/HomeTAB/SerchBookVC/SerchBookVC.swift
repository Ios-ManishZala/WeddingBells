//
//  SerchBookVC.swift
//  StoryTime
//
//  Created by Keyur Baravaliya on 26/12/22.
//

import UIKit

class SerchBookVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
        
    @IBOutlet weak var txtSerch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var serchView: UIView!
    
    
    var recrentSerchData = [
        "Wedding venues",
        "Photographer",
        "Catering service",
        "Bridal lehenga",
        "Bridal jewellery",
        "Best decoration service"
    ]
    var serchResult = [
        "Wedding venues",
        "Photographer",
        "Catering service",
        "Bridal lehenga",
        "Bridal jewellery",
        "Best decoration service"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: RecentSerchCell.self)
        self.serchView.addShadow()
        self.txtSerch.delegate = self
        self.customNav.titleLabel.text = "search".localized()
        self.txtSerch.placeholder = "search".localized()
    }
    
    @IBAction func txtSerchAction(_ sender: UITextField) {
        if let getSearchText = txtSerch.text, getSearchText.isEmpty == false{
            self.recrentSerchData = self.serchResult.filter({ string in
                return  (string.lowercased().contains(getSearchText.lowercased()) == true)
            })
        }
        else{
            self.recrentSerchData = self.serchResult
        }
        self.tableView.reloadData()
    }
    
    //MARK: - tableview delegate and datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recrentSerchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recentCell = self.tableView.dequeueReusableCell(withIdentifier: "RecentSerchCell", for: indexPath) as!  RecentSerchCell
        recentCell.lblRecenetSerch.text = self.recrentSerchData[indexPath.row]
        return recentCell
    }
}
