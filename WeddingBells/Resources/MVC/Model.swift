//
//  Localize.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 03/10/22.
//

import Foundation
import UIKit


class WeddingDataModel{
    var headerName: String?
    var decorPackageDetails:[DecorPackageModel]
    
    init(headerName:String?,decorPackageDetails: [DecorPackageModel]) {
        self.headerName = headerName
        self.decorPackageDetails = decorPackageDetails
    }
}

class DecorPackageModel {
    var decorImageName: UIImage?
    var decorpackageName: String?
    var decorTime: String?
    var decorAmount: String?
    var decorRating: String?
    
    init(decorImageName: UIImage? = nil, decorpackageName: String? = nil, decorTime: String? = nil, decorAmount: String? = nil, decorRating: String? = nil) {
        self.decorImageName = decorImageName
        self.decorpackageName = decorpackageName
        self.decorTime = decorTime
        self.decorAmount = decorAmount
        self.decorRating = decorRating
    }
}


class ReviewModel {
    var userImage: UIImage?
    var userName: String?
    
    init(userImage: UIImage? = nil, userName: String? = nil) {
        self.userImage = userImage
        self.userName = userName
    }
}


struct NotificationDetails{
    var title:String
    var Description:String
    var time:String
}

class VendorModel {
    var vendorImage: UIImage?
    var vendorName: String?
    var vendorType: String?
    
    init(vendorImage: UIImage? = nil, vendorName: String? = nil, vendorType: String? = nil) {
        self.vendorImage = vendorImage
        self.vendorName = vendorName
        self.vendorType = vendorType
    }
}

struct ChatDetails{
    var name:String
    var image:UIImage
    var message:String
    var time:String
    var unReadMessage:String
}

struct Message{
    var message:String
    var Time:String
}
