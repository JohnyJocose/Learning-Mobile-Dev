//
//  SearchVC.swift
//  TabBars
//
//  Created by Johnathan Huijon on 9/20/23.
//

// This file is just one of our root view controllers for our navigation controllers connected to a tab bar.
// If you have any questions about the items referred to here, please refer to other projects in this repository for more details.
import UIKit

class SearchVC: UIViewController {

    let searchLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
    }
    
    func configureLabel() {
        searchLabel.text = "Welcome to the Search Tab"
        searchLabel.font = .boldSystemFont(ofSize: 30)
        searchLabel.numberOfLines = 0
        searchLabel.textAlignment = .center
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchLabel)
        NSLayoutConstraint.activate([
            searchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
