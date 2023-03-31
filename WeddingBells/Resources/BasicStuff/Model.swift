//
//  Localize.swift
//  SpeedCharge
//
//  Created by Keyur Baravaliya on 03/10/22.
//

import Foundation
import UIKit

class NewsDataModel{
    var headerName: String?
    var subType = [String]()
    var isExpandable = false
    
    init(headerName: String? = nil, subType: [String], isExpandable: Bool) {
        self.headerName = headerName
        self.subType = subType
        self.isExpandable = isExpandable
    }
}
