//
//  FoodCategoryModel.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import Foundation

struct FoodCategoryModel: Codable {
    var iconUrl: String
    var categoryId: Int32
    var categoryName: String
    
    enum CodingKeys: String, CodingKey {
        case iconUrl = "icon"
        case categoryId = "id"
        case categoryName = "name"
    }
}
