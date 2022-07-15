//
//  UpcomingCollectionViewCell.swift
//  naosabe
//
//  Created by livia on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(image: UIImage, title: String, data: String) {
        self.image.image = image
        titleLabel.text = title
        dateLabel.text = data
    }
    
}
