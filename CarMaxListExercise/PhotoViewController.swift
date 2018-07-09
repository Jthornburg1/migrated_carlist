//
//  PhotoViewController.swift
//  CarMaxListExercise
//
//  Created by jonathan thornburg on 7/8/18.
//  Copyright © 2018 jonathan thornburg. All rights reserved.
//

protocol ChildPhotoVCDelegate {
    func removeChildVC()
}

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var ImageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var delegate: ChildPhotoVCDelegate?
    var vehiclePhotoUrl: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageContainerView.layer.cornerRadius = 3
        setPhoto()
    }
    @IBAction func didTapClose(_ sender: Any) {
        delegate?.removeChildVC()
    }
    
    func setPhoto() {
        VehiclesService.shared.getPhotoData(from: vehiclePhotoUrl) { (data) in
            guard let dta = data else { return }
            guard let image = UIImage(data: dta) else { return }
            self.imageView.image = image
        }
    }
}
