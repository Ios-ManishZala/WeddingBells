//
//  WeddingPackageVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 03/04/23.
//

import UIKit

class WeddingPackageVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var weddingdecorData:[DecorPackageModel] = []
    var isFromFamousDecor:Bool = false
    var isFromTrendingDecor:Bool = false
    var isFromWeddingPackagedetails:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isFromFamousDecor == true {
            customNav.titleLabel.text = "famous_wedding_venue".localized()
        }else if isFromTrendingDecor == true {
            customNav.titleLabel.text = "tranding_decor".localized()
        }else{
            customNav.titleLabel.text = "wedding_package".localized()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: FamousCVCell.self)
        for weddingData in WeddingDecorData.getWeddingDecorData() {
            weddingdecorData.append(weddingData)
        }
        for weddingData in WeddingDecorData.getFamouesDecorData() {
            weddingdecorData.append(weddingData)
        }
        for weddingData in WeddingDecorData.getTrendingDecorData() {
            weddingdecorData.append(weddingData)
        }
    }
}

//MARK: - Datasource.

extension WeddingPackageVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weddingdecorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withType: FamousCVCell.self, indexPath: indexPath)
        categoryCell.famousDecorData = weddingdecorData[indexPath.row]
        return categoryCell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40) / 2
        return .init(width: width, height: 222)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (isFromFamousDecor == true) || (isFromTrendingDecor == true) {
            self.pushVC(VenueDetailsVC())
        }else{
            let vc = VenueDetailsVC()
            self.isFromWeddingPackagedetails = true
            vc.isFromWeddingPackagedetails = self.isFromWeddingPackagedetails
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
