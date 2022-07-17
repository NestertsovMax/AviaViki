//
//  AircraftTableViewCell.swift
//  aviaViki
//
//  Created by M1 on 16.07.2022.
//

import UIKit

class AircraftTableViewCell: UITableViewCell {

    @IBOutlet var airImage: UIImageView!
    @IBOutlet var nameTypeLabel: UILabel!
    @IBOutlet var modelsCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func update(aircraft: String, image: UIImage, count: Int) {
        airImage.image = image
        nameTypeLabel.text = aircraft
        modelsCountLabel.text = "\(count)"
    }

}

