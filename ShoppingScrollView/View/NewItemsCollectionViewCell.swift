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
        // Shadow OUTSIDE the circle
        // Rounded corners on the image - matches the screenshot
        imgNewItems.layer.cornerRadius = 12
        imgNewItems.layer.borderWidth = 2
        imgNewItems.clipsToBounds = true
        imgNewItems.contentMode = .scaleAspectFill

        // Soft shadow on the cell card
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.08
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.masksToBounds = false
        
    }
}
