//
//  RecentlyViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 12/02/26.
//

import UIKit

class RecentlyViewCell: UICollectionViewCell {

    @IBOutlet weak var recentlyViewItems: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        recentlyViewItems.contentMode = .scaleAspectFill
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Force the imageView to fill the entire cell
        recentlyViewItems.frame = contentView.bounds

        // Perfect circle
        let radius = contentView.bounds.width / 2
        recentlyViewItems.layer.cornerRadius = radius
        recentlyViewItems.clipsToBounds = true

        // White border
        recentlyViewItems.layer.borderWidth = 3
        recentlyViewItems.layer.borderColor = UIColor.white.cgColor

        // Shadow on cell
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.cornerRadius = radius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowPath =
            UIBezierPath(
                ovalIn: self.bounds
            ).cgPath
    }
}
