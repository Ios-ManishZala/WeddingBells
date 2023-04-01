//
//  HomeVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewDatasource = HomeTableviewDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = tableViewDatasource
        tableView.dataSource = tableViewDatasource
        tableView.register(of: HomeFirstTBVCell.self)
        tableView.register(of: CategoriesTBVCell.self)
        tableView.register(of: WeddingTBVCell.self)
        tableView.register(of: FamousTBVCell.self)
        tableView.register(of: TrendingDecorTBVCell.self)
        tableView.registerHeaderFooterView(of: CommonTbvHeaderView.self)
        
//        tableView.contentInset = UIEdgeInsets(top: 295, left: 0, bottom: 0, right: 0)
//        self.myScrollView.delegate = self
//        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 295)
//        imageView.image = UIImage.init(named: "ic_breakingnew5")
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        myview.addSubview(imageView)
    }
    
    //MARK: - scrollLogic
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let cell = HomeFirstTBVCell()
//        let y = 300 - (scrollView.contentOffset.y + 300)
//        print(y)
//        let height = min(max(y, 170), 400)
//        cell.imageViewHeight.constant = 50
//    }
}

