//
//  StoriesViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 12/02/26.
//

import UIKit

class StoriesViewCell: UICollectionViewCell {
    @IBOutlet weak var imgStories: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgStories.contentMode = .scaleAspectFill
        imgStories.clipsToBounds = true
        imgStories.layer.cornerRadius = 20

        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true

        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: 10
            ).cgPath
    }
}
