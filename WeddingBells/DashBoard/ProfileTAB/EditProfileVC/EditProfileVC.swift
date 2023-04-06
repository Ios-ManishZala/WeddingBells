//
//  EditProfileVC.swift
//  FindJob
//
//  Created by Keyur Baravaliya on 30/12/22.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblEmailAddrss: UILabel!
    @IBOutlet weak var lblMobileNumber: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var navigationView: TabNavigationBar!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var numberView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var btnUpdate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        self.cameraView.makeRounded()
        self.userImage.makeRounded()
        self.numberView.addShadow()
        self.nameView.addShadow()
        self.emailView.addShadow()
        self.innerView.makeRounded()
    }

    //MARK: - update langauge
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setValueBaseOnLanguage()
    }
    
    func setValueBaseOnLanguage(){
        self.btnUpdate.setButtonTitleAndFunctionality("save".localized())
        self.lblname.text = "name".localized()
        self.lblEmailAddrss.text = "email_address".localized()
        self.lblMobileNumber.text = "mobile_number".localized()
        self.txtName.placeholder = "leslie_alexand".localized()
        self.navigationView.titleLabel.text = "edit_profile".localized()
    }
    
    @IBAction func btnUpdateAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCameraAction(_ sender: UIButton) {
        self.alertImagePicker()
    }
}

//MARK: - imagepick from Gallery , camera

extension EditProfileVC : UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    func showImagePickerController(_ sourcetype: UIImagePickerController.SourceType){
        let imageController = UIImagePickerController()
        imageController.sourceType = sourcetype
        imageController.delegate = self
        imageController.allowsEditing = true
        present(imageController, animated: true, completion: nil)
    }
    
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            userImage.image = editedImage
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            userImage.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func alertImagePicker(){
        let action = UIAlertController(title: "Select image".localized(), message: "Selected image From", preferredStyle: .actionSheet)
        let cameraBtn = UIAlertAction(title: "Camera".localized(), style: .default) { _ in
            self.showImagePickerController(.camera)
        }
        let liberyBtn = UIAlertAction(title: "Library".localized(), style: .default) { _ in
            self.showImagePickerController(.photoLibrary)
        }
        let cancelBtn = UIAlertAction(title: "Cancel".localized(), style: .default, handler: nil)
        action.addAction(cameraBtn)
        action.addAction(liberyBtn)
        action.addAction(cancelBtn)
        present(action, animated: true, completion: nil)
    }
}
