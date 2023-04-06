//
//  FAQsVC.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 11/10/22.
//

import UIKit

class FAQsVC: UIViewController {
   

    @IBOutlet weak var navigationView: TabNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    var allFAQsDetails = [
        "How to book wedding venue?",
        "How to change language",
        "How to book photographer?",
        "How to chat?",
        "How to Find best venue?",
        "How to book catering service?"
    ]
    var curentIndex = -1
    var isCollapse:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationView.titleLabel.text = "faqs".localized()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: FAQsTBVcell.self)
    }
}

//MARK: - datasource.

extension FAQsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allFAQsDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let collapseCell = self.tableView.dequeueReusableCell(withIdentifier: "FAQsTBVcell", for: indexPath) as! FAQsTBVcell
        collapseCell.lblTitleCategories.text = allFAQsDetails[indexPath.row]
        
        if curentIndex == indexPath.row && isCollapse == true{
            collapseCell.bottomView.isHidden = false
            collapseCell.imageUpAndDown.image = UIImage(named: "ic_up")
        }
        else{
            collapseCell.bottomView.isHidden = true
            collapseCell.imageUpAndDown.image = UIImage(named: "ic_down")
        }
        return collapseCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if curentIndex == indexPath.row{
            if self.isCollapse == false{
                self.isCollapse = true
            }
            else{
                isCollapse = false
            }
        }
        else{
            self.isCollapse = true
        }
        self.curentIndex = indexPath.row
        UIView.transition(with: tableView,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tableView.reloadData() })
    }
}
