//
//  ForYouViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 17/02/26.
//

import UIKit

class ForYouViewCell: UICollectionViewCell {
    @IBOutlet weak var imgModel: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }

    private func setupCard() {
        // Card (the cell itself)
        // ── Image ───────────────────────────────────────────
        imgModel.contentMode = .scaleAspectFill
        imgModel.clipsToBounds = true
        imgModel.layer.cornerRadius = 30

        // ── contentView card style ───────────────────────────
        // contentView is NOT clipped by the cell, so shadow works here
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 30
        contentView.layer.masksToBounds = false

        // Shadow on contentView (works because cell clips, not contentView)
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.55  // visible shadow
        contentView.layer.shadowRadius = 20
        contentView.layer.shadowOffset = CGSize(width: 5, height: 5)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Update shadow path for performance (matches the card shape)
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: 15
            ).cgPath
    }
}

