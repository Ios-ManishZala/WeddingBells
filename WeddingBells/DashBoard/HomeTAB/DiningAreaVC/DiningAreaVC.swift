//
//  DiningAreaVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 04/04/23.
//

import UIKit

class DiningAreaVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var customNav: TabNavigationBar!
    var diningImageName:[String] = [
        "ic_dining1","ic_dining2","ic_dining3","ic_dining4","ic_dining5","ic_dining6","ic_dining7","ic_dining8","ic_dining9","ic_dining10"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(of: DiningCVCell.self)
        self.customNav.titleLabel.text = "Dining area"
    }
}

//MARK: - Datasource.

extension DiningAreaVC: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.diningImageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withType: DiningCVCell.self, indexPath: indexPath)
        categoryCell.diningImage.image = UIImage(named: self.diningImageName[indexPath.row])
        return categoryCell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 40) / 2
        return .init(width: width, height: 174)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



