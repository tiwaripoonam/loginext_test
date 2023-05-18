//
//  RestaurantModel.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import Foundation

struct RestaurantCollectionModel: Codable {
    
    var collectionName: String
    var collectionPriority: Int32
    var restaurants: [RestaurantModel]
    enum CodingKeys: String, CodingKey {
        case collectionName = "name"
        case collectionPriority = "priority"
        case restaurants = "restaurants"
    }
}

struct RestaurantModel: Codable {
    
    var restaurantName: String
    var imageUrl: String
    var restaurantId: Int32
    var displayDistance: String
    var rating: Float
    var offers: [OfferModel]
    var additionalOffer: String?
    
    
    enum CodingKeys: String, CodingKey {
        case restaurantName = "name"
        case imageUrl = "image_url"
        case restaurantId = "id"
        case displayDistance = "display_distance"
        case rating = "rating"
        case offers = "offers"
        case additionalOffer = "additional_offer"
    }
}


