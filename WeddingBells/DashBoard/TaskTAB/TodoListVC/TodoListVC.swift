//
//  TodoListVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class TodoListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dashedLine: UIView!
    @IBOutlet weak var percentageView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var todoView: UIView!
    var todoListName = [
        "Determine and manage budget",
        "Decide a wedding theam",
        "Search & shortlist venue",
        "Checkout caterers availabale",
        "Create guest list & invite",
        "Search & shortlist makup artist",
        "Search & shortlist photographers",
        "Search & shortlist bridecloth",
        "Search & shortlist groome cloth",
        "Search & shortlist  Bridal jewellery",
        "Search & shortlist mahendi artist",
        "Search & book music dj",
        "Search & shortlist groome jewellery",
        "Search & shortlist photographers"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.todoView.addShadow()
        self.percentageView.makeRounded()
        self.percentageView.addShadow()
        if getAppLanguagesCode() == "ar"{
            self.colorView.makeTopLeft(10)
        }else{
            self.colorView.makeTopRight(10)
        }
        self.dashedLine.makeDashedBorderLine(color: .placeholderGray, strokeLength: 2, gapLength: 3, width: 2, orientation: .vertical)
        customNav.titleLabel.text = "to_do_list".localized()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: TodolistTBVCell.self)
    }
}

extension TodoListVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoListName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todoCell = tableView.dequeueReusableCell(withType: TodolistTBVCell.self)
        todoCell.lblListDetails.text = self.todoListName[indexPath.row]
        return todoCell
    }
}
