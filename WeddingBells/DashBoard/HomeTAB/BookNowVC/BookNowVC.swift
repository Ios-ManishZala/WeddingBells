//
//  BookNowVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class BookNowVC: UIViewController {

    @IBOutlet weak var lblBooknowMessage: UILabel!
    @IBOutlet weak var btnBookNow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        self.btnBookNow.setButtonTitleAndFunctionality("book_now".localized())
        self.lblBooknowMessage.text = "booknow_message".localized()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBookNowAction(_ sender: UIButton) {
        self.pushVC(AddNewVC())
    }
}
