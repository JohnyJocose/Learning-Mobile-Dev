//
//  ProfileVC.swift
//  TabBars
//
//  Created by Johnathan Huijon on 9/20/23.
//

// This file is just one of our root view controllers for our navigation controllers connected to a tab bar.
// If you have any questions about the items referred to here, please refer to other projects in this repository for more details.
import UIKit

class ProfileVC: UIViewController {

    let profileLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
    }
    
    func configureLabel() {
        profileLabel.text = "Welcome to the Profile Tab"
        profileLabel.font = .boldSystemFont(ofSize: 30)
        profileLabel.numberOfLines = 0
        profileLabel.textAlignment = .center
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileLabel)
        NSLayoutConstraint.activate([
            profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
