//
//  HomeViewModel.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import Foundation

class HomeViewModel {
    var homeViewData:HomeModel?
    private let sourcesURL = URL(string: homeApiURL)!
    
    func getHomeData(completion : @escaping () -> ()) {
        URLSession.shared.dataTask(with: sourcesURL) { [weak self] (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                var empData = try! jsonDecoder.decode(HomeModel.self, from: data)
                var restaurantCollections = empData.data.restaurantCollection
                restaurantCollections = restaurantCollections.sorted { $0.collectionPriority < $1.collectionPriority }
                empData.data.restaurantCollection = restaurantCollections
                self?.homeViewData = empData
                completion()
            }
        }.resume()
    }
}
