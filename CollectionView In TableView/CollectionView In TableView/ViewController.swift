//
//  ViewController.swift
//  CollectionView In TableView
//
//  Created by Johnathan Huijon on 9/11/23.
//

import UIKit

// This file focuses on integrating a collection view within a table view, a powerful approach to presenting complex data in iOS applications. The collection view embedded within the table view cell enables a more dynamic and interactive display, enhancing the user experience. It encapsulates the implementation and customization of this combined interface, providing a structured and maintainable solution for managing data presentation within table views.

class ViewController: UIViewController {
    
    var collectionTableView = UITableView(frame: .zero, style: .plain)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    // Code on how to configure the tableview that will contain a tableview cell containing a collecrion view
    // this other wise acts the same as if you would make a regular tableview so if you have specifc questions refreer to the UITableviews file
    func configureTableView() {
        collectionTableView.register(TableCell.self, forCellReuseIdentifier: "tableCell")
        collectionTableView.delegate = self
        collectionTableView.dataSource = self
        
        
        collectionTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(collectionTableView)
        
        NSLayoutConstraint.activate([
            collectionTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // The way you set up your table view and collection view depends on how you structure your data.
    // In this file, we aim to create a pseudo shopping list of apple products, where each table cell section contains its own list of products in that genre catalog. To achieve this, we want each section to represent a genre list we've defined in the shoppingItems file. Additionally, we need to work with the information that includes each genre's list of products. We'll utilize a function we've created in the table cells file to populate each cell's collection view for every section.

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ShoppingCatalog.headerTitles[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        ShoppingCatalog.genres.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableCell
        let section = indexPath.section

        cell.setShoppingCatalogAndList(genre: ShoppingCatalog.genres[section], set: ShoppingCatalog.products[section])

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
}
