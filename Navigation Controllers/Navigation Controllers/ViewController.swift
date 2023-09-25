//
//  ViewController.swift
//  Navigation Controllers
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file provides an introduction to navigation controllers, a fundamental component in iOS development. Navigation controllers manage a hierarchical stack of view controllers, allowing for smooth navigation through an app's content. They provide a structured way to transition between screens, facilitating efficient user interactions. By leveraging navigation controllers, developers can design intuitive user interfaces, enabling users to explore and navigate various sections of an app seamlessly. This file explores the basics of navigation controllers and highlights their pivotal role in crafting intuitive and engaging iOS applications.

// In this file, the `buttonPressed` function is the only portion related to navigation controllers. If you have any questions about other aspects of this file, please refer to other files covering different topics in this repository.

class ViewController: UIViewController {
    
    let screenLabel = UILabel()
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
        configureLabel()
        configureButton()
    }
    
    @objc func buttonPressed() {
        // This code demonstrates how to push a view controller onto the navigation stack.
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }
    
    // This button press action will push a view controller onto the navigation stack.
    func configureButton() {
        var config = nextButton.configuration
        config = .tinted()
        config?.baseBackgroundColor = .systemRed
        config?.baseForegroundColor = .systemRed
        config?.title = "Add Screen"
        nextButton.configuration =  config
        nextButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: screenLabel.bottomAnchor, constant: 35)
        ])
    }

    func configureLabel() {
        screenLabel.text = "The screen you see right here...\nThis is a ViewControler!\n\nWith a Navigation Controller you can add another screen(viewcontroller) on top of this viewContoller\n\nPress this button right here"
        screenLabel.textAlignment = .center
        screenLabel.numberOfLines = 0
        screenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(screenLabel)
        NSLayoutConstraint.activate([
            screenLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
    }
}

