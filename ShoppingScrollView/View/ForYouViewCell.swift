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

    override func layoutSubviews() {
        // Rounded corners on the image - matches the screenshot
        imgModel.layer.cornerRadius = 12
        imgModel.clipsToBounds = true
        imgModel.contentMode = .scaleAspectFill

        // Soft shadow on the cell card
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.08
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.masksToBounds = false
    }

}
