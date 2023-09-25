//
//  SecondViewController.swift
//  UITableViews
//
//  Created by Johnathan Huijon on 9/5/23.
//

import UIKit

// This file isn't primarily related to UITableView, except for receiving the grocery item list from the previous screen. Its main focus isn't to alter the table view in any significant way.
class SecondViewController: UIViewController {
    
    let label = UILabel()
    
    // This section of the code will dynamically adapt to display the content associated with the item name sent from the ViewController file.
    var groceryItem: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        
    }
    
    func configureUi() {
        view.backgroundColor = .systemBackground
        configureTitle()
        configureLabel()
    }
    
    func configureTitle() {
        navigationItem.title = "\(groceryItem) found on:"
    }
    
    func configureLabel() {
        label.text = "Isle \(Int.random(in: 1...40))"
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    


}
