//
//  BudgetsVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class BudgetsVC: UIViewController {

   
    @IBOutlet weak var lblAddExpenses: UILabel!
    @IBOutlet weak var lblExpenses: UILabel!
    @IBOutlet weak var circularProgress: CircularProgressView!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var roundView: [UIView]!
    @IBOutlet weak var budgetView: UIView!
    var expensesData = WeddingDecorData.ExpenesesData()
    var isFromAddExpenses = false
    var isFromAddYourBudget = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        budgetView.addShadow()
        roundView.forEach { UIView in
            UIView.makeRounded()
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: BudgetTBVCell.self)
        
        // CircularProgrssBar.
        self.circularProgress.progressClr = .mainColor
        self.circularProgress.trackClr = #colorLiteral(red: 0.8588235294, green: 0.8039215686, blue: 0.3294117647, alpha: 1)
        self.circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.4)
    }
    
    //MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        customNav.titleLabel.text = "budget".localized()
        self.lblExpenses.text = "expenses".localized()
        self.lblAddExpenses.text = "add_expenses".localized()
    }
    
    @IBAction func btnEditBudgetAction(_ sender: UIButton) {
        let vc = AddGuestVC()
        self.isFromAddYourBudget = true
        vc.isFromAddYourBudget = self.isFromAddYourBudget
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @IBAction func btnAddExpeneseAction(_ sender: UIControl) {
        let vc = AddGuestVC()
        self.isFromAddExpenses = true
        vc.isFromAddExpenses = self.isFromAddExpenses
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @IBAction func btn40Prosses(_ sender: UIControl) {
        self.circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.4)
    }
    
    @IBAction func btn60Prosess(_ sender: UIControl) {
        self.circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.6)
    }
}

extension BudgetsVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.expensesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: BudgetTBVCell.self)
        cell.expenseListData = self.expensesData[indexPath.row]
        if indexPath.row == (self.expensesData.count - 1)  {
            cell.imageLine.backgroundColor = .white
        }
        return cell
    }
}
