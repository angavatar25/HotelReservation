//
//  DataModel.swift
//  AppEnvironmentObject
//
//  Created by Ananda Afryan Gemilang on 14/09/20.
//  Copyright © 2020 Ananda Afryan Gemilang. All rights reserved.
//

import Foundation

struct DataModel : Identifiable {
    var id: Int
    
    let pictureName: String
    let cityName: String
    let amountOfProperties: Int
    
    init(id: Int, pictureName: String, cityName: String, amountOfProperties: Int) {
        self.id = id
        self.pictureName = pictureName
        self.cityName = cityName
        self.amountOfProperties = amountOfProperties
    }
}
