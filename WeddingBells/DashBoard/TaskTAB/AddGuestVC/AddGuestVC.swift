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
        self.btnAdd.setButtonTitleAndFunctionality("add".localized())
        
        if isFromAddExpenses == true{
            self.lblTitle.text = "add_expenses".localized()
            self.txtExpenses.placeholder = "enter_expenses".localized()
        }
        else if isFromAddYourBudget == true {
            self.lblTitle.text = "add_your_budgets".localized()
            self.txtExpenses.placeholder = "enter_your_budgets".localized()
        }else{
            self.lblTitle.text = "add_guest".localized()
            self.txtExpenses.placeholder = "enter_guest_name".localized()
        }
    }

    @IBAction func outerViewAction(_ sender: UIControl) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
