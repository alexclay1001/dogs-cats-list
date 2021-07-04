//
//  CatModel.swift
//  dogs-cats-list
//
//  Created by Aleksandra Glinina on 04.07.2021.
//

import UIKit

struct CatModel: Codable {
    var id: String
    var name: String
    var description: String
    var reference_image_id: String?
    var image: CatImage?
}
