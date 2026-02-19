//
//  SaleViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 16/02/26.
//

import UIKit

class SaleViewCell: UICollectionViewCell {
    @IBOutlet weak var imgSale: UIImageView!
    @IBOutlet weak var lblTwenty : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }

    private func setupCard() {
        imgSale.contentMode = .scaleAspectFill
        imgSale.clipsToBounds = true
        imgSale.layer.cornerRadius = 10
        imgSale.layer.cornerCurve = .continuous
        imgSale.layer.borderWidth = 6
        imgSale.layer.borderColor = UIColor.white.cgColor
        
        lblTwenty.layer.cornerRadius = 8
        lblTwenty.layer.masksToBounds = true
  
        self.backgroundColor = .clear
        self.layer.masksToBounds = false
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.10
        self.layer.shadowRadius = 8
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
                roundedRect: imgSale.frame,
                cornerRadius: 6
            ).cgPath
    }
}
