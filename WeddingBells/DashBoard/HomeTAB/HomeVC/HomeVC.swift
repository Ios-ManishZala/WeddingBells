//
//  HomeVC.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var homeTableviewheaderAndData = WeddingDecorData.getTableviewheaderAndData()
    var isFromFamousDecor:Bool = false
    var isFromTrendingDecor:Bool = false
    var isFromWeddingPackagedetails:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(of: HomeFirstTBVCell.self)
        tableView.register(of: CategoriesTBVCell.self)
        tableView.register(of: WeddingTBVCell.self)
        tableView.register(of: FamousTBVCell.self)
        tableView.register(of: TrendingDecorTBVCell.self)
        tableView.registerHeaderFooterView(of: CommonTbvHeaderView.self)
    }

}

//MARK: - DataSource.

extension HomeVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.homeTableviewheaderAndData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let homeFirstCell = tableView.dequeueReusableCell(withType: HomeFirstTBVCell.self)
            homeFirstCell.onTapSelectCountryAction = {
                let vc = SelectCityVC()
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .overCurrentContext
                self.present(vc, animated: true)
            }
            homeFirstCell.onTapNotificationAction = {
                self.pushVC(NotifiactionVC())
            }
            homeFirstCell.onTapSearchAction = {
                self.pushVC(SerchBookVC())
            }
            return homeFirstCell
        }else if indexPath.section == 1 {
            let homeSecondCell = tableView.dequeueReusableCell(withType: CategoriesTBVCell.self)
            homeSecondCell.onTapCategoriesIndex = {
                self.pushVC(VenueVC())
            }
            return homeSecondCell
        }else if indexPath.section == 2 {
            let homeThirdCell = tableView.dequeueReusableCell(withType: WeddingTBVCell.self)
            homeThirdCell.onTapWeddingIndex = {
                let vc = VenueDetailsVC()
                self.isFromWeddingPackagedetails = true
                vc.isFromWeddingPackagedetails = self.isFromWeddingPackagedetails
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return homeThirdCell
        }else if indexPath.section == 3 {
            let homeFourthCell = tableView.dequeueReusableCell(withType: FamousTBVCell.self)
            homeFourthCell.onTapFamousIndex = {
                self.pushVC(VenueDetailsVC())
            }
            return homeFourthCell
        }else{
            let homeLastCell = tableView.dequeueReusableCell(withType: TrendingDecorTBVCell.self)
            homeLastCell.onTapTrendingIndex = {
                self.pushVC(VenueDetailsVC())
            }
            return homeLastCell
        }
    }
    
    //MARK: - headerView confirgation.
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withType: CommonTbvHeaderView.self)
        headerView.lblTitle.text = self.homeTableviewheaderAndData[section].headerName
        if section == 0 || section == 1 {
            headerView.btnSeeAll.isHidden = true
        }else{
            headerView.btnSeeAll.isHidden = false
            headerView.btnSeeAll.setTitle("View all".localized(), for: .normal)
            if section == 2 {
                headerView.onTapSeeAll = {
                    self.pushVC(WeddingPackageVC())
                }
            }else if section == 3{
                headerView.onTapSeeAll = {
                    let vc = WeddingPackageVC()
                    self.isFromFamousDecor = true
                    vc.isFromFamousDecor = self.isFromFamousDecor
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }else if section == 4{
                headerView.onTapSeeAll = {
                    let vc = WeddingPackageVC()
                    self.isFromTrendingDecor = true
                    vc.isFromTrendingDecor = self.isFromTrendingDecor
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? .leastNonzeroMagnitude : 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? .leastNonzeroMagnitude : 8
    }
    
    //MARK: - scrollLogic
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let y = 300 - (scrollView.contentOffset.y + 300)
//        let height = min(max(y, 170), 400)
//        cell.imageViewHeight.constant = 50
//    }
}
