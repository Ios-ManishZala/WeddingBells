//
//  TabNavigationBar.swift
//  Salon
//
//  Created by Keyur Baravaliya on 20/09/22.
//

import UIKit

class TabNavigationBar: UIView {
    
    private static let NIB_NAME2 = "TabNavigationBar"
    
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet public weak var titleLabel: UILabel!
    var onTapBackAction:(()->())? = nil
    @IBOutlet var contentView: UIView!
    var onTapHeartAction:((UIButton)->())? = nil
    var onTapShareAction:(()->())? = nil

    
    
    override func awakeFromNib() {
        initWithNib()
    }
    
    private func initWithNib() {
        Bundle.main.loadNibNamed(TabNavigationBar.NIB_NAME2, owner: self, options: nil)
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
    
    @IBAction func btnShareAction(_ sender: UIButton) {
        if let getAct = self.onTapShareAction {
            getAct()
        }
    }
    
    
    @IBAction func btnHeartAction(_ sender: UIButton) {
        if let getAct = self.onTapHeartAction {
            getAct(sender)
        }
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        self.findViewController()?.navigationController?.popViewController(animated: true)
        if let getAct = self.onTapBackAction {
            getAct()
        }
    }
    
}


