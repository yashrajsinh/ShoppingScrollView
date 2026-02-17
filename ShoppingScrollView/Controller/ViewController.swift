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

    @IBOutlet weak var collectionViewPopular: UICollectionView!
    @IBOutlet weak var collectionViewPopularHeight: NSLayoutConstraint!

    //Categories Collection
    @IBOutlet weak var collectionViewCategories: UICollectionView!
    @IBOutlet weak var collectionViewCategoriesHeight: NSLayoutConstraint!

    //CollcetionView Sale
    @IBOutlet weak var collectionViewSale: UICollectionView!
    @IBOutlet weak var collectionViewSaleHeight: NSLayoutConstraint!

    //Top Products View

    @IBOutlet weak var CollcetionViewTop: UICollectionView!

    @IBOutlet weak var collcetionViewTopHeight: NSLayoutConstraint!

    //For you Collcetion
    @IBOutlet weak var collcetionViewYou: UICollectionView!

    @IBOutlet weak var collcetionViewForYouHeight: NSLayoutConstraint!

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
            imageName: "Glass2",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$32,00"
        ),
        NewItems(
            imageName: "Glass1",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$21,00"
        ),
        NewItems(
            imageName: "Glass2",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$21,00"
        ),
    ]

    //Array of popluar items
    let populatItems: [PopularItems] = [
        PopularItems(
            imageName: "Model1",
            title: "1780💙",
            desc: "New "
        ),
        PopularItems(
            imageName: "Model2",
            title: "1780💙",
            desc: "Sale "
        ),
        PopularItems(
            imageName: "Model3",
            title: "1780💙",
            desc: "Hot "
        ),
        PopularItems(
            imageName: "Model4",
            title: "1780💙",
            desc: "Nice "
        ),
    ]

    //Array of categories
    let categories = [
        Categories(
            title: " Blonde",
            count: 109,
            images: ["Item1", "Item2", "Item3", "Item4"]
        ),
        Categories(
            title: " Brunette",
            count: 530,
            images: ["Model1", "Model2", "Model3", "Model4"]
        ),
        Categories(
            title: " Gray",
            count: 185,
            images: ["Item1", "Item2", "Item3", "Item4"]
        ),
        Categories(
            title: " Bald",
            count: 5,
            images: ["Item1", "Item2", "Item3", "Item4"]
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPadding()
        recentlyViewed()
        fixForYouLayout()

    }

    //MARK: Set custom heights
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collcetionRecentHeight.constant = view.frame.width * 0.15
        collectionViewStoriesHeight.constant = view.frame.width * 0.50
        collcetionViewNewItemsHeight.constant = view.frame.width * 0.45
        collectionViewPopularHeight.constant = view.frame.width * 0.35
        collectionViewCategoriesHeight.constant = view.frame.width * 0.99
        collcetionViewForYouHeight.constant = view.frame.width * 0.20

        // Sale: 3 columns, 2 rows with spacing
        let saleItemWidth = (view.frame.width - 20) / 3
        collectionViewSaleHeight.constant = (saleItemWidth * 2) + 5  // 2 rows + spacing

        // ForYou: 2 columns, 3 rows
        let youSpacing: CGFloat = 5
        let youItemWidth = (view.frame.width - youSpacing) / 2
        let youItemHeight = youItemWidth * 1.3
        collcetionViewForYouHeight.constant =
            (youItemHeight * 3) + (youSpacing * 2)

    }
    //MARK: Method for recently viewed
    func recentlyViewed() {

        collectionViewRecenly.delegate = self
        collectionViewRecenly.dataSource = self

        collcetionViewStories.delegate = self
        collcetionViewStories.dataSource = self

        collectionViewNewItems.delegate = self
        collectionViewNewItems.dataSource = self

        collectionViewPopular.delegate = self
        collectionViewPopular.dataSource = self

        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self

        collectionViewSale.delegate = self
        collectionViewSale.dataSource = self

        CollcetionViewTop.delegate = self
        CollcetionViewTop.dataSource = self

        collcetionViewYou.delegate = self
        collcetionViewYou.dataSource = self
    }

    // MARK: This replaces the broken storyboard layout with a fresh one
    func fixForYouLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .vertical
        collcetionViewYou.collectionViewLayout = layout
        collcetionViewYou.isScrollEnabled = false  // let the scroll view handle scrolling
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

        // Recently → square
        if collectionView == collectionViewRecenly {
            return CGSize(width: height, height: height)
        }

        // Stories → dynamic width
        if collectionView == collcetionViewStories {
            let imageName = storiesImages[indexPath.row]
            guard let image = UIImage(named: imageName) else {
                return CGSize(width: height, height: height)
            }

            let ratio = image.size.width / image.size.height
            let width = height * ratio

            return CGSize(width: width, height: height)
        }

        // New Items
        if collectionView == collectionViewNewItems {
            let width = collectionView.frame.width / 2 - 10
            return CGSize(width: width, height: height)
        }

        // Popular
        if collectionView == collectionViewPopular {
            let width = collectionView.frame.width / 3 - 10
            return CGSize(width: width, height: height)
        }

        // Categories
        if collectionView == collectionViewCategories {
            let width = collectionView.frame.width / 2 - 10
            let height = width * 1.2
            return CGSize(width: width, height: height)
        }

        // Sale
        if collectionView == collectionViewSale {
            let spacing: CGFloat = 5
            let totalSpacing = spacing * 2  // space between 3 columns
            let width = (collectionView.frame.width - totalSpacing) / 3
            return CGSize(width: width, height: width)  // Square items
        }
        //Top Collcetion
        if collectionView == CollcetionViewTop {
            return CGSize(width: height, height: height)
        }

        //For your
        if collectionView == collcetionViewYou {
            let spacing: CGFloat = 5
            let width = (collectionView.frame.width - spacing) / 2
            return CGSize(width: width, height: width * 1.3)
        }
        return CGSize(width: height, height: height)
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
        //CollcetionView Popular
        else if collectionView == collectionViewPopular {
            return populatItems.count
        }
        //Collcetion View Categories
        else if collectionView == collectionViewCategories {
            return categories.count
        }
        //ColcletionView Sale
        else if collectionView == collectionViewSale {
            return storiesImages.count
        } else if collectionView == CollcetionViewTop {
            return recenlyImages.count
        } else if collectionView == collcetionViewYou {
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
            cell.txtTitle.text = newProducts[indexPath.row].title
            cell.txtPrice.text = newProducts[indexPath.row].price
            return cell
        }
        //Collcetionview Popular
        else if collectionView == collectionViewPopular {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "PopularCell",
                    for: indexPath
                ) as! PopularViewCell
            cell.imgPopularItems.image = UIImage(
                named: populatItems[indexPath.row].imageName
            )
            cell.txtTitle.text = populatItems[indexPath.row].title
            cell.txtDesc.text = populatItems[indexPath.row].desc
            return cell
        }

        //Collectionview Categories
        else if collectionView == collectionViewCategories {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "CategoriesCell",
                    for: indexPath
                ) as! CategoriesViewCell
            let model = categories[indexPath.row]
            cell.configure(with: model)
            return cell
        }
        //CollcetionView Sale
        else if collectionView == collectionViewSale {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "CellSale",
                    for: indexPath
                ) as! SaleViewCell
            cell.imgSale.image = UIImage(named: storiesImages[indexPath.row])
            return cell
        }
        //Collcetion Top CellTop
        else if collectionView == CollcetionViewTop {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "CellTop",
                    for: indexPath
                ) as! TopViewCell
            cell.imgTop.image = UIImage(named: recenlyImages[indexPath.row])
            return cell
        }
        //CollectionView for you
        else if collectionView == collcetionViewYou {
            let cell =
                collectionView.dequeueReusableCell(
                    withReuseIdentifier: "YouCell",
                    for: indexPath
                ) as! ForYouViewCell
            cell.imgModel.image = UIImage(
                named: newProducts[indexPath.row].imageName
            )
            cell.txtTitle.text = newProducts[indexPath.row].title
            cell.txtPrice.text = newProducts[indexPath.row].price
            return cell
        }
        return cell
    }
}
