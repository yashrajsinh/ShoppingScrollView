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
        // Card (the cell itself)
        // ── Image ───────────────────────────────────────────
        imgPopularItems.contentMode = .scaleAspectFill
        imgPopularItems.clipsToBounds = true
        imgPopularItems.layer.cornerRadius = 30

        // ── contentView card style ───────────────────────────
        // contentView is NOT clipped by the cell, so shadow works here
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = false

        // Shadow on contentView (works because cell clips, not contentView)
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.55  // visible shadow
        contentView.layer.shadowRadius = 10
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Update shadow path for performance (matches the card shape)
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: 20
            ).cgPath
    }
}
