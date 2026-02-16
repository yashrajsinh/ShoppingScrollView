//
//  PopularViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class PopularViewCell: UICollectionViewCell {
    @IBOutlet weak var imgPopularItems: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtDesc: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        //Images border
//        imgPopularItems.clipsToBounds = true
//        // Shadow OUTSIDE the circle
//        imgPopularItems.layer.shadowColor = UIColor.white.cgColor
//        imgPopularItems.layer.shadowOpacity = 0.4
//        imgPopularItems.layer.shadowRadius = 4.0
//        imgPopularItems.layer.shadowOffset = CGSize(width: 1, height: 1)
//        imgPopularItems.layer.masksToBounds = false
//        
//        // White border
//        imgPopularItems.layer.borderWidth = 2
//        imgPopularItems.layer.borderColor = UIColor.white.cgColor
//        
        //Borders to self
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.systemGray6.cgColor
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
        
        //cornder radius
        
    }
}
