//
//  CollectionCell.swift
//  CollectionView In TableView
//
//  Created by Johnathan Huijon on 9/12/23.
//

import UIKit

// The only explanation provided here regarding placing a collectionView inside a tableView is within the setImage function below. For any further inquiries about this topic, refer to other projects in the repository that elucidate this concept.

class CollectionCell: UICollectionViewCell {
    
    var itemImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        itemImageView.image = nil
    }
    
    // This function is placed here so that it can be called from the table cell file to set the picture in the collection view corresponding to the table view's index cells.
    func setImage(image: UIImage) {
        itemImageView.image = image
    }
    
    func configureUI() {
        configureItemImageView()
        contentView.backgroundColor = .tertiarySystemBackground
    }
    
    func configureItemImageView() {
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(itemImageView)
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            itemImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    
}
