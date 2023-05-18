//
//  RecommendCollectionViewCell.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import UIKit
import SDWebImage
class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var extraOfferLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var offersStack: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        extraOfferLabel.font = UIFont.systemFont(ofSize: 12.0)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        extraOfferLabel.layer.cornerRadius = 10
        extraOfferLabel.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        extraOfferLabel.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        distanceLabel.font = UIFont.systemFont(ofSize: 10.0)
        ratingLabel.font = UIFont.systemFont(ofSize: 10.0)
        distanceLabel.textColor = .lightGray
        ratingLabel.textColor = .lightGray
    }
    
    func configure(with item: RestaurantModel) {
        ratingLabel.text = String(item.rating)
        distanceLabel.text = item.displayDistance
        imageView.sd_setImage(with:URL(string: item.imageUrl))
        extraOfferLabel.text = item.additionalOffer
        titleLabel.text = item.restaurantName
        configureOffersStack(offerArray: item.offers)
    }
    
    func configureOffersStack(offerArray:[OfferModel]){
        
        for i in 0..<offerArray.count
        {
            let offerModel = offerArray[i]
            let label:UILabel = UILabel()
            label.tag = i
            
            if offerModel.offerBackgroundColor != nil
            {
                if let bgcolor = UIColor(hex: offerModel.offerBackgroundColor!) {
                    label.backgroundColor = bgcolor
                }
                else {
                    label.backgroundColor = .white
                }
            }
            else {
                label.backgroundColor = .white
            }
            
            if offerModel.offerTextColor != nil
            {
                if let textcolor = UIColor(hex: offerModel.offerTextColor!) {
                    label.textColor = textcolor
                }
                else {
                    label.textColor = .black
                }
            }else {
                label.textColor = .black
            }
            
            label.text = offerModel.offerName
            label.font = UIFont.systemFont(ofSize: 8.0)
            offersStack.addArrangedSubview(label)
        }
    }
}
