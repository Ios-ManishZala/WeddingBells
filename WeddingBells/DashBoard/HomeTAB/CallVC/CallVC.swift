//
//  CallVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class CallVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnEndCallAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
