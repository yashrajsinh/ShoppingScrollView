//
//  NewItemsCollectionViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 13/02/26.
//

import UIKit

class NewItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgNewItems: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgNewItems.clipsToBounds = true
        // White border
        imgNewItems.layer.borderWidth = 3
        imgNewItems.layer.borderColor = UIColor.white.cgColor

        // Shadow OUTSIDE the circle
        imgNewItems.layer.shadowColor = UIColor.white.cgColor
        imgNewItems.layer.shadowOpacity = 0.3
        imgNewItems.layer.shadowRadius = 4.0
        imgNewItems.layer.shadowOffset = CGSize(width: 1, height: 1)
        imgNewItems.layer.masksToBounds = false
        
        
    }
}
