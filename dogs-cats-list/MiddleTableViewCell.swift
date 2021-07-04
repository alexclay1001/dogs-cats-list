//
//  MiddleTableViewCell.swift
//  dogs-cats-list
//
//  Created by Aleksandra Glinina on 04.07.2021.
//

import UIKit

class MiddleTableViewCell: UITableViewCell {
    static let identifier = "MiddleTableViewCell"
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var leftName: UILabel!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
