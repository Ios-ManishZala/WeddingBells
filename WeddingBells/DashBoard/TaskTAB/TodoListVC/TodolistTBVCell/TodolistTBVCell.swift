//
//  TodolistTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 05/04/23.
//

import UIKit

class TodolistTBVCell: UITableViewCell {

    @IBOutlet weak var lblListDetails: UILabel!
    @IBOutlet weak var yesmarkImage: UIImageView!
    @IBOutlet weak var yesmarkBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.yesmarkBgView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //MARK: - Line on Label.
        
        if selected {
            let attributedString = NSAttributedString(string: lblListDetails.text ?? "", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            lblListDetails.attributedText = attributedString
            yesmarkImage.image = UIImage(named: "ic_yesmark")
            yesmarkBgView.backgroundColor = .mainColor
        } else {
            let attributedString = NSAttributedString(string: lblListDetails.text ?? "", attributes: [.strikethroughStyle: NSUnderlineStyle.byWord.rawValue])
            lblListDetails.attributedText = attributedString
            yesmarkBgView.backgroundColor = .white
        }
    }
}
