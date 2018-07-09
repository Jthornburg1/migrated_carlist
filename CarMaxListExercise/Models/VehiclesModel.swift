//
//  VehiclesModel.swift
//  CarMaxListExercise
//
//  Created by jonathan thornburg on 7/8/18.
//  Copyright © 2018 jonathan thornburg. All rights reserved.
//

import Foundation

struct VehiclesModel {
    
    var results: [VehicleModel]
    var disclaimerText: String
    
    init(dictionary: NSDictionary) {
        disclaimerText = dictionary["DisclaimerText"] as? String ?? ""
        results = [VehicleModel]()
        let dictArray = dictionary["Results"] as? [[String:AnyObject]] ?? [[String:AnyObject]]()
        for dict in dictArray {
            let vehicle = VehicleModel(dictionary: dict)
            results.append(vehicle)
        }
    }
}
