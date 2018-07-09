//
//  VehiclesService.swift
//  CarMaxListExercise
//
//  Created by jonathan thornburg on 7/8/18.
//  Copyright © 2018 jonathan thornburg. All rights reserved.
//

import Foundation

struct VehiclesService {
    
    public static let shared = VehiclesService()
    
    fileprivate init(){}
    
    func getVehicles(completion: @escaping (VehiclesModel) -> ()) {
        let queue = DispatchQueue.global()
        queue.async {
            guard let url = Bundle.main.url(forResource: "vehicles", withExtension: "plist") else { return }
            guard let dictionary = NSDictionary(contentsOf: url) else { return }
            let vehiclesModel = VehiclesModel(dictionary: dictionary)
            DispatchQueue.main.async(execute: {
                completion(vehiclesModel)
            })
        }
    }
}
