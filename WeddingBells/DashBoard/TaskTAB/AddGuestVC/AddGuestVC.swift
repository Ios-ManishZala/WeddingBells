//
//  AddGuestVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class AddGuestVC: UIViewController {

    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtExpenses: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    var isFromAddExpenses = false
    var isFromAddYourBudget = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addView.makeTopCornerRound(10)
        self.btnAdd.setButtonTitleAndFunctionality("Add")
        
        if isFromAddExpenses == true{
            self.lblTitle.text = "Add expenses"
            self.txtExpenses.placeholder = "Enter expenses"
        }
        else if isFromAddYourBudget == true {
            self.lblTitle.text = "Add your budgets"
            self.txtExpenses.placeholder = "Enter your budgets"
        }
    }

    @IBAction func outerViewAction(_ sender: UIControl) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
