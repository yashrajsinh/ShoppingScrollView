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
        // Cell itself carries the shadow
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.35
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 6)

        // contentView must NOT clip
        contentView.backgroundColor = .clear
        contentView.layer.masksToBounds = false

        // Image
        imgModel.contentMode = .scaleAspectFill
        imgModel.clipsToBounds = true
        imgModel.layer.cornerRadius = 12
        imgModel.layer.cornerCurve = .continuous

        // White border looks great over photos
        imgModel.layer.borderWidth = 4.0
        imgModel.layer.borderColor = UIColor.white.cgColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }

    func updateShadow() {
        // Shadow on self.layer, path matches image frame
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: imgModel.frame,
                cornerRadius: 12
            ).cgPath
    }
}
