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
        // White card
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        // Image
        imgModel.contentMode = .scaleAspectFill
        imgModel.clipsToBounds = true
        imgModel.layer.cornerRadius = 10
        imgModel.layer.cornerCurve = .continuous
        imgModel.layer.borderWidth = 3
        imgModel.layer.borderColor = UIColor.white.cgColor

        // Shadow on self
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.18
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 6)
    }

    func updateShadow() {
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: contentView.frame,
                cornerRadius: 14
            ).cgPath
    }
}
