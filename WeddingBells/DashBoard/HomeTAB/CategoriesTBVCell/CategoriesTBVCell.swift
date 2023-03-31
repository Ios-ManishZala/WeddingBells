//
//  CategoriesTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class CategoriesTBVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var collectionViewDatasource = HomeCollectionViewDatasource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = collectionViewDatasource
        collectionView.dataSource = collectionViewDatasource
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
