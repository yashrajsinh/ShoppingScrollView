//
//  ViewController.swift
//  ShoppingScrollView
//
//  Created by Yashraj on 11/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewRecenly: UICollectionView!

    @IBOutlet weak var collcetionViewStories: UICollectionView!

    @IBOutlet weak var collcetionRecentHeight: NSLayoutConstraint!

    @IBOutlet weak var collectionViewStoriesHeight: NSLayoutConstraint!

    @IBOutlet weak var annouceView: UIView!

    @IBOutlet weak var collectionViewNewItems: UICollectionView!
    
    @IBOutlet weak var collcetionViewNewItemsHeight: NSLayoutConstraint!
    

    //Arry of recenlty viewed
    let recenlyImages = [
        "Item1", "Item2", "Item3", "Item4", "Item5", "Model1", "Item2", "Item4",
        "Item5", "Model1",
    ]

    //Array of stories
    let storiesImages = [
        "Model1", "Model2", "Model3", "Model4", "Model1", "Model2", "Model3",
    ]

    //Array of newItems
    let newProducts: [NewItems] = [
        NewItems(
            imageName: "Glass1",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$17,00"
        ),
        NewItems(
            imageName: "Glass1",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$32,00"
        ),
        NewItems(
            imageName: "Glass1",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$21,00"
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPadding()
        recentlyViewed()

    }

    //MARK: Set custom heights
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collcetionRecentHeight.constant = view.frame.width * 0.15
        collectionViewStoriesHeight.constant = view.frame.width * 0.45
        collcetionViewNewItemsHeight.constant = view.frame.width * 0.40
    }
    //MARK: Method for recently viewed
    func recentlyViewed() {

        collectionViewRecenly.delegate = self
        collectionViewRecenly.dataSource = self

        collcetionViewStories.delegate = self
        collcetionViewStories.dataSource = self

        collectionViewNewItems.delegate = self
        collectionViewNewItems.dataSource = self
    }

    //MARK: Add padding to view
    func addPadding() {
        annouceView.layer.cornerRadius = 10
        annouceView.layer.masksToBounds = true
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

        let height = collectionView.frame.height

        // Recent → Square (for circle image)
        if collectionView == collectionViewRecenly {
            return CGSize(width: height, height: height)
        }

        // Stories → Dynamic width based on image ratio
        let imageName = storiesImages[indexPath.row]
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

        //Collcetion Recently
        if collectionView == collectionViewRecenly {
            return recenlyImages.count
        }
        //Collection Stories
        else if collectionView == collcetionViewStories {
            return storiesImages.count
        }
        //Collection New Items
        else if collectionView == collectionViewNewItems {
            return newProducts.count
        }
        return 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        //Collcetion Recently
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
        }
        //Collection Stories
        else if collectionView == collcetionViewStories {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "StoriesCell",
                    for: indexPath
                ) as! StoriesViewCell
            cell.imgStories.image = UIImage(named: storiesImages[indexPath.row])
            return cell
        }
        //Collection New Items
        else if collectionView == collectionViewNewItems {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "NewItemCell",
                    for: indexPath
                ) as! NewItemsCollectionViewCell
            cell.imgNewItems.image = UIImage(
                named: newProducts[indexPath.row].imageName
            )
            //cell.txtTitle.text = newProducts[indexPath.row].title
            cell.txtPrice.text = newProducts[indexPath.row].price
            return cell
        }
        return cell
    }
}
