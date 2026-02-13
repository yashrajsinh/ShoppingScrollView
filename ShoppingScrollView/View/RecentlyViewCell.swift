//
//  RecentlyViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 12/02/26.
//

import UIKit

class RecentlyViewCell: UICollectionViewCell {

    @IBOutlet weak var recentlyViewItems: UIImageView!

    override func layoutSubviews() {
        recentlyViewItems.clipsToBounds = true
        recentlyViewItems.layer.cornerRadius =
            recentlyViewItems.bounds.width / 2
        recentlyViewItems.contentMode = .scaleAspectFill

        // White border
        recentlyViewItems.layer.borderWidth = 3
        recentlyViewItems.layer.borderColor = UIColor.white.cgColor

        // Shadow OUTSIDE the circle
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.masksToBounds = false
    }
}
