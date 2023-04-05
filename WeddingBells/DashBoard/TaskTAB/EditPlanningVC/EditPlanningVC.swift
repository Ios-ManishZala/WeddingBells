//
//  EditPlanningVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class EditPlanningVC: UIViewController {

    @IBOutlet weak var planningView: UIView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet var textfiedShadow: [UIView]!
    @IBOutlet weak var txtDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.planningView.makeTopCornerRound(40)
        self.textfiedShadow.forEach { view in
            view.addShadow()
        }
        self.btnSave.setButtonTitleAndFunctionality("Save")
        let timeFromPicker = UIDatePicker()
        timeFromPicker.datePickerMode = .date
        timeFromPicker.preferredDatePickerStyle = .wheels
        timeFromPicker.addTarget(self, action: #selector(timeFromChange(datePicker:)), for: .valueChanged)
        txtDate.inputView = timeFromPicker
    }

    @IBAction func btnSaveAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func outerViewAction(_ sender: UIControl) {
        self.dismiss(animated: true)
    }
    
    @objc func timeFromChange(datePicker: UIDatePicker) {
        self.txtDate.text = formatTime(time: datePicker.date)
    }
    
    func formatTime( time : Date) -> String{
        let timeformater = DateFormatter()
        timeformater.dateStyle = .short
        return timeformater.string(from: time)
    }
}
