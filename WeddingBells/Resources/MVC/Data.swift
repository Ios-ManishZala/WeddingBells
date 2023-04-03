//
//  Data.swift
//  WeddingBells
//
//  Created by Keyur Baravaliya on 01/04/23.
//

import Foundation
import UIKit

class WeddingDecorData{
    
    static func getCategoryDecorData() -> [DecorPackageModel]{
        var decoreModel = [DecorPackageModel]()
        decoreModel = [
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category1"),decorpackageName: "Decoration"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category2"),decorpackageName: "Makup"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category3"),decorpackageName: "Catering"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category4"),decorpackageName: "Bridal wear"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category5"),decorpackageName: "Groom wear"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category6"),decorpackageName: "Jewellery"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_category7"),decorpackageName: "Photographers")
        ]
        return decoreModel
    }
    
    static func getTableviewheaderAndData() -> [WeddingDataModel] {
        var tableViewData = [WeddingDataModel]()
        tableViewData = [
            WeddingDataModel.init(headerName: "", decorPackageDetails: []),
            WeddingDataModel.init(headerName: "Categories", decorPackageDetails: WeddingDecorData.getCategoryDecorData()),
            WeddingDataModel.init(headerName: "Wedding package", decorPackageDetails: WeddingDecorData.getWeddingDecorData()),
            WeddingDataModel.init(headerName: "Famous wedding venue", decorPackageDetails: WeddingDecorData.getFamouesDecorData()),
            WeddingDataModel.init(headerName: "Tranding decor", decorPackageDetails: WeddingDecorData.getTrendingDecorData())
        ]
        return tableViewData
    }
    
    static func getWeddingDecorData() -> [DecorPackageModel] {
        var weddingViewData = [DecorPackageModel]()
        weddingViewData = [
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor1"),
                                   decorpackageName: "Sunset View Wedding",
                                   decorTime: "25 guest(2 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor2"),
                                   decorpackageName: "Della Resorts",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor3"),
                                   decorpackageName: "The Leela Goa",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor4"),
                                   decorpackageName: "Rainforest Resort",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards")
        ]
        return weddingViewData
    }
    
    static func getFamouesDecorData() -> [DecorPackageModel] {
        var famousViewData = [DecorPackageModel]()
        famousViewData = [
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor5"),
                                   decorpackageName: "Gallery Metro",
                                   decorTime: "25 guest(2 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor6"),
                                   decorpackageName: "Sunset View Wedding",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor7"),
                                   decorpackageName: "Serenity Grove",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor8"),
                                   decorpackageName: "Rainforest Resort",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards")
        ]
        return famousViewData
    }
    
    static func getTrendingDecorData() -> [DecorPackageModel] {
        var trendingViewData = [DecorPackageModel]()
        trendingViewData = [
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor9"),
                                   decorpackageName: "Gallery Metro",
                                   decorTime: "25 guest(2 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor10"),
                                   decorpackageName: "Sunset View Wedding",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor11"),
                                   decorpackageName: "Serenity Grove",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_wediingDecor12"),
                                   decorpackageName: "Rainforest Resort",
                                   decorTime: "45 guest(1 night)",
                                   decorAmount: "$56 onwards")
        ]
        return trendingViewData
    }
    
    static func getAlbums() -> [DecorPackageModel] {
        var famousViewData = [DecorPackageModel]()
        famousViewData = [
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_album1"),
                                   decorpackageName: "Main hall",
                                   decorTime: "150 image",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_album2"),
                                   decorpackageName: "Dining area",
                                   decorTime: "20 image",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_album3"),
                                   decorpackageName: "Serenity Grove",
                                   decorTime: "20 image",
                                   decorAmount: "$56 onwards"),
            DecorPackageModel.init(decorImageName: UIImage(named: "ic_album4"),
                                   decorpackageName: "Dining area",
                                   decorTime: "200 image",
                                   decorAmount: "$56 onwards")
        ]
        return famousViewData
    }
    
    static func getUserReviewData() -> [ReviewModel] {
        var trendingViewData = [ReviewModel]()
        trendingViewData = [
            ReviewModel.init(userImage: UIImage(named: "ic_review1"),userName: "Jerome Bell"),
            ReviewModel.init(userImage: UIImage(named: "ic_review2"),userName: "Eleanor Pena"),
            ReviewModel.init(userImage: UIImage(named: "ic_review3"),userName: "Ralph Edwards")
        ]
        return trendingViewData
    }
}


