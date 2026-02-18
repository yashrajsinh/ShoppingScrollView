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
        imgStories.layer.cornerRadius = 16

        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true

        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.12
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: 16
            ).cgPath
    }
}
