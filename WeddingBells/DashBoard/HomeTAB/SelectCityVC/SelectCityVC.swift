//
//  SelectCityVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class SelectCityVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cityView: UIView!
    var cityName = [
        "Surat",
        "Mumbai",
        "Delhi",
        "Hyderabad",
        "Pune",
        "Jaipur",
        "Ahmedabad",
        "Anand",
        "Jetpur",
        "Nagpur",
        "Vadodara",
        "Ghaziabad",
        "Agra",
        "Nashik"
    ]
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.cityView.addShadow()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: SelectLanguageCell.self)
        self.lblTitle.text = "select_city".localized()
    }

    @IBAction func outerViewAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension SelectCityVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: "SelectLanguageCell", for: indexPath) as! SelectLanguageCell
        countryCell.lblCountryName.text = self.cityName[indexPath.row]
        if self.currentIndex == indexPath.row {
            countryCell.outerSelectionView.backgroundColor = .mainColor
        }
        else{
            countryCell.outerSelectionView.backgroundColor = .white
        }
        return countryCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentIndex = indexPath.row
        self.tableView.reloadData()
        self.dismiss(animated: true)
    }
}
