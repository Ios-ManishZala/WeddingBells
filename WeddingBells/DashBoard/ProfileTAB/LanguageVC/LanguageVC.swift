//
//  LanguageVC.swift
//  Salon
//
//  Created by Keyur Baravaliya on 26/09/22.
//

import UIKit

class LanguageVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var lblLanguageTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
   @IBOutlet weak var navigationView: TabNavigationBar!
    var langagugeName = ["English","Hindi","Chinese","Arabic","Indonesian"]
    var selectedLanguage = ["en","hi","zh-Hant","ar","id"]
    let defaults = UserDefaults()
    var currentIndex = 0
    
   override func viewDidLoad() {
       super.viewDidLoad()

       tableView.delegate = self
       tableView.dataSource = self
       tableView.register(of: SelectAppLnaguageTBVCell.self)
       tableView.registerHeaderFooterView(of: CommonTbvFooterView.self)
   }
   
   //MARK: - Lanuguage Update
   
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)

       if getAppLanguagesCode() == "ar" {
           self.navigationView.btnBack.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        }
       else{
           self.navigationView.btnBack.imageView?.transform = CGAffineTransform(scaleX: 1.0, y: -1.0)
       }
       self.setValueBaseOnLanguage()
       self.tableView.reloadData()
   }
   
   func setValueBaseOnLanguage(){
       self.navigationView.titleLabel.text = "language".localized()
       self.lblLanguageTitle.text = "language_title".localized()
   }
   
   //MARK: - TableView dataSource
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.langagugeName.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let languageCell = tableView.dequeueReusableCell(withType: SelectAppLnaguageTBVCell.self)
       languageCell.lblLanguageName.text = self.langagugeName[indexPath.row]
       if getAppLanguagesCode() == self.selectedLanguage[indexPath.row] {
           languageCell.outerSelectionView.backgroundColor = .mainColor
       }
       else{
           languageCell.outerSelectionView.backgroundColor = .white
       }
       return languageCell
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if indexPath.row == 0{
           Bundle.setLanguage(lang: "en")
       }
       else if indexPath.row == 1{
           Bundle.setLanguage(lang: "hi")
       }
       else if indexPath.row == 2 {
           Bundle.setLanguage(lang: "zh-Hant")
       }
       else if indexPath.row == 3{
           Bundle.setLanguage(lang: "ar")
       }
       else if indexPath.row == 4{
           Bundle.setLanguage(lang: "id")
       }
       self.tableView.reloadData()
       self.setValueBaseOnLanguage()
       self.changeUIRuntime()
   }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "CommonTbvFooterView" ) as! CommonTbvFooterView
        footerView.btnBookAppointment.setButtonTitleAndFunctionality("update".localized())
        footerView.onTapBookAppointment = {
            self.navigationController?.popViewController(animated: true)
        }
        return footerView
    }
}
