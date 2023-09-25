//
//  ViewController.swift
//  Pop Up Menu
//
//  Created by Johnathan Huijon on 8/17/23.
//

//
// Description: Within this file, we delve into the world of pop-up menus, which bears similarities to pull-down menus, both of which are crafted using buttons within Swift's Xcode environment. By adopting a structure reminiscent of pull-down menus, pop-up menus extend a versatile interaction paradigm to users. However, a unique distinction emerges with the introduction of the "//button.changesSelectionAsPrimaryAction = true" configuration. This parameter endows the button with the ability to drive selection, thereby enhancing user engagement through direct button-driven menu choices. A noteworthy feature accompanies this functionality: when an option is chosen, the button's label is automatically updated to reflect the selected choice. Through the seamless integration of buttons, menus, and this innovative configuration, pop-up menus offer an elegant solution for presenting options and engaging user interaction


import UIKit

class ViewController: UIViewController {

    // Create a button
    let menuButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        
    }
    
    // This is the function we're using to print which menu action was selected
    func updateColor(_ title: String) {
        print(title + " Selected")
    }
    
    func configureUI() {
        setButtonConfigurations()
        setUpMenu()
        configureMenuButton()
        
    }
    
    func setUpMenu() {
        
        // We have a closure that will be called as a handler, performing the function above to print which menu action was selected
        let colorClosure = { [self] (action: UIAction) in
            updateColor(action.title)
        }
        
        // Separating menus and adding "options: .displayInline" will divide the menus into distinct sections. This is particularly beneficial when dealing with topics that share similarities but should be visually separated for clarity.
        let flipMenu = UIMenu(options: .displayInline, children: [
            UIAction(title: "Horizontal Flip", image: UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill"), handler: colorClosure),
            // Notice how these have handlers that perform the color closure above, while the other ones just have a closure that performs something. This is because I wanted to showcase that there are multiple ways to perform the action that you want.
            UIAction(title: "Vertical Flip", image: UIImage(systemName: "arrow.up.and.down.righttriangle.up.righttriangle.down.fill"), handler: colorClosure)
        ])
        
        let paintMenu = UIMenu(children: [
            UIAction(title: "Mark Up", image: UIImage(systemName: "pencil")) { action in
                print("Mark Up selected")
            },
            // You can have one of the menu items have a state of .on; this will be the first one selected when this button is loaded. This will not trigger the closure or handler, however.
            UIAction(title: "Paint Brush", image: UIImage(systemName: "paintbrush.fill"), state: .on) { action in
                print("Paint Brush selected")
            },
            UIAction(title: "Rotate", image: UIImage(systemName: "rotate.right.fill")) { action in
                print("Rotate selected")
            },
            flipMenu
        ])
        
        
        
        // Assign the button.menu to what we just created. This will turn it into a pull-down menu, the prior step to making it a pull-down menu.
        menuButton.menu = paintMenu
        // This makes it so you can just press the button to make the menu appear, compared to having to hold it down.
        menuButton.showsMenuAsPrimaryAction = true
        // This makes it a pop-up menu
        menuButton.changesSelectionAsPrimaryAction = true

        // This piece of code will update the selection state to .on, overriding what you set above. It still won't trigger the closure or handler, however.
        (menuButton.menu?.children[0] as? UIAction)?.state = .on
        
        // Now, if you want to have your menu action that you set state to .on, you have to update to the currently set one. This piece of code will give you what is currently selected, which we used to put in the updateColor function.
        updateColor(menuButton.menu?.selectedElements.first?.title ?? "Error")

        
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

