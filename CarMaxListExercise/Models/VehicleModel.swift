//
//  VehicleModel.swift
//  CarMaxListExercise
//
//  Created by jonathan thornburg on 7/8/18.
//  Copyright © 2018 jonathan thornburg. All rights reserved.
//

import Foundation

struct VehicleModel: Codable {
    
    var stockNumber: Int
    var description: String
    var price: Double
    var miles: String
    var storeName: String
    var highlights: String
    var photoUrl: String
    
    init(dictionary: [String:AnyObject]) {
        stockNumber = dictionary["StockNumber"] as? Int ?? -1
        description = dictionary["Description"] as? String ?? ""
        price = dictionary["Price"] as? Double ?? 0.0
        miles = dictionary["Miles"] as? String ?? ""
        storeName = dictionary["StoreName"] as? String ?? ""
        highlights = dictionary["Highlights"] as? String ?? ""
        photoUrl = dictionary["PhotoUrl"] as? String ?? ""
    }
}
