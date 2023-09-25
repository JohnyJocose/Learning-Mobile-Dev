//
//  HomeVC.swift
//  TabBars
//
//  Created by Johnathan Huijon on 9/20/23.
//

// This file is just one of our root view controllers for our navigation controllers connected to a tab bar.
// If you have any questions about the items referred to here, please refer to other projects in this repository for more details.

import UIKit

class HomeVC: UIViewController {

    let homeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
    }
    
    func configureLabel() {
        homeLabel.text = "Welcome to the Home Tab"
        homeLabel.font = .boldSystemFont(ofSize: 30)
        homeLabel.numberOfLines = 0
        homeLabel.textAlignment = .center
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(homeLabel)
        NSLayoutConstraint.activate([
            homeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

}
