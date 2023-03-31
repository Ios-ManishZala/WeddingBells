//
//  CategoriesCVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class CategoriesCVCell: UICollectionViewCell {

    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var imageCategory: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.imageCategory.makeRounded()
    }

}
