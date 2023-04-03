//
//  VenueDetailsFiveTBVCell.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class VenueDetailsFiveTBVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var albumDecorData = WeddingDecorData.getAlbums()
    var onTapFamousIndex:(()->()) = { }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: FamousCVCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK: - Datasource.

extension VenueDetailsFiveTBVCell: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albumDecorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withType: FamousCVCell.self, indexPath: indexPath)
        categoryCell.famousDecorData = albumDecorData[indexPath.row]
        categoryCell.lblDollarForPay.isHidden = true
        categoryCell.ratingView.isHidden = true
        return categoryCell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 35) / 2
        let height = collectionView.frame.height
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onTapFamousIndex()
    }
}

