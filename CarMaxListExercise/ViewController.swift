//
//  ViewController.swift
//  CarMaxListExercise
//
//  Created by jonathan thornburg on 7/8/18.
//  Copyright © 2018 jonathan thornburg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var vehicles = [VehicleModel]()
    let tableCellId = "VehicleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        let cellNib = UINib(nibName: tableCellId, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: tableCellId)
        viewWillLayoutSubviews()
        VehiclesService.shared.getVehicles { (vehiclesModel) in
            self.vehicles = vehiclesModel.results
            self.tableView.reloadData()
        }
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId) as? VehicleCell else { return UITableViewCell() }
        cell.configureFor(vehicle: vehicles[indexPath.row]) 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

