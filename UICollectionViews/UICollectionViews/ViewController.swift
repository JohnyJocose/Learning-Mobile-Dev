//
//  ViewController.swift
//  UICollectionViews
//
//  Created by Johnathan Huijon on 9/10/23.
//

// This Swift file encapsulates the essential components and functionalities associated with UICollectionViews in an iOS application. UICollectionViews are versatile UI elements that allow the presentation of data in a customizable grid or list format. This file contains implementations for configuring the collection view layout, handling data source and delegate methods, and customizing cell appearance and behavior.

import UIKit

// This is a uicollectionviewcell; it's here because we want to add uielemtns to the cell so we must set it and arange it's constraints. in this case we want something with a view and an image inside
class CardCell: UICollectionViewCell {
    
    let cellView = UIView()
    let imageView = UIImageView()
    let cardTypeLabel = UILabel()
    
    // Need to put functions here that are called when the cell is created
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAndSetUI()
    }
    
    // Needed in order to have the function above
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // Every time a cell is being reused, we call this function below because of UICollectionViewDelegate and UICollectionViewDataSource
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // When we call this function, sometimes it will retain information from previous cells for a glimpse of a second, and we don't want that. We want to remove the image from the UIImageView to hide that it's being reused.
    func setImage(image: UIImage) {
        imageView.image = image
    }
    
    func configureAndSetUI(){
        configureCellView()
        configureImageView()
    }
    
    func configureImageView() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false


        cellView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 3/4),
            imageView.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 3/4),
            imageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: cellView.centerXAnchor)
        ])
    }
    
    func configureCellView() {
        cellView.backgroundColor = .systemBrown
        cellView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(cellView)
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}


class ViewController: UIViewController {
    // Snippet of how you create a UICollectionView
    var cardCollectionView: UICollectionView = {
        // We set the layout here; we can determine if the layout is horizontal or vertical. Typically, it's vertical unless it's in a TableView, then it's horizontal (this is, of course, not always the case 100% of the time).
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    // DataSource we will be working from; data comes from CarDeck file
    var cards: [UIImage] = CardDeck.allValues

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureCollectionView()
        setUpCollectionView()
    }
    
    func setUpCollectionView() {
        view.addSubview(cardCollectionView)
        NSLayoutConstraint.activate([
            cardCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // Function to configure UICollectionView
    func configureCollectionView() {
        // In order to properly use the functions to determine how many sections and rows for the cell, and set the IndexPath data, we need to set the UICollectionViewDataSource and delegate to self.
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        
        // The cell we created above must be registered in order to be used with the collection view's dataSource and delegate. If you want to create a regular one, just use UICollectionViewCell.self instead.
        cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
        
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
    }


}

// Add UICollectionViewDelegateFlowLayout to adjust how you want the collection view to appear on the screen, such as height, width, spacing in between, and edges, etc.
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // These are the functions that we will be able to use with the collection because of setting the collection view's delegate and dataSource.

    // This function will check if a collection view cell was selected; if so, we want to deselect it so it doesn't show as highlighted.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print (cards[indexPath.row])
    }
    
    // Set up the sections; this will determine how many cells there are that will have their own row of content
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    // We look at which section and row of a collection view cell we're at, and we set the content accordingly. In this case, we created a function in the cell class to set the image.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Must include at the end as! CellName in order to access its functions. And, of course, make sure the cell has been registered when you configure it, and that it's the reusableIdentifier for the cell you registered above.
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        
        collectionCell.setImage(image: cards[indexPath.row])
        return collectionCell
    }
    
    // UICollectionViewFlowLayout functions

    // This one is to determine the width and height of the collection view cell. Since all screens are different, we want the width to be a third of the screen; and since we want a square, the height has to match the width.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3 - 12, height: view.frame.size.width/3 - 12)
    }
    
    // Edges of the collection view (not for every individual cell)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 10, bottom: 0, right: 10)
    }
    
    // Horizontal spacing in the layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3.5
    }
    
    // Vertical spacing in the layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

