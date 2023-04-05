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
            ReviewModel.init(userImage: UIImage(named: "ic_review3"),userName: "Ralph Edwards"),
            ReviewModel.init(userImage: UIImage(named: "ic_review3"),userName: "Ralph Edwards"),
            ReviewModel.init(userImage: UIImage(named: "ic_review1"),userName: "Jerome Bell")
        ]
        return trendingViewData
    }
    
    static func NotificationData() -> [NotificationDetails] {
        var notificationDetaillist = [NotificationDetails]()
        notificationDetaillist = [
                               NotificationDetails(title: "Venue Booking ".localized(),
                                                   Description: "Your venue Blue Sea Banquets booking successfully.".localized(),
                                                   time: "2 min ago".localized()),
                                NotificationDetails(title: "Makup artist".localized(),
                                                    Description: "Your bridal makup booking is confirm at 22 jan 2022".localized(),
                                                    time: "2 min ago".localized()),
                                NotificationDetails(title: "Photographers".localized(),
                                                    Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi".localized(),
                                                    time: "2 min ago".localized()),
                                NotificationDetails(title: "Mahendi artist".localized(),
                                                    Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi".localized(),
                                                    time: "2 min ago".localized()),
                                NotificationDetails(title: "Caterers".localized(),
                                                    Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi".localized(),
                                                    time: "2 min ago".localized()),
                               NotificationDetails(title: "Budget plan".localized(),
                                                   Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero mattis a netus morbi".localized(),
                                                   time: "2 min ago".localized())
                            ]
        return notificationDetaillist
    }
    
    static func VenoreData() -> [VendorModel]{
        var venorDetails = [VendorModel]()
        venorDetails = [
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor1"),vendorName: "Venue",vendorType: "Farmhose, lawn, banquets hall"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor2"),vendorName: "Decor",vendorType: "Wedding planners, decoration"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor3"),vendorName: "Catering",vendorType: "Catering service, cake"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor4"),vendorName: "Makup artist",vendorType: "Bridal makup, family makup"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor5"),vendorName: "Bridal wear",vendorType: "Bridal lehengas, Gowns"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor6"),vendorName: "Groom wear",vendorType: "Shervani, wedding suits"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor7"),vendorName: "Photographers",vendorType: "Video, photographer"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor8"),vendorName: "Jewellery",vendorType: "Bridal jewellery"),
            VendorModel.init(vendorImage: UIImage(named: "ic_vendor9"),vendorName: "Invitation",vendorType: "Invitation card")
        ]
        return venorDetails
    }
    
    static func MessageData() -> [ChatDetails] {
        let userChatDetails = [
                            ChatDetails.init(name: "Savannah Nguyen", image: UIImage(named: "Ellipse 19")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: "1"),
                            ChatDetails.init(name: "Sweet Family", image: UIImage(named: "Ellipse 19-1")!, message: "Nice! Get well soon", time: "1.00am", unReadMessage: "10"),
                            ChatDetails.init(name: "jeklin Shah", image: UIImage(named: "Ellipse 19-2")!, message: "Oww! so sweet of you", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Cameron Williamson", image: UIImage(named: "Ellipse 19-3")!, message: "Oww! so sweet of you", time: "4.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Friends forever", image: UIImage(named: "Ellipse 19-4")!, message: "Hello", time: "2.00am", unReadMessage: "5"),
                            ChatDetails.init(name: "Robert Fox", image: UIImage(named: "Ellipse 19-5")!, message: "Hello", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Cody Fisher", image: UIImage(named: "Ellipse 19-6")!, message: "Oww! so sweet of you", time: "2.00am", unReadMessage: "2"),
                            ChatDetails.init(name: "Bessie Cooper", image: UIImage(named: "Ellipse 19-7")!, message: "Nice! Get well soon", time: "5.00am", unReadMessage: ""),
                            ChatDetails.init(name: "School friends", image: UIImage(named: "Ellipse 19-8")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Albert Flores", image: UIImage(named: "Ellipse 19-9")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Albert Flores", image: UIImage(named: "Ellipse 19-10")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Jerome Bell", image: UIImage(named: "Ellipse 19-11")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Devon Lane", image: UIImage(named: "Ellipse 19-12")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: ""),
                            ChatDetails.init(name: "Marvin McKinney", image: UIImage(named: "Ellipse 19-13")!, message: "Nice! Get well soon", time: "2.00am", unReadMessage: "")
                          ]
        return userChatDetails
    }
    
    static func MessageListData() -> [Message] {
        var messageList:[Message] = []
        messageList = [
                                Message.init(message: "Hello I want book this hall", Time: "1:30 pm"),
                                Message.init(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis sed sodales purus", Time: "1:30 pm"),
                                Message.init(message: "Fine..Canyou send me pic", Time: "1:30 pm"),
                                Message.init(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis sed sodales purus", Time: "1:30 pm"),
                                Message.init(message: "Okay..plz dont forget", Time: "1:30 pm"),
                                Message.init(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis sed sodales purus", Time: "1:30 pm"),
                                Message.init(message: "😍😍😍😍😍", Time: "1:30 pm")
                            ]
        return messageList
    }
    
    static func TaskListData() -> [TaskDataModel] {
        let taskList = [
            TaskDataModel.init(taskImage: UIImage(named: "ic_task1"),taskName: "To do list",taskDes: "05/10"),
            TaskDataModel.init(taskImage: UIImage(named: "ic_task2"),taskName: "Guestlist",taskDes: "02/10"),
            TaskDataModel.init(taskImage: UIImage(named: "ic_task3"),taskName: "Vendor shortlist",taskDes: "05/10"),
            TaskDataModel.init(taskImage: UIImage(named: "ic_task4"),taskName: "Budget",taskDes: "$5400")
        ]
        return taskList
    }
    
    static func VendorShortlistData() -> [VendorShortlistModel] {
        let vendorList = [
            VendorShortlistModel.init(title: "Venues",addtoshortlist: "3 result",isCreatShortlist: false,vendorImage: UIImage(named: "ic_vendor1")),
            VendorShortlistModel.init(title: "Makup artist",addtoshortlist: "3 result",isCreatShortlist: false,vendorImage: UIImage(named: "ic_vendor2")),
            VendorShortlistModel.init(title: "Jewellery",addtoshortlist: "2 result",isCreatShortlist: false,vendorImage: UIImage(named: "ic_vendor3")),
            VendorShortlistModel.init(title: "Bridal wear",addtoshortlist: "3 result",isCreatShortlist: false,vendorImage: UIImage(named: "ic_vendor4")),
            VendorShortlistModel.init(title: "Groom wear",addtoshortlist: "add to shortlist",isCreatShortlist: true),
            VendorShortlistModel.init(title: "Photographers",addtoshortlist: "add to shortlist",isCreatShortlist: true),
            VendorShortlistModel.init(title: "Food",addtoshortlist: "add to shortlist",isCreatShortlist: true),
            VendorShortlistModel.init(title: "Invitation",addtoshortlist: "add to shortlist",isCreatShortlist: true),
            VendorShortlistModel.init(title: "Decoration",addtoshortlist: "add to shortlist",isCreatShortlist: true)
        ]
        return vendorList
    }
    
    static func ExpenesesData() -> [BudgetViewModal] {
        let expensesList = [
            BudgetViewModal.init(expensesName: "Venues",expensesAmount: "$1000"),
            BudgetViewModal.init(expensesName: "Makup artist",expensesAmount: "$800"),
            BudgetViewModal.init(expensesName: "Jewellery",expensesAmount: "$400"),
            BudgetViewModal.init(expensesName: "Caterers",expensesAmount: "$1000"),
            BudgetViewModal.init(expensesName: "Bridal wear",expensesAmount: "$900"),
            BudgetViewModal.init(expensesName: "Bridal jewllery",expensesAmount: "$400"),
            BudgetViewModal.init(expensesName: "Groom were",expensesAmount: "$800"),
            BudgetViewModal.init(expensesName: "Photographer",expensesAmount: "$2400")
        ]
        return expensesList
    }
}


