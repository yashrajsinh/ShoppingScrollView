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
        "Model1", "Model4", "Model3", "Model4", "Model1", "Model4", "Model3",
    ]

    //Array of newItems
    let newProducts: [NewItems] = [
        NewItems(
            imageName: "Glass2",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$17,00"
        ),
        NewItems(
            imageName: "Glass3",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$32,00"
        ),
        NewItems(
            imageName: "Glass2",
            title: "Lorem ipsum dolor sit amet consectetur.",
            price: "$21,00"
        ),
        NewItems(
            imageName: "Glass3",
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
            imageName: "Model4",
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
            images: ["Glass1", "Glass2", "Model1", "Model4"]
        ),
        Categories(
            title: " Brunette",
            count: 530,
            images: ["Model4", "Model1", "Glass2", "Glass1"]
        ),
        Categories(
            title: " Red Head",
            count: 185,
            images: ["Model1", "Glass1", "Model4", "Glass2"]
        ),
        Categories(
            title: " Bald",
            count: 5,
            images: ["Glass2", "Model4", "Glass1", "Model4"]
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addPadding()
        recentlyViewed()
        fixForYouLayout()
        fixNewItemsLayout()
        fixPopularLayout()
        fixSaleLayout()
        fixStoriesLayout()
        fixRecentlyLayout()
        fixTopLayout()
        fixCategoriesLayout()

    }
    //MARK Categories viwe
    func fixCategoriesLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .vertical
        // Insets give shadow room on all sides
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionViewCategories.collectionViewLayout = layout
        collectionViewCategories.isScrollEnabled = false
    }

    //MARK: Set custom heights
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collcetionRecentHeight.constant = view.frame.width * 0.15
        collectionViewStoriesHeight.constant = view.frame.width * 0.50
        collcetionViewNewItemsHeight.constant = view.frame.width * 0.55
        collectionViewPopularHeight.constant = view.frame.width * 0.45
        collectionViewCategoriesHeight.constant = view.frame.width * 1.10
        collcetionViewTopHeight.constant = view.frame.width * 0.15

        // Sale — accounts for 8pt insets + spacing
        let saleInset: CGFloat = 8
        let saleSpacing: CGFloat = 8
        let saleItemWidth =
            (view.frame.width - (saleInset * 2) - (saleSpacing * 2)) / 3
        collectionViewSaleHeight.constant =
            (saleItemWidth * 2) + saleSpacing + (saleInset * 2)

        // For You — accounts for spacing
        let youSpacing: CGFloat = 8
        let youInset: CGFloat = 8
        let youItemWidth = (view.frame.width - (youInset * 2) - youSpacing) / 2
        let youItemHeight = youItemWidth * 1.3
        collcetionViewForYouHeight.constant =
            (youItemHeight * 3) + (youSpacing * 2) + (youInset * 2)

        //Categoeis collcetion
        let catInset: CGFloat = 8
        let catSpacing: CGFloat = 12
        let catItemWidth = (view.frame.width - (catInset * 2) - catSpacing) / 2
        let catItemHeight = catItemWidth * 1.35
        collectionViewCategoriesHeight.constant =
            (catItemHeight * 2) + catSpacing + (catInset * 2)

    }

    func fixRecentlyLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        collectionViewRecenly.collectionViewLayout = layout
    }

    func fixTopLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        CollcetionViewTop.collectionViewLayout = layout
    }

    func fixNewItemsLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionViewNewItems.collectionViewLayout = layout
        collectionViewNewItems.isScrollEnabled = true
    }

    func fixPopularLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionViewPopular.collectionViewLayout = layout
        collectionViewPopular.isScrollEnabled = true
    }

    func fixSaleLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionViewSale.collectionViewLayout = layout
        collectionViewSale.isScrollEnabled = false
    }

    func fixStoriesLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .horizontal
        collcetionViewStories.collectionViewLayout = layout
        collcetionViewStories.isScrollEnabled = true
    }

    //MARK: Method for recently viewed
    func recentlyViewed() {

        collectionViewRecenly.delegate = self
        collectionViewRecenly.dataSource = self
        collectionViewRecenly.clipsToBounds = false
        collectionViewRecenly.layer.masksToBounds = false

        collcetionViewStories.delegate = self
        collcetionViewStories.dataSource = self
        collcetionViewStories.clipsToBounds = false
        collcetionViewStories.layer.masksToBounds = false

        collectionViewNewItems.delegate = self
        collectionViewNewItems.dataSource = self
        collectionViewNewItems.clipsToBounds = false
        collectionViewNewItems.layer.masksToBounds = false

        collectionViewPopular.delegate = self
        collectionViewPopular.dataSource = self
        collectionViewPopular.clipsToBounds = false
        collectionViewPopular.layer.masksToBounds = false

        collectionViewCategories.delegate = self
        collectionViewCategories.dataSource = self
        collectionViewCategories.clipsToBounds = false
        collectionViewCategories.layer.masksToBounds = false

        collectionViewSale.delegate = self
        collectionViewSale.dataSource = self
        collectionViewSale.clipsToBounds = false
        collectionViewSale.layer.masksToBounds = false

        CollcetionViewTop.delegate = self
        CollcetionViewTop.dataSource = self
        CollcetionViewTop.clipsToBounds = false
        CollcetionViewTop.layer.masksToBounds = false

        collcetionViewYou.delegate = self
        collcetionViewYou.dataSource = self
        collcetionViewYou.clipsToBounds = false
        collcetionViewYou.layer.masksToBounds = false

        // Fix shadow clipping on circle collections
        collectionViewRecenly.clipsToBounds = false
        collectionViewRecenly.layer.masksToBounds = false
        collectionViewRecenly.clipsToBounds = false
        collectionViewRecenly.layer.masksToBounds = false

        CollcetionViewTop.clipsToBounds = false
        CollcetionViewTop.layer.masksToBounds = false
        CollcetionViewTop.clipsToBounds = false
        CollcetionViewTop.layer.masksToBounds = false

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
            let inset: CGFloat = 8
            let spacing: CGFloat = 12
            let totalWidth = collectionView.frame.width - (inset * 2) - spacing
            let width = totalWidth / 2
            let height = width * 1.4  
            return CGSize(width: width, height: height)
        }

        // Sale
        if collectionView == collectionViewSale {
            let inset: CGFloat = 8
            let spacing: CGFloat = 8
            let totalWidth =
                collectionView.frame.width - (inset * 2) - (spacing * 2)
            let width = totalWidth / 3
            return CGSize(width: width, height: width)
        }
        //Top Collcetion
        if collectionView == CollcetionViewTop {
            return CGSize(width: height, height: height)
        }

        //For your
        if collectionView == collcetionViewYou {
            let spacing: CGFloat = 5
            let width = (collectionView.frame.width - spacing) / 2
            return CGSize(width: width, height: width * 1.5)
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
            return 6
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
            cell.layoutIfNeeded()
            cell.updateShadow()
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
            cell.layoutIfNeeded()
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
