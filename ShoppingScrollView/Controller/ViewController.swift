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

    @IBOutlet weak var collcetionViewStories: UICollectionView!

    
    @IBOutlet weak var collcetionRecentHeight: NSLayoutConstraint!

    //Arry of recenlty viewed
    let recenlyImages = ["Item1", "Item2", "Item3", "Item4", "Item5","Model1","Item2","Item4","Item5","Model1"]

    //Array of stories
    let storiesImages = ["Model1", "Model1", "Model1", "Model1", "Model1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPadding()
        recentlyViewed()

    }
    
    //MARK: Set custom heights
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collcetionRecentHeight.constant = view.frame.width * 0.2
            
    }
    //MARK: Method for recently viewed
    func recentlyViewed() {
      
        collectionViewRecenly.delegate = self
        collectionViewRecenly.dataSource = self
        
        collcetionViewStories.delegate = self
        collcetionViewStories.dataSource = self
    }

    //MARK: Add padding to view
    func addPadding() {
        annView.layer.cornerRadius = 15
        annView.layer.masksToBounds = true
    }

}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{

    //Sizing
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        print("Sizing called")

        let height: CGFloat = collectionView.frame.height

        var imageName: String

        if collectionView == collectionViewRecenly {
            imageName = recenlyImages[indexPath.row]
        } else {
            imageName = storiesImages[indexPath.row]
        }

        guard let image = UIImage(named: imageName) else {
            return CGSize(width: height, height: height)
        }

        let ratio = image.size.width / image.size.height
        let width = height * ratio
        
        return CGSize(width: width, height: height)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == collectionViewRecenly {
            return recenlyImages.count
        } else if collectionView == collcetionViewStories {
            return storiesImages.count
        }
        return 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        if collectionView == collectionViewRecenly {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "RecentlyViewCell",
                    for: indexPath
                ) as! RecentlyViewCell
            cell.recentlyViewItems.image = UIImage(
                named: recenlyImages[indexPath.row]
            )
            return cell
        } else if collectionView == collcetionViewStories {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "StoriesCell",
                    for: indexPath
                ) as! StoriesViewCell
            cell.imgStories.image = UIImage(named: storiesImages[indexPath.row])
            return cell
        }
        return cell
    }
}
