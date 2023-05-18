//
//  OfferModel.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import Foundation
struct OfferModel: Codable {
    
    var offerName: String
    var imageUrl: String?
    var offerId: Int32
    var offerTextColor:String?
    var offerBackgroundColor:String?
    
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image"
        case offerId = "id"
        case offerName = "name"
        case offerTextColor = "textcolor"
        case offerBackgroundColor = "background"
    }
}

