//
//  ViewController.swift
//  UIColorWells
//
//  Created by Johnathan Huijon on 8/30/23.
//

import UIKit

// Description: This file defines a UIColorWell class, allowing users to interact with a color well. The center of the color well represents the currently selected color, defaulting to a rainbow if no color is chosen. Tapping the color well presents a modal color selection screen, enabling users to choose their desired color. The selected color is returned as a UIColor, facilitating seamless color customization in the UI.


class ViewController: UIViewController {

    // Syntax to create the color well.
    let colorWell = UIColorWell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }

    func configureUI() {
        configureColorWell()
        placeColorWell()
    }
    
    
    // This is called every time one of the values in the color wheels is changed, indicating a color is picked.
    @objc func changeBackground(_ sender: UIColorWell) {
        // We want to change the view's background to whatever was selected in the color well.
        view.backgroundColor = sender.selectedColor
    }
    
    func configureColorWell() {
        
        // This supports alpha (opacity) in the color well.
        colorWell.supportsAlpha = true
        // When a screen appears for color picking, you can assign a title to it.
        colorWell.title = "Testing ColorWells"
        // You can assign an action to the color well; here, we've set it up for when a value has changed.
        colorWell.addTarget(self, action: #selector(changeBackground(_:)), for: .valueChanged)
        
        colorWell.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Set the color well to view.
    func placeColorWell() {
        view.addSubview(colorWell)
        
        NSLayoutConstraint.activate([
            colorWell.widthAnchor.constraint(equalToConstant: view.frame.width),
            colorWell.heightAnchor.constraint(equalToConstant: view.frame.height),
            colorWell.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorWell.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
    }

}

