//
//  BudgetTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class BudgetTBVCell: UITableViewCell {

    @IBOutlet weak var imageLine: UIView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblExpenseName: UILabel!
    var expenseListData: BudgetViewModal?{
        didSet{
            self.lblAmount.text = expenseListData?.expensesAmount
            self.lblExpenseName.text = expenseListData?.expensesName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
