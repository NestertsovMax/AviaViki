//
//  ModelTableViewCell.swift
//  aviaViki
//
//  Created by M1 on 16.07.2022.
//

import UIKit

class ModelTableViewCell: UITableViewCell {

    @IBOutlet var modelImage: UIImageView!
    @IBOutlet var modelTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func update(aircraft: String, image: UIImage) {
        modelImage.image = image
        modelTypeLabel.text = aircraft
    }
}
