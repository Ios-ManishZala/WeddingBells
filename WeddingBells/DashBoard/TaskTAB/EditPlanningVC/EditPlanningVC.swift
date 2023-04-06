//
//  EditPlanningVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class EditPlanningVC: UIViewController {

    @IBOutlet weak var lblUpdateimage: UILabel!
    @IBOutlet weak var planningView: UIView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet var textfiedShadow: [UIView]!
    @IBOutlet weak var txtDate: UITextField!

    @IBOutlet weak var txtgroomname: UITextField!
    @IBOutlet weak var txtbridgeName: UITextField!
    @IBOutlet weak var lblgroomname: UILabel!
    @IBOutlet weak var lblBridgename: UILabel!
    @IBOutlet weak var lblEventdate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.planningView.makeTopCornerRound(40)
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
        self.btnSave.setButtonTitleAndFunctionality("save".localized())
        self.lblEventdate.text = "event_date".localized()
        self.lblBridgename.text = "bride_name".localized()
        self.lblgroomname.text = "groome_name".localized()
        self.txtDate.placeholder = "event_date".localized()
        self.txtgroomname.placeholder = "groome_name".localized()
        self.txtbridgeName.placeholder = "bride_name".localized()
        self.lblUpdateimage.text = "upload_image".localized()
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
