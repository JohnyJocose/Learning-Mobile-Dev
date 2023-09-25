//
//  ViewController.swift
//  UIImageViews
//
//  Created by Johnathan Huijon on 9/9/23.
//

import UIKit

// This file demonstrates creating a UIImageView and adding an image to it using both image assets and system names. This guides users on how to set up a UIImageView to display images efficiently and with ease.

class ViewController: UIViewController {
    
    // Syntax to create a UIImageView
    var imageView = UIImageView()
    
    // SF Symbols: These images can be accessed using UIImage(systemName: "SF name"). They come with Xcode, offering a variety of readily available images for use in your app. If you need a simple image, such as an arrow facing a cardinal direction of your choice, it can be found in SF Symbols. Apple's default SF Symbols can be customized by changing colors, allowing specific parts to have individually set colors. You can add your own custom SF Symbols with practice, but the details for this are not covered in these files and require additional research.
    let sfSymbolImage = UIImage(systemName: "l.joystick.press.down.fill")
    // UIImage(named: "Image name") allows access to images from your assets folder, enabling you to add your own pictures that can be utilized by any component requiring a UIImage.
    // You will find a picture of my beautiful dog, Piper, under the file name "dog" in the assets file. When calling UIImage(named: ), the name must exactly match the file name. // Also, rest in peace Piper. You will always be remembered and loved.
    let assetImage = UIImage(named: "dog")
    
    
    let horizontalStack = UIStackView()
    let defaultButton = UIButton()
    let sfButton = UIButton()
    let assetButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAndSetUI()
        
    }
    
    
    func configureAndSetUI() {
        view.backgroundColor = .systemBackground
        configureImageView()
        setUpImageView()
        configureStack()
        configureButtons()
        setUpStackWithButtons()
    }
    
    func setUpStackWithButtons() {
        
        view.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(defaultButton)
        horizontalStack.addArrangedSubview(assetButton)
        horizontalStack.addArrangedSubview(sfButton)
        
        NSLayoutConstraint.activate([
            
            defaultButton.widthAnchor.constraint(equalToConstant: 120),
            defaultButton.heightAnchor.constraint(equalToConstant: 50),
            
            assetButton.widthAnchor.constraint(equalToConstant: 120),
            assetButton.heightAnchor.constraint(equalToConstant: 50),
            
            sfButton.widthAnchor.constraint(equalToConstant: 120),
            sfButton.heightAnchor.constraint(equalToConstant: 50),
            
            horizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
    }
    
    // This function is called every time one of the buttons is pressed. Inside, we use a switch case to determine which button is pressed and perform the corresponding action accordingly.
    @objc func changeImage(_ sender:UIButton) {
        switch sender {
        case defaultButton:
            // UIImageViews come with default images, all of which are SF Symbols.
            // Default SF Symbol images associated with UIImageViews: .action, .add, .checkmark, .remove, .strokedCheckmark
            imageView.image = .actions
            
        case assetButton:
            imageView.image = assetImage
            
        case sfButton:
            imageView.image = sfSymbolImage
            
        default:
            imageView.image = .none
        }
        
        
    }
    
    
    func configureButtons() {
        // Default button
        var configDefault = defaultButton.configuration
        configDefault = .tinted()
        configDefault?.title = "Deafult"
        configDefault?.baseBackgroundColor = .systemPink
        configDefault?.baseForegroundColor = .systemPink
        configDefault?.buttonSize = .medium
        configDefault?.cornerStyle = .medium
        defaultButton.configuration = configDefault
        defaultButton.addTarget(self, action: #selector(changeImage(_:)), for: .touchUpInside)
        defaultButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Asset button
        var configAsset = assetButton.configuration
        configAsset = .tinted()
        configAsset?.title = "Asset"
        configAsset?.baseBackgroundColor = .systemPink
        configAsset?.baseForegroundColor = .systemPink
        configAsset?.buttonSize = .medium
        configAsset?.cornerStyle = .medium
        assetButton.configuration = configAsset
        assetButton.addTarget(self, action: #selector(changeImage(_:)), for: .touchUpInside)
        assetButton.translatesAutoresizingMaskIntoConstraints = false
        
        // SF (System Font) button
        var configSF = sfButton.configuration
        configSF = .tinted()
        configSF?.title = "SF Symbol"
        configSF?.baseBackgroundColor = .systemPink
        configSF?.baseForegroundColor = .systemPink
        configSF?.buttonSize = .medium
        configSF?.cornerStyle = .medium
        sfButton.configuration = configSF
        sfButton.addTarget(self, action: #selector(changeImage(_:)), for: .touchUpInside)
        sfButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureStack() {
        // Horizontal stack to automatically align three buttons.
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        horizontalStack.spacing = 8
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // Set the image in the view.
    func setUpImageView() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
    }

    func configureImageView() {
        // You can set a background color to appear in case the image you choose doesn't fill up the entire UIImageView.
        imageView.backgroundColor = .lightGray
        // This will prevent the image from exceeding its bounds.
        imageView.clipsToBounds = true
        // You can determine how the image fits inside the view. A popular choice, and the one we're using for this example, is .scaleAspectFit.
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }

}

