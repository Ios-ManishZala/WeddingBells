//
//  CheckavailabiltyVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class CheckavailabiltyVC: UIViewController {

    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var btnCheckAvailabelity: UIButton!
    @IBOutlet var textfiedShadow: [UIView]!
    @IBOutlet weak var txtDate: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textfiedShadow.forEach { view in
            view.addShadow()
        }
        self.btnCheckAvailabelity.setButtonTitleAndFunctionality("Check availability")
        self.customNav.titleLabel.text = "Check availabilty"
        
        let timeFromPicker = UIDatePicker()
        timeFromPicker.datePickerMode = .date
        timeFromPicker.preferredDatePickerStyle = .wheels
        timeFromPicker.addTarget(self, action: #selector(timeFromChange(datePicker:)), for: .valueChanged)
        txtDate.inputView = timeFromPicker
    }
    
    @IBAction func btnFunctionTypeAction(_ sender: UIButton) {
        let vc = FunctionTypeVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    
    @objc func timeFromChange(datePicker: UIDatePicker) {
        self.txtDate.text = formatTime(time: datePicker.date)
    }
    
    func formatTime( time : Date) -> String{
        let timeformater = DateFormatter()
        timeformater.dateStyle = .short
        return timeformater.string(from: time)
    }
    
    @IBAction func btnCheckAvailbilityAction(_ sender: UIButton) {
        self.pushVC(BookNowVC())
    }
}
