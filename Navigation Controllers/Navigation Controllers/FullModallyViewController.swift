//
//  FullModallyViewController.swift
//  Navigation Controllers
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file serves as a destination when the associated button in the SecondViewController is pressed. It does not contain code related to navigation controllers or modal presentations. For further details on those subjects, please refer to other files within this repository.

class FullModallyViewController: UIViewController {

    let fullModallyLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
    }
    
    func configureLabel() {
        fullModallyLabel.text = "Full Modally Button Pressed!!!\n You would start a new sequence of view controllers after this.\n(Usually when you have no more reason to access the previous controllers like if they were for log ins)"
        fullModallyLabel.font = .boldSystemFont(ofSize: 40)
        fullModallyLabel.textAlignment = .center
        fullModallyLabel.numberOfLines  = 0
        fullModallyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fullModallyLabel)
        NSLayoutConstraint.activate([
            fullModallyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullModallyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            fullModallyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fullModallyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
