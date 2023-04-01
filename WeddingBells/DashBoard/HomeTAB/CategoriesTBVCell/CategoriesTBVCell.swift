//
//  CategoriesTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class CategoriesTBVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var categoryData = WeddingDecorData.getCategoryDecorData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: CategoriesCVCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


//MARK: - datasource.
extension CategoriesTBVCell: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withType: CategoriesCVCell.self, indexPath: indexPath)
        categoryCell.categoryData = categoryData[indexPath.row]
        return categoryCell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 50) / 4
        let height = collectionView.frame.height
        return .init(width: width, height: height)
    }
}
