//
//  SelectAppLnaguageTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 06/04/23.
//

import UIKit

class SelectAppLnaguageTBVCell: UITableViewCell {

    @IBOutlet weak var innerSelectionView: UIView!
    @IBOutlet weak var outerSelectionView: UIView!
    @IBOutlet weak var lblLanguageName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.outerSelectionView.makeRounded()
        self.outerSelectionView.addShadow()
        self.innerSelectionView.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
