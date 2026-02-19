//
//  TopViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class TopViewCell: UICollectionViewCell {
    @IBOutlet weak var imgTop: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgTop.contentMode = .scaleAspectFill
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Force fill entire cell
        imgTop.frame = contentView.bounds

        // Perfect circle
        let radius = contentView.bounds.width / 2
        imgTop.layer.cornerRadius = radius
        imgTop.clipsToBounds = true

        // White border
        imgTop.layer.borderWidth = 3
        imgTop.layer.borderColor = UIColor.white.cgColor

        // Shadow
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
