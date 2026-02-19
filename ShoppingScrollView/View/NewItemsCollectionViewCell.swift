//
//  NewItemsCollectionViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 13/02/26.
//

import UIKit

class NewItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgNewItems: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }

    private func setupCard() {
        imgNewItems.contentMode = .scaleAspectFill
        imgNewItems.clipsToBounds = true
        imgNewItems.layer.cornerRadius = 16
        imgNewItems.layer.cornerCurve = .continuous
        imgNewItems.layer.borderWidth = 8
        imgNewItems.layer.borderColor = UIColor.white.cgColor

        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        self.layer.masksToBounds = false
        contentView.layer.masksToBounds = false

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowRadius = 12
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateShadow()
    }

    // Call this from ViewController AFTER setting the image
    func updateShadow() {
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: imgNewItems.frame,
                cornerRadius: 16
            ).cgPath
    }
}
