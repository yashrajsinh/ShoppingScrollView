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
        imgModel.contentMode = .scaleAspectFill
        imgModel.clipsToBounds = true
        imgModel.layer.cornerRadius = 16

        // WHITE card
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true

        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.10
        self.layer.shadowRadius = 10
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
