//
//  TabBarVC.swift
//  StoryTime
//
//  Created by Keyur Baravaliya on 23/12/22.
//

import UIKit

class TabBarVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            self.collectionView.register(UINib(nibName: "CustomTabCell", bundle: nil), forCellWithReuseIdentifier: "CustomTabCell")
        }
    }

    var nameOfTab = ["home".localized(),"vendors".localized(),"task".localized(),"message".localized(),"profile".localized()]
    var unSelectedTab = ["ic_unselectedtab1","ic_unselectedtab5","ic_unselectedtab4","ic_unselectedtab3","ic_unselectedtab2"]
    var selectedTab = ["ic_selectedtab5","ic_selectedtab4","ic_selectedtab3","ic_selectedtab2","ic_selectedtab1"]
    var currentIndex = 0
    var controllerList:[UIViewController] = [HomeVC(),VendorsVC(),TaskVC(),MessageVC(),ProfileVC()]
    var isFromDeposite:Bool = false
    var isFromLoan:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.serviceHome()

        self.tabBarView.tabShadow(color: UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor)
        self.tabBarView.addSubview(self.collectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.nameOfTab = ["home".localized(),"vendors".localized(),"task".localized(),"message".localized(),"profile".localized()]
        self.collectionView.reloadData()
    }

    //MARK: - CollectionView Datasource.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.nameOfTab.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tabCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CustomTabCell", for: indexPath) as! CustomTabCell
        tabCell.lblTabName.text = self.nameOfTab[indexPath.row]
        if currentIndex == indexPath.row{
            tabCell.lblTabName.textColor = .mainColor
            tabCell.imageTab.image = UIImage(named: selectedTab[indexPath.row])
        }
        else{
            tabCell.lblTabName.textColor = .lightGray
            tabCell.imageTab.image = UIImage.init(named: unSelectedTab[indexPath.row])
        }
        return tabCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.collectionView.frame.width - 60) / 5
        return .init(width: width, height: self.collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentIndex = indexPath.row
        self.collectionView.reloadData()

        DispatchQueue.main.async {
            let vc = self.controllerList[indexPath.row]
            self.addChild(vc)
            self.contentView.addSubview(vc.view)
            vc.view.frame = self.contentView.frame
            vc.didMove(toParent: self)
        }
    }
    func serviceHome(){
        let vc = self.controllerList.first
        self.addChild(vc ?? HomeVC())
        self.contentView.addSubview((vc?.view)!)
        vc?.view.frame = self.contentView.frame
        vc?.didMove(toParent: self)
    }
}
