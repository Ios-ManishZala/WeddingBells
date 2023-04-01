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
