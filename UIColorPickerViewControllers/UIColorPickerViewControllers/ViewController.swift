//
//  ViewController.swift
//  UIColorPickerViewControllers
//
//  Created by Johnathan Huijon on 9/24/23.
//

import UIKit

// This file contains the implementation for custom view controllers facilitating color selection and customization using UIColorPickerViewController, enhancing user experiences with color manipulation in iOS apps.

class ViewController: UIViewController {
    
    // This button will be used to modally present the color picker view.
    let colorButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureButton()
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        // Create the color picker view.
        let colorPickerView = UIColorPickerViewController()
        // This supports alpha (opacity) in the color picker view controller.
        colorPickerView.supportsAlpha = true
        // Assign the color picker delegate to self for access to functions in this file's view controller.
        // An error will prompt to add UIColorPickerViewControllerDelegate to the view controller, granting access to the functions found below.
        colorPickerView.delegate = self
        // Present the color picker modally.
        present(colorPickerView, animated: true)
    }
    
    // Configure our button.
    func configureButton() {
        var config = colorButton.configuration
        config = .filled()
        config?.baseBackgroundColor = .systemMint
        config?.baseForegroundColor = .black
        config?.buttonSize = .medium
        config?.cornerStyle = .medium
        config?.title = "Change Background"
        colorButton.configuration = config
        // when pressed call the buttonPressed that will bring up the UIcolorPickerviewcontroller
        colorButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        setButton()
    }
    
    // Adding a subview and it's constraints
    func setButton() {
        view.addSubview(colorButton)
        
        NSLayoutConstraint.activate([
            colorButton.widthAnchor.constraint(equalToConstant: 200),
            colorButton.heightAnchor.constraint(equalToConstant: 50),
            colorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }


}

// When you add UIColorPickerViewControllerDelegate to your view controller, you gain access to these two functions.
extension ViewController: UIColorPickerViewControllerDelegate {
    
    // Feel free to comment and uncomment between these two functions to try both of them out.

    // This function is called every time the user changes the color.
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        
        let color = viewController.selectedColor
        view.backgroundColor = color
        
    }
    
    // This function is called when the user presses the 'X' exit button on the color picker view.
    
//    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
//        let color = viewController.selectedColor
//        view.backgroundColor = color
//    }
    
}
