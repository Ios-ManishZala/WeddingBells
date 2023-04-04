//
//  AlbumsVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class AlbumsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var albumDecorData = WeddingDecorData.getAlbums()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: FamousCVCell.self)
        self.customNav.titleLabel.text = "Albums"
    }
}


//MARK: - Datasource.

extension AlbumsVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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
        let width = (collectionView.frame.width - 40) / 2
        return .init(width: width, height: 205)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.pushVC(DiningAreaVC())
    }
}


