//
//  BookNowVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class BookNowVC: UIViewController {

    @IBOutlet weak var btnBookNow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.btnBookNow.setButtonTitleAndFunctionality("Book now")
    }

    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBookNowAction(_ sender: UIButton) {
        self.pushVC(AddNewVC())
    }
}
