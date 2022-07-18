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
    
    let monthNumberToName = ["01-": "Jan ",
                             "02-": "Fev ",
                             "03-": "Mar ",
                             "04-": "Abr ",
                             "05-": "Mai ",
                             "06-": "Jun ",
                             "07-": "Jul ",
                             "08-": "Ago ",
                             "09-": "Set ",
                             "10-": "Out ",
                             "11-": "Nov ",
                             "12-": "Dez "]
    
    func setup(image: UIImage, title: String, data: String) {
        self.image.image = image
        titleLabel.text = title
        dateLabel.text = convertDate(data: String(data.suffix(5)))
    }
    func convertDate(data: String) -> String {
        return (monthNumberToName[String(data.prefix(3))] ?? "") + String(data.suffix(2))
    }
}
