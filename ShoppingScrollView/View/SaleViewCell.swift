//
//  SaleViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class SaleViewCell: UICollectionViewCell {
    @IBOutlet weak var imgSale: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgSale.clipsToBounds = true
        // White border
        imgSale.layer.borderWidth = 2
        imgSale.layer.borderColor = UIColor.systemGray5.cgColor

        // Shadow OUTSIDE the circle
        imgSale.layer.shadowColor = UIColor.black.cgColor
        imgSale.layer.shadowOpacity = 0.3
        imgSale.layer.shadowRadius = 2.0
        imgSale.layer.shadowOffset = CGSize(width: 1, height: 1)
        imgSale.layer.masksToBounds = false
    }
}
