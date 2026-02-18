//
//  SaleViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class SaleViewCell: UICollectionViewCell {
    @IBOutlet weak var imgSale: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imgSale.contentMode = .scaleAspectFill
        imgSale.clipsToBounds = true
        imgSale.layer.cornerRadius = 14

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        contentView.layer.masksToBounds = true

        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.08
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: 14
            ).cgPath
    }
}
