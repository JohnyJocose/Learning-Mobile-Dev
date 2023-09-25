//
//  PushViewController.swift
//  Navigation Controllers
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file serves as a destination when the associated button in the SecondViewController is pressed. It does not contain code related to navigation controllers or modal presentations. For further details on those subjects, please refer to other files within this repository.
class PushViewController: UIViewController {

    let pushLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
    }
    
    func configureLabel() {
        pushLabel.text = "Push Button Pressed; You can go back to the previous screen from here by pressing the back button on the top left"
        pushLabel.font = .boldSystemFont(ofSize: 40)
        pushLabel.textAlignment = .center
        pushLabel.numberOfLines  = 0
        pushLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pushLabel)
        NSLayoutConstraint.activate([
            pushLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pushLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
