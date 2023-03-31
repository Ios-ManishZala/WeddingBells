//
//  ViewController.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let vc = IntroVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }


}

