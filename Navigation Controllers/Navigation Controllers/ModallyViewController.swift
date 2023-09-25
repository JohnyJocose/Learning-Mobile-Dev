//
//  ModallyViewController.swift
//  Navigation Controllers
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file serves as a destination when the associated button in the SecondViewController is pressed. It does not contain code related to navigation controllers or modal presentations. For further details on those subjects, please refer to other files within this repository.

class ModallyViewController: UIViewController {

    let modallyLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
    }
    
    func configureLabel() {
        modallyLabel.text = "Modally Button Pressed!!!\n Just scroll the screen down to get out of it"
        modallyLabel.font = .boldSystemFont(ofSize: 40)
        modallyLabel.textAlignment = .center
        modallyLabel.numberOfLines  = 0
        modallyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modallyLabel)
        NSLayoutConstraint.activate([
            modallyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modallyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modallyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modallyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
