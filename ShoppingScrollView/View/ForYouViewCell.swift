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
        // No card — transparent background
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        self.layer.masksToBounds = false
        contentView.layer.masksToBounds = false

        // Image styling — rounded, no border
        imgModel.contentMode = .scaleAspectFill
        imgModel.clipsToBounds = true
        imgModel.layer.cornerRadius = 12
        imgModel.layer.cornerCurve = .continuous

        // Shadow directly on imgModel's layer won't work since clipsToBounds = true
        // So we add shadow on a wrapper — use contentView instead
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.18
        contentView.layer.shadowRadius = 8
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.masksToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        updateShadow()
    }

    func updateShadow() {
        // Shadow path matches only the image frame, not the labels below
        contentView.layer.shadowPath =
            UIBezierPath(
                roundedRect: imgModel.frame,
                cornerRadius: 12
            ).cgPath
    }
}
