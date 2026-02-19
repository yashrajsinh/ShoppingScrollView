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
        setupCard()  //
    }

    private func setupCard() {
        imgPopularItems.contentMode = .scaleAspectFill
        imgPopularItems.clipsToBounds = true
        imgPopularItems.layer.cornerRadius = 10
        imgPopularItems.layer.cornerCurve = .continuous

        // White border around the image
        imgPopularItems.layer.borderWidth = 8
        imgPopularItems.layer.borderColor = UIColor.white.cgColor

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
        contentView.layer.cornerCurve = .continuous
        contentView.layer.masksToBounds = true

        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.18
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Shadow under the whole card (image + text area)
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: contentView.frame,
                cornerRadius: 16
            ).cgPath
    }
}
