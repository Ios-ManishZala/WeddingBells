//
//  TableviewDatasource.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 31/03/23.
//

import Foundation
import UIKit


class HomeTableviewDatasource: NSObject, UITableViewDelegate,UITableViewDataSource {
    
    var homeTableviewheaderAndData = WeddingDecorData.getTableviewheaderAndData()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.homeTableviewheaderAndData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let homeFirstCell = tableView.dequeueReusableCell(withType: HomeFirstTBVCell.self)
            return homeFirstCell
        }else if indexPath.section == 1 {
            let homeSecondCell = tableView.dequeueReusableCell(withType: CategoriesTBVCell.self)
            return homeSecondCell
        }else if indexPath.section == 2 {
            let homeThirdCell = tableView.dequeueReusableCell(withType: WeddingTBVCell.self)
            return homeThirdCell
        }else if indexPath.section == 3 {
            let homeFourthCell = tableView.dequeueReusableCell(withType: FamousTBVCell.self)
            return homeFourthCell
        }else{
            let homeLastCell = tableView.dequeueReusableCell(withType: TrendingDecorTBVCell.self)
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
//        let cell =
//        let y = 300 - (scrollView.contentOffset.y + 300)
//        print(y)
//        let height = min(max(y, 170), 400)
//        cell.imageViewHeight.constant = 50
//    }

}
