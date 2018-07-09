//
//  VehicleCell.swift
//  CarMaxListExercise
//
//  Created by jonathan thornburg on 7/8/18.
//  Copyright © 2018 jonathan thornburg. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceMilesLabel: UILabel!
    @IBOutlet weak var featuresLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    let numFormatter = NumberFormatter()
    
    override func awakeFromNib() {
        numFormatter.usesGroupingSeparator = true
        numFormatter.numberStyle = .currency
        numFormatter.locale = Locale.current
        numFormatter.maximumFractionDigits = 0
    }
    
    override func prepareForReuse() {
        descriptionLabel.text = ""
        priceMilesLabel.text = ""
        featuresLabel.text = ""
        locationLabel.text = ""
    }
    
    func configureFor(vehicle: VehicleModel) {
        descriptionLabel.text = vehicle.description
        let priceString = numFormatter.string(from: vehicle.price as NSNumber) ?? ""
        priceMilesLabel.text = String(format: "%@ • %@ Miles",priceString, vehicle.miles)
        featuresLabel.text = vehicle.highlights
        locationLabel.text = vehicle.storeName
    }
}
