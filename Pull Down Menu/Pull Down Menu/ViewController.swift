//
//  ViewController.swift
//  Pull Down Menu
//
//  Created by Johnathan Huijon on 8/13/23.
//

// This section introduces pull-down menus; When menus are added to buttons, users can trigger pull-down menus by holding down the button. This action prompts the display of a menu containing selectable options. Pull-down menus are particularly valuable when dealing with an abundance of choices, effectively decluttering the interface and enhancing the user experience.

import UIKit

class ViewController: UIViewController {
    // Create a button
    let menuButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        setButtonConfigurations()
        setUpMenu()
        configureMenuButton()
        
    }
    
    func setUpMenu() {
        // Separating menus and adding "options: .displayInline" will divide the menus into distinct sections. This is particularly beneficial when dealing with topics that share similarities but should be visually separated for clarity.

        let flipMenu = UIMenu(options: .displayInline, children: [
            UIAction(title: "Horizontal Flip", image: UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")) { action in
                print("Horizontal Flip selected")
            },
            UIAction(title: "Vertical Flip", image: UIImage(systemName: "arrow.up.and.down.righttriangle.up.righttriangle.down.fill")) { action in
                print("Vertical Flip selected")
            }
        ])
        
        let paintMenu = UIMenu(children: [
            UIAction(title: "Mark Up", image: UIImage(systemName: "pencil")) { action in
                print("Mark Up selected")
            },
            UIAction(title: "Paint Brush", image: UIImage(systemName: "paintbrush.fill")) { action in
                print("Paint Brush selected")
            },
            UIAction(title: "Rotate", image: UIImage(systemName: "rotate.right.fill")) { action in
                print("Rotate selected")
            },
            flipMenu
        ])

        // Assign the button.menu to what we just created. This will turn it into a pull-down menu
        menuButton.menu = paintMenu
        // This implementation allows you to activate the pull-down menu simply by pressing the button, as opposed to requiring a continuous hold.
        menuButton.showsMenuAsPrimaryAction = true
    }
    
    // Create the button with the configuration that you see fit
    func configureMenuButton() {
        view.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.widthAnchor.constraint(equalToConstant: 200),
            menuButton.heightAnchor.constraint(equalToConstant: 50),
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setButtonConfigurations() {
        menuButton.configuration = .tinted()
        menuButton.configuration?.title = "Edit"
        menuButton.configuration?.baseForegroundColor = .systemCyan
        menuButton.configuration?.baseBackgroundColor = .systemCyan
        menuButton.configuration?.cornerStyle = .medium
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

