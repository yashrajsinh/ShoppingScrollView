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

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }

    private func setupCard() {
        imgPopularItems.clipsToBounds = true
        imgPopularItems.layer.cornerRadius = 20

        // White border
        contentView.layer.borderColor = UIColor.white.cgColor
        // Shadow on cell
        contentView.backgroundColor = .clear
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 20
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.15
        contentView.layer.shadowRadius = 5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
       
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath =
            UIBezierPath(
                roundedRect: contentView.bounds,
                cornerRadius: 15
            ).cgPath
    }
}
