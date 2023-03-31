//
//  HomeVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewDatasource = HomeTableviewDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tableViewDatasource
        tableView.dataSource = tableViewDatasource
    }    
}
