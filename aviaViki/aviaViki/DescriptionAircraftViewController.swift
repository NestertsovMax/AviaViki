//
//  descriptionAircraftViewController.swift
//  aviaViki
//
//  Created by M1 on 16.07.2022.
//

import UIKit

class DescriptionAircraftViewController: UIViewController {
    
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var modelImageView: UIImageView!
    var model: AviaModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = model?.name ?? ""
        descriptionTextView.text = model?.description
        modelImageView.image = model?.image
    }
}
