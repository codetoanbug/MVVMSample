//
//  MyTableViewCell.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/03/31.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /// Bind data for cell
    /// - Parameter animal: animal detail
    func bindData(animal: Animal) {
        titleLabel.text = animal.name
        if let image = UIImage(named: animal.image) {
            animalImageView.image = image
            animalImageView.setImageColor(color: UIColor.random())
        }
    }
}
