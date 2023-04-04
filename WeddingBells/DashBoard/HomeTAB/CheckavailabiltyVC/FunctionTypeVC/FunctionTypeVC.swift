//
//  FunctionTypeVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class FunctionTypeVC: UIViewController {

    @IBOutlet weak var functionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.functionView.addShadow()
    }

    @IBAction func outerViewAction(_ sender: UIControl) {
        self.dismiss(animated: true)
    }
    
    @IBAction func selectInexAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
