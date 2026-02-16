//
//  TopViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class TopViewCell: UICollectionViewCell {
    @IBOutlet weak var imgTop : UIImageView!
    
    override func layoutSubviews() {
        
        imgTop.clipsToBounds = true
        imgTop.layer.cornerRadius = imgTop.bounds.width / 2
        imgTop.contentMode = .scaleAspectFill

        // White border
        imgTop.layer.borderWidth = 3
        imgTop.layer.borderColor = UIColor.white.cgColor

        // Shadow OUTSIDE the circle
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.masksToBounds = false
    }
}
