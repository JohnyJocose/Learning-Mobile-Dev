//
//  ViewController.swift
//  UIViews
//
//  Created by Johnathan Huijon on 9/15/23.
//

import UIKit

// This file explores the versatile usage and customization of UIViews, fundamental components for constructing the app's visual interface.

class ViewController: UIViewController {
    // Syntax for creating a UIView instance.
    let blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
        configureView()
    }
    
    // Code for configuring a UIView's appearance and behavior.
    func configureView() {
        // Set features for the UIView, like background color, borders, and corner radius for curved edges.
        blueView.backgroundColor = .systemBlue
        blueView.layer.borderWidth = 4
        blueView.clipsToBounds = true
        blueView.layer.borderColor = UIColor.clear.cgColor
        blueView.layer.cornerRadius = 5
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add a subview to a UIView.
        view.addSubview(blueView)
        NSLayoutConstraint.activate([
            blueView.heightAnchor.constraint(equalToConstant: 150),
            blueView.widthAnchor.constraint(equalToConstant: 200),
            blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}

