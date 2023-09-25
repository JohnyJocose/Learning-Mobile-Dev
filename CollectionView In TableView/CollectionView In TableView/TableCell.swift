//
//  TableCell.swift
//  CollectionView In TableView
//
//  Created by Johnathan Huijon on 9/11/23.
//

import UIKit

class TableCell: UITableViewCell {
    
    // Declare a collection view variable here and ensure that the collection view's scroll direction is set to horizontal. This scrolling orientation is typical of what you would observe in shopping apps that use a collection view within a table view, resembling the layout often seen in Amazon's app.
    var appleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // Variables that will be utilized in the setShoppingCatalogAndList function brought in from the ViewController file to populate the content of this particular IndexPath's cell.
    var catalog: String = ""
    var shoppingGenreList: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function responsible for populating the content of the cell at this specific IndexPath, to be utilized by the UICollectionViewDelegate and UICollectionViewDataSource.
    func setShoppingCatalogAndList(genre: [String], set: String ) {
        catalog = set
        shoppingGenreList = genre
    }
    
    
    func configureUI() {
        configureCollectionView()
    }
    
    // Function to configure the collection view that will be placed inside this IndexPath's cell. We have a separate collection view cell file in this project that includes an image of the item
    func configureCollectionView() {
        appleCollectionView.dataSource = self
        appleCollectionView.delegate = self
        appleCollectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "collectionCell")
        appleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // You have to add it to the contentView because if you just put it inside the tableView, it will hide behind the contentView. This would prevent you from being able to scroll the collectionView and can drive you crazy for hours trying to figure out what's happening!
        contentView.addSubview(appleCollectionView)
        
        NSLayoutConstraint.activate([
            appleCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            appleCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            appleCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            appleCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension TableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // You can use dynamic height to adjust for different heights of images, but in this case, I didn't, since I only plan to display examples of how collection view in table view works, and each picture are all the same height.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // Return the count of items in each shopping list genre.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingGenreList.count
    }
    // Depending on the product genre, we need to call the function to set the image of the collection view with the appropriate data using switch cases in this scenario.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionCell
        switch catalog {
        case "Vision Pro":
            cell.setImage(image: UIImage(systemName: "eyeglasses")!)
        case "Apple Watch":
            cell.setImage(image: UIImage(systemName: "applewatch")!)
        case "Apple TV":
            cell.setImage(image: UIImage(systemName: "appletv.fill")!)
        case "iPad":
            cell.setImage(image: UIImage(systemName: "ipad")!)
        case "Airpods":
            cell.setImage(image: UIImage(systemName: "airpodspro")!)
        case "iPhone":
            cell.setImage(image: UIImage(systemName: "iphone")!)
        default:
            cell.setImage(image: UIImage(systemName: "questionmark.app")!)

        }
        
        return cell
    }
    
    
}
