//
//  FamousCVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class FamousCVCell: UICollectionViewCell {

    @IBOutlet weak var famouesView: UIView!
    @IBOutlet weak var imageDecor: UIImageView!
    @IBOutlet weak var lblDecorName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDollarForPay: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.imageDecor.makeTopCornerRound(10)
        self.famouesView.addShadow()
    }

}
