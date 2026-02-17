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

    override func layoutSubviews() {
        super.layoutSubviews()
    
        // Soft shadow on the cell card
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.08
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.masksToBounds = false
        
    }
    
    //MARK: Func would allow us to set images based on size
    func configure(with model: Categories) {
        txtTitle.text = model.title
        txtCount.text = "\(model.count)"

        for (index, imageView) in imageViews.enumerated() {

            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10

            if index < model.images.count {
                imageView.image = UIImage(named: model.images[index])
            } else {
                imageView.image = nil
            }

        }

    }
}
