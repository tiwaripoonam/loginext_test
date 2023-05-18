//
//  HomeModel.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import Foundation

struct HomeModel: Codable {
    var status:Int
    var data:HomeDataModel
}
struct HomeDataModel: Codable {
    var banners: [BannerModel]
    var categories: [FoodCategoryModel]
    var activeVoucherCount : Int
    var offerCollection: [OfferModel]
    var restaurantCollection: [RestaurantCollectionModel]
    
    enum CodingKeys: String, CodingKey {
        case banners = "banners"
        case categories = "food_categories"
        case activeVoucherCount = "number_of_active_vouchers"
        case offerCollection = "offer_collections"
        case restaurantCollection = "restaurant_collections"
    }
}

