//
//  ViewController.swift
//  LogiNext Test
//
//  Created by Poonam Tiwari on 16/05/23.
//

import UIKit
import SDWebImage
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var bannersScrollView: UIScrollView!
    @IBOutlet weak var categoryScrollView: UIScrollView!
    @IBOutlet weak var vouchersButton: UIButton!
    @IBOutlet weak var offersCollectionView: UICollectionView!
    @IBOutlet weak var restaurantsCollectionView: UICollectionView!
    @IBOutlet weak var bannersStackView: UIStackView!
    @IBOutlet weak var categoryStackView: UIStackView!
    
    
    var viewModel = HomeViewModel()
    var homeModel:HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHomeDisplayData()
        
    }
    
    func getHomeDisplayData()
    {
        viewModel.getHomeData { [weak self] in
            self?.homeModel = self?.viewModel.homeViewData
            
            DispatchQueue.main.async {
                self?.setupUI()
            }
            
        }
    }
    
    func setupUI()
    {
        self.setupCollectionViews()
        self.offersCollectionView.reloadData()
        self.restaurantsCollectionView.reloadData()
        
        self.setupBanners()
        self.setupCuisines()
        setupVoucherLabel()
        setupSearch()
        setupNavigation()
    }
    
    func setupNavigation()
    {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 192.0/256.0, green: 44.0/256.0, blue: 32.0/256.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 192.0/256.0, green: 44.0/256.0, blue: 32.0/256.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.isHidden = false
        addHomeViewToNavigation()
    }
    
    func addHomeViewToNavigation()
    {
        let view = UIView()
        let button = UIButton(type: .custom)
        button.contentHorizontalAlignment = .center
        //TODO: use anothermimage
        if let image = UIImage(systemName: "pin") {
            let whiteImage = image.withTintColor(.white, renderingMode: .alwaysOriginal)
            button.setImage(whiteImage, for: .normal)
        }
        button.setTitle("Home", for: .normal)
        button.titleLabel!.font = UIFont.boldSystemFont(ofSize: 20.0)
        button.imageView?.contentMode = .scaleAspectFit
        button.titleLabel?.numberOfLines = 1;
        button.titleLabel?.adjustsFontSizeToFitWidth = true;
        button.sizeToFit()
        view.addSubview(button)
        view.frame = button.bounds
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: view)
    }
    
    func setupSearch()
    {
        homeSearchBar.sizeToFit()
        homeSearchBar.searchBarStyle = .minimal
        homeSearchBar.backgroundColor = UIColor(red: 192.0/256.0, green: 44.0/256.0, blue: 32.0/256.0, alpha: 1.0)//.red
        homeSearchBar.searchTextField.backgroundColor = .lightGray
        homeSearchBar.searchTextField.textColor = .white
        
        homeSearchBar.searchTextField.attributedPlaceholder =  NSAttributedString.init(string: "Search", attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
    }
    func setupBanners()
    {
        let widthConstant = 0.8 * self.view.frame.width
        for i in 0..<(self.homeModel?.data.banners.count ?? 0)
        {
            let bannerModel = self.homeModel?.data.banners[i]
            let button:UIButton = UIButton()
            button.tag = i
            button.backgroundColor = .clear
            button.sd_setBackgroundImage(with: URL(string: bannerModel?.imageUrl ?? ""), for:
                                            UIControl.State.normal, placeholderImage: UIImage(named:
                                                                                                "default_profile"), options: SDWebImageOptions(rawValue: 0)) { (image,
                                                                                                                                                                error, cache, url) in
                
            }
            button.addTarget(self, action:#selector(self.bannerTapped), for: .touchUpInside)
            button.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
            
            bannersStackView.backgroundColor = .clear
            bannersStackView.addArrangedSubview(button)
        }
    }
    
    func setupCuisines()
    {
        let widthConstant = 0.2 * self.view.frame.width
        
        for i in 0..<(self.homeModel?.data.categories.count ?? 0)
        {
            let categoryModel = self.homeModel?.data.categories[i]
            let button:UIButton = UIButton()
            button.tag = i
            button.backgroundColor = .clear
            button.sd_setBackgroundImage(with: URL(string: categoryModel?.iconUrl ?? ""), for:
                                            UIControl.State.normal, placeholderImage: UIImage(named:
                                                                                                "default_profile"), options: SDWebImageOptions(rawValue: 0)) { (image,
                                                                                                                                                                error, cache, url) in
                
            }
            
            button.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
            
            button.addTarget(self, action:#selector(self.bannerTapped), for: .touchUpInside)
            
            
            categoryStackView.backgroundColor = .clear
            categoryStackView.addArrangedSubview(button)
        }
    }
    func setupVoucherLabel()
    {
        let vouchersCount = self.homeModel?.data.activeVoucherCount ?? 0
        let attachment = NSTextAttachment()
        if let image = UIImage(systemName: "gift") {
            let whiteImage = image.withTintColor(UIColor(red: 224.0/256.0, green: 143.0/256.0, blue: 75.0/256.0, alpha: 1.0), renderingMode: .alwaysOriginal)
            attachment.image = whiteImage
        }
        let attachmentString = NSAttributedString(attachment: attachment)
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 224.0/256.0, green: 143.0/256.0, blue: 75.0/256.0, alpha: 1.0)]
        var myString =  NSMutableAttributedString(string:"")
        myString.append(attachmentString)
        let text = NSMutableAttributedString(string:"You have \(vouchersCount) voucher here",attributes: attributes)
        myString.append(text)
        
        vouchersButton.backgroundColor = UIColor(red: 254.0/256.0, green: 247.0/256.0, blue: 241.0/256.0, alpha: 1)
        vouchersButton.setAttributedTitle(myString, for: .normal)
        vouchersButton.contentHorizontalAlignment = .left
        
        if let image = UIImage(systemName: "arrow.forward") {
            let whiteImage = image.withTintColor(UIColor(red: 224.0/256.0, green: 143.0/256.0, blue: 75.0/256.0, alpha: 1.0), renderingMode: .alwaysOriginal)
            vouchersButton.setImage(whiteImage, for: .normal)
        }
        vouchersButton.configuration?.imagePlacement = .trailing
        vouchersButton.contentHorizontalAlignment = .fill
        
        //TODO: change this arrow
    }
    
    @objc func bannerTapped()
    {
        let displayAlert = UIAlertController(title: "", message: "Banner Tapped", preferredStyle: .alert)
        self.present(displayAlert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when){
            displayAlert.dismiss(animated: true, completion: nil)
        }
    }
    
    func setupCollectionViews()
    {
        offersCollectionView.dataSource = self
        offersCollectionView.delegate = self
        restaurantsCollectionView.dataSource = self
        restaurantsCollectionView.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == offersCollectionView {
            return 1
        } else if collectionView == restaurantsCollectionView {
            return homeModel?.data.restaurantCollection.count ?? 0
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == offersCollectionView {
            return homeModel?.data.offerCollection.count ?? 0
        }
        else if collectionView == restaurantsCollectionView {
            let itemCount = homeModel?.data.restaurantCollection[section].restaurants.count ?? 0
            return itemCount <= 3 ? itemCount : 3
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == offersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OffersCollectionViewCell
            if let item = homeModel?.data.offerCollection[indexPath.row] {
                cell.configure(with: item)}
            cell.backgroundColor = .white
            return cell
            
        } else if collectionView == restaurantsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedCell", for: indexPath) as! RecommendCollectionViewCell
            if let collectionModel = homeModel?.data.restaurantCollection[indexPath.section] {
                let item = collectionModel.restaurants[indexPath.row]
                
                cell.configure(with: item)}
            cell.backgroundColor = .clear
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == offersCollectionView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DealsHeader", for: indexPath) as! DealsHeaderView
            headerView.titleLabel.text = "Collections"
            
            return headerView
        } else if collectionView == restaurantsCollectionView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "RestaurantHeaderView", for: indexPath) as! RestaurantHeaderView
            
            headerView.restaurantHeaderMore.text = "View all"
            let title = homeModel?.data.restaurantCollection[indexPath.section].collectionName
            headerView.restaurantHeaderTitle.text = title
            
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == offersCollectionView {
            let collectionViewWidth = offersCollectionView.bounds.width
            let cellWidth = (collectionViewWidth - 30) / 2
            let cellHeight = 40.0
            
            return CGSize(width: cellWidth, height: cellHeight)
        } else if collectionView == restaurantsCollectionView {
            let collectionViewWidth = restaurantsCollectionView.bounds.width
            let cellWidth = (collectionViewWidth - 30) / 3
            let cellHeight = cellWidth
            
            return CGSize(width: cellWidth, height: cellHeight)
        } else {
            return CGSize.zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width,height: 50)
    }
}




