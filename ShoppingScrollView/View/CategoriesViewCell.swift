//
//  CategoriesViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
      
        contentView.layer.masksToBounds = true

        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.20
        self.layer.shadowRadius = 12
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)

        // Style the count label as a grey pill badge
        txtCount.backgroundColor = UIColor.systemGray6
        txtCount.layer.cornerRadius = 8
        txtCount.layer.masksToBounds = true
        txtCount.textAlignment = .center
        txtCount.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        txtCount.textColor = .black

        // Title styling
        txtTitle.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        txtTitle.textColor = .black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.shadowPath =
            UIBezierPath(
                roundedRect: self.bounds,
                cornerRadius: 16
            ).cgPath
    }

    func configure(with model: Categories) {
        txtTitle.text = model.title
        txtCount.text = "  \(model.count)  "  // padding inside pill

        for (index, imageView) in imageViews.enumerated() {
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 8
            imageView.layer.borderWidth = 3  // white border
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.image =
                index < model.images.count
                ? UIImage(named: model.images[index]) : nil
        }
    }
}
