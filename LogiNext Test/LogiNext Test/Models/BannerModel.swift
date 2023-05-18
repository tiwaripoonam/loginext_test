//
//  BannerModel.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import Foundation

struct BannerModel: Codable {
    var imageUrl: String
    var bannerId: Int32
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case bannerId = "id"
    }
}
