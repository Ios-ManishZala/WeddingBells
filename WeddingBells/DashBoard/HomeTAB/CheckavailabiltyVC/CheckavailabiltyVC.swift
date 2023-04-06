//
//  CheckavailabiltyVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class CheckavailabiltyVC: UIViewController {

    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var customNav: TabNavigationBar!
    @IBOutlet weak var btnCheckAvailabelity: UIButton!
    @IBOutlet var textfiedShadow: [UIView]!
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtNumberOfguest: UITextField!
    @IBOutlet weak var txtFunctiontype: UITextField!
    @IBOutlet weak var lblNumberOfguest: UILabel!
    @IBOutlet weak var lblFunctiontype: UILabel!
    @IBOutlet weak var lblEventdate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textfiedShadow.forEach { view in
            view.addShadow()
        }
        
        let timeFromPicker = UIDatePicker()
        timeFromPicker.datePickerMode = .date
        timeFromPicker.preferredDatePickerStyle = .wheels
        timeFromPicker.addTarget(self, action: #selector(timeFromChange(datePicker:)), for: .valueChanged)
        txtDate.inputView = timeFromPicker
    }
    
    //MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        self.customNav.titleLabel.text = "check_availblity".localized()
        self.lblSubtitle.text = "check_subtitle".localized()
        self.lblEventdate.text = "event_date".localized()
        self.lblFunctiontype.text = "function_type".localized()
        self.lblNumberOfguest.text = "number_of_guest".localized()
        self.txtDate.placeholder = "event_date".localized()
        self.txtFunctiontype.placeholder = "function_type".localized()
        self.txtNumberOfguest.placeholder = "number_of_guest".localized()
        self.btnCheckAvailabelity.setButtonTitleAndFunctionality("check_availblity".localized())
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
