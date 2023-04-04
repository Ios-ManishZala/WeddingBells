//
//  TrendingDecorTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class TrendingDecorTBVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var weddingdecorData = WeddingDecorData.getTrendingDecorData()
    var onTapTrendingIndex:(()->()) = { }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: FamousCVCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


//MARK: - Datasource.

extension TrendingDecorTBVCell : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weddingdecorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withType: FamousCVCell.self, indexPath: indexPath)
        categoryCell.famousDecorData = weddingdecorData[indexPath.row]
        return categoryCell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 35) / 2
        let height = collectionView.frame.height
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onTapTrendingIndex()
    }
}


