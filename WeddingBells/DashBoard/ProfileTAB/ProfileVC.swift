//
//  ProfileVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileView: UIView!
    var profileData = WeddingDecorData.ProfileViewData()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileView.addShadow()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: ProfileTBVCell.self)
    }
    
    //MARK: - update langauge
   
    func setValueBaseOnLanguage(){
        self.lblUserName.text = "leslie_alexand".localized()
        self.lblTitle.text = "profile".localized()
        self.profileData = WeddingDecorData.ProfileViewData()
    }
    
   override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
       self.setValueBaseOnLanguage()
       tableView.reloadData()
   }
}

//MARK: - tableview dataSource.

extension ProfileVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profileCell = self.tableView.dequeueReusableCell(withType: ProfileTBVCell.self)
        profileCell.profileDetailsData = self.profileData[indexPath.row]
        if profileCell.lblProfiletagName.text == "logout".localized(){
            profileCell.lblProfiletagName.textColor = #colorLiteral(red: 0.8588235294, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        }else{
            profileCell.lblProfiletagName.textColor = .black
        }
        if indexPath.row == (self.profileData.count - 1)  {
            profileCell.imageLine.backgroundColor = .white
        }else{
            profileCell.imageLine.backgroundColor = #colorLiteral(red: 0.8700339198, green: 0.8700339198, blue: 0.8700339198, alpha: 1)
        }
        return profileCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            self.pushVC(EditProfileVC())
        }
        else if indexPath.row == 1{
           self.pushVC(BookingVC())
        }
        else if indexPath.row == 2{
            self.pushVC(BudgetsVC())
        }
        else if indexPath.row == 3{
            self.pushVC(LanguageVC())
        }
        else if indexPath.row == 4{
            self.pushVC(TermAndConditionVC())
        }
        else if indexPath.row == 5{
            self.pushVC(FAQsVC())
        }
        else if indexPath.row == 6{
            self.pushVC(PrivacyPolicyVC())
        }
        else if indexPath.row == 7 {
            self.pushVC(ContactUsVC())
        }
        else{
            let vc = LogoutVC()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true)
        }
    }
}
