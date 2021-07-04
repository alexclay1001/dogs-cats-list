//
//  TopTableViewCell.swift
//  dogs-cats-list
//
//  Created by Aleksandra Glinina on 04.07.2021.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    static let identifier = "TopTableViewCell"

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
