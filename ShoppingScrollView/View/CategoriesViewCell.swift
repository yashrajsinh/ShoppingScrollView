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
          contentView.layer.cornerRadius = 16
          contentView.layer.masksToBounds = true

          self.backgroundColor = .clear
          self.layer.masksToBounds = false
          self.layer.shadowColor = UIColor.black.cgColor
          self.layer.shadowOpacity = 0.10
          self.layer.shadowRadius = 8
          self.layer.shadowOffset = CGSize(width: 0, height: 4)
      }

      override func layoutSubviews() {
          super.layoutSubviews()
          self.layer.shadowPath = UIBezierPath(
              roundedRect: self.bounds,
              cornerRadius: 16
          ).cgPath
      }

      func configure(with model: Categories) {
          txtTitle.text = model.title
          txtCount.text = "\(model.count)"
          for (index, imageView) in imageViews.enumerated() {
              imageView.contentMode = .scaleAspectFill
              imageView.clipsToBounds = true
              imageView.layer.cornerRadius = 8
              imageView.image = index < model.images.count ? UIImage(named: model.images[index]) : nil
          }
      }
}
