//
//  RecentlyViewCell.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 12/02/26.
//

import UIKit

class RecentlyViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recentlyViewItems: UIImageView!
  
    override func layoutSubviews() {
        recentlyViewItems.clipsToBounds = true
        recentlyViewItems.layer.cornerRadius = recentlyViewItems.bounds.width / 2
        recentlyViewItems.contentMode = .scaleAspectFill
    }
}
