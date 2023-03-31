//
//  NavigationBar.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 04/10/22.
//

import UIKit

class NavigationBar: UIView {
    
    
    private static let NIB_NAME = "NavigationBar"

    @IBOutlet weak var btnBack: UIButton!
    var onTapBackAction:(()->())? = nil
    @IBOutlet var contentView: UIView!
    
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(NavigationBar.NIB_NAME, owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate(
            [
                contentView.topAnchor.constraint(equalTo: topAnchor),
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
    }
    
    
    //MARK: - Back Button Action
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.findViewController()?.navigationController?.popViewController(animated: true)
        if let getAct = self.onTapBackAction {
            getAct()
        }
    }
    
}
