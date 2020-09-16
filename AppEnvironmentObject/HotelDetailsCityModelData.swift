//
//  HotelDetailsCityModelData.swift
//  AppEnvironmentObject
//
//  Created by Ananda Afryan Gemilang on 14/09/20.
//  Copyright © 2020 Ananda Afryan Gemilang. All rights reserved.
//

import Foundation

struct HotelDetailsCityModel : Identifiable {
    var id: Int
    
    let pictureName: String
    let hotelName: String
    let hotelPrice: String
    let hotelAddress: String
    let hotelNights: String
    let hotelDistance: Int
    
    init(id: Int, pictureName: String, hotelName: String, hotelPrice: String, hotelAddress: String, hotelNights: String, hotelDistance: Int) {
        self.id = id
        self.pictureName = pictureName
        self.hotelName = hotelName
        self.hotelPrice = hotelPrice
        self.hotelAddress = hotelAddress
        self.hotelNights = hotelNights
        self.hotelDistance = hotelDistance
    }
}
