//
//  RestaurantHeaderView.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 17/05/23.
//

import UIKit

class RestaurantHeaderView: UICollectionReusableView {
    @IBOutlet weak var restaurantHeaderMore: UILabel!
    @IBOutlet weak var restaurantHeaderTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        restaurantHeaderTitle.font = UIFont.boldSystemFont(ofSize: 14.0)
        restaurantHeaderMore.font = UIFont.systemFont(ofSize: 12.0)
        restaurantHeaderMore.textColor = .lightGray
        self.backgroundColor = .clear
    }
}
