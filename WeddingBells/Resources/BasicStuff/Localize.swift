//
//  Localize.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 03/10/22.
//

import Foundation
import UIKit

//MARK: - Localize The DataUseful.
extension Bundle {
        
    private static var bundle: Bundle!
    public static func localizedBundle() -> Bundle{
        let lang = UserDefaults.standard.string(forKey: "Applanguage")
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
        return bundle!
    }

    public static func setLanguage(lang: String) {
        UserDefaults.standard.set(lang, forKey: "Applanguage")
        UserDefaults.standard.synchronize()
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        bundle = Bundle(path: path!)
        let defaults = UserDefaults()
        defaults.isArabic()
        
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable" , bundle: Bundle.localizedBundle(), value: "", comment: "")
    }
    func localizeWithFormat(arguments: CVarArg...) -> String{
        return String(format: self.localized(), arguments: arguments)
    }
}

//MARK: - ChangeUIView Direction when LanguageUpdate.
extension UserDefaults{
    func isArabic(){
        if UserDefaults.standard.string(forKey: "Applanguage") == "ar"{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
        }
        else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
}

//MARK: - When Language update ChnageUI ATTime.
extension UIViewController{
  
    func changeUIRuntime(){
        let currentNavigation = self.navigationController
        let newNavigation =  UINavigationController()
        newNavigation.viewControllers = currentNavigation?.viewControllers ?? []
        newNavigation.setNavigationBarHidden(true, animated: false)
        self.view.window?.rootViewController = newNavigation
        
//        let navCtrl = self.storyboard?.instantiateViewController(withIdentifier: "rootnav")
//        let keyWindow = UIApplication.shared.connectedScenes
//            .filter({$0.activationState == .foregroundActive})
//                .compactMap({$0 as? UIWindowScene})
//                .first?.windows
//                .filter({$0.isKeyWindow}).first
//        guard
//            let window = keyWindow,
//            let rootViewController = window.rootViewController
//
//        else {
//            return
//        }
//        navCtrl?.view.frame = rootViewController.view.frame
//        navCtrl?.view.layoutIfNeeded()
//
//        UIView.transition(with: window, duration: 0.2, options: .transitionFlipFromRight, animations: {
//            window.rootViewController = navCtrl
//            window.makeKeyAndVisible()
////        })
    }
}

//MARK: - ChanegTexfield Direction when LanguageUpdate.
extension UITextField {
   open override func awakeFromNib() {
    super.awakeFromNib()
    if UserDefaults.standard.string(forKey: "Applanguage") == "ar" {
        if textAlignment == .natural {
            self.textAlignment = .right
        }
      }
   }
 }

//MARK: - ChanegTextView Direction when LanguageUpdate.
extension UITextView {
   open override func awakeFromNib() {
    super.awakeFromNib()
    if UserDefaults.standard.string(forKey: "Applanguage") == "ar" {
        if textAlignment == .natural {
            self.textAlignment = .right
        }
      }
   }
 }

//MARK: - ChangeButton Direction when LanguageUpdate.
extension UIButton{
    open override func awakeFromNib() {
     super.awakeFromNib()
     if UserDefaults.standard.string(forKey: "Applanguage") == "ar" {
         self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
       }
    }
}
