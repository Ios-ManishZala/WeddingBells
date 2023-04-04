//
//  SelectLanguageCell.swift
//  Salon
//
//  Created by Keyur Baravaliya on 26/09/22.
//

import UIKit

class SelectLanguageCell: UITableViewCell {

    @IBOutlet weak var languaguesView: UIView!
    @IBOutlet weak var innerSelectionView: UIView!
    @IBOutlet weak var outerSelectionView: UIView!
    @IBOutlet weak var lblCountryName: UILabel!
    
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
