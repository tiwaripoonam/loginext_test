//
//  OffersCollectionViewCell.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func configure(with item: OfferModel) {
        titleLabel.text = item.offerName
        if item.imageUrl != nil{
            imageView.sd_setImage(with:URL(string: item.imageUrl!))
        }
    }
}
