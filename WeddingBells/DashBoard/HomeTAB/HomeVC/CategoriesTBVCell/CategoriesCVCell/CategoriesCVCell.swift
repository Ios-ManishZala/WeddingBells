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
    var categoryData:DecorPackageModel?{
        didSet{
            self.imageCategory.image = categoryData?.decorImageName
            self.lblCategoryName.text = categoryData?.decorpackageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.imageCategory.makeRounded()
    }

}
