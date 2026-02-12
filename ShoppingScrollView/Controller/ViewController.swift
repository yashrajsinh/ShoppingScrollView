//
//  ViewController.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 11/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var annView: UIStackView!
    @IBOutlet weak var collectionViewRecenly: UICollectionView!

    //Arry of recenlty viewed
    let recenlyImages = ["Item1", "Item2", "Item3", "Item4", "Item5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPadding()
        recentlyViewed()

    }
    //MARK: Method for recently viewed
    func recentlyViewed() {
        collectionViewRecenly.delegate = self
        collectionViewRecenly.dataSource = self
    }

    //MARK: Add padding to view
    func addPadding() {
        annView.layer.cornerRadius = 15
        annView.layer.masksToBounds = true
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return recenlyImages.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: "RecentlyViewCell",
                for: indexPath
            ) as! RecentlyViewCell
        cell.recentlyViewItems.image = UIImage(
            named: recenlyImages[indexPath.row]
        )
        return cell
    }
}
