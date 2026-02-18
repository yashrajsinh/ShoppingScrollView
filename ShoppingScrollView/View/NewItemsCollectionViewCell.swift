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

        imgNewItems.layer.cornerRadius = 1
        imgNewItems.layer.cornerCurve = .continuous
        imgNewItems.layer.masksToBounds = false

        // White border
        imgNewItems.layer.borderWidth = 7
        imgNewItems.layer.borderColor = UIColor.white.cgColor

        // Bottom-only shadow
        imgNewItems.layer.shadowColor = UIColor.black.cgColor
        imgNewItems.layer.shadowOpacity = 0.20
        imgNewItems.layer.shadowRadius = 2
        imgNewItems.layer.shadowOffset = CGSize(width: 0, height: 4)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let shadowRect = CGRect(
            x: imgNewItems.bounds.origin.x,
            y: imgNewItems.bounds.origin.y + 8,  // pushes shadow downward
            width: imgNewItems.bounds.width,
            height: imgNewItems.bounds.height
        )

        imgNewItems.layer.shadowPath =
            UIBezierPath(
                roundedRect: imgNewItems.bounds,
                cornerRadius: 1
            ).cgPath
    }
}
