//
//  VenueDetailsSecondTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsSecondTBVCell: UITableViewCell {

    @IBOutlet weak var readMoreView: UIView!
    @IBOutlet weak var readLessView: UIView!
    @IBOutlet weak var collapseLabel: UILabel!
    @IBOutlet weak var expandlabel: UILabel!
    var onTapReadMoreAction:(()->()) = { }
    var onTapReadLessAction:(()->()) = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        let string = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ante aliquam consectetur feugiat cursus diam vivamus enim. Duis sit pellentesque sed vitae lectus quisque morbi integlesuada. Read more",attributes: [NSAttributedString.Key.font : UIFont(name: "Montserrat-Medium", size: 14)!])
        string.setColorForText("Read more", with: .mainColor)
        self.expandlabel.attributedText = string
        
        
        let secondString = NSMutableAttributedString(string: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris nunc, in eleifend lacus, ametenihendrerit tincidunt. Venenatis pretium ultricies sem fringilla. Est, senectus integer et sagittis proin placerat. Eget non volutpat donec dis quam nunc, cursussenectus. Purus neque penatibus in ultrices nec.Ut pharetra, arcu sapien molestie nec Read Less", attributes: [NSAttributedString.Key.font : UIFont(name: "Montserrat-Medium", size: 14)!])
        secondString.setColorForText("Read Less", with: .mainColor)
        self.collapseLabel.attributedText = secondString
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnReadLessAction(_ sender: UIButton) {
       onTapReadLessAction()
    }
    
    @IBAction func btnReadMoreAction(_ sender: UIButton) {
        onTapReadMoreAction()
    }
}


extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    }
}
