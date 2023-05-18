//
//  DealsHeaderView.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 18/05/23.
//

import UIKit

class DealsHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
    }
}
