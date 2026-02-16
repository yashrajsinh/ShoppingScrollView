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
       
        //Borders to self
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.systemGray6.cgColor
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 3.0
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
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
