//
//  ViewController.swift
//  Update Button Handler
//
//  Created by Johnathan Huijon on 8/14/23.
//

//
// Description: This file delves into the concept of `configurationUpdateHandler`, a powerful tool within Swift's Xcode environment. The `configurationUpdateHandler` is harnessed when the need arises to update a button's properties dynamically. An illustrative application of this is evident in scenarios like a shopping cart, where the button's subtitle requires real-time updating to reflect the number of items in the cart. This concept extends further to instances where modifying text in a text box triggers adjustments to a string, invoking the `setNeedsUpdateConfiguration()` method. This mechanism ensures that the `configurationUpdateHandler` is triggered, facilitating seamless updates to a button's configuration based on the evolving data context.
//

import UIKit

class ViewController: UIViewController {

    
    let updateButton = UIButton()
    let textBox = UITextField()
    let confirmButton = UIButton()
    
    // Every time the string is modified, it will call the update handler in setUpdateButtonConfigurations.
    private var itemQuantityDescription: String? {
        didSet {
            updateButton.setNeedsUpdateConfiguration()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
        
        
    }
    
    // Change the text every time the confirm button is pressed. Since we changed the string, it causes the update handler in the button to go off, modifying the look of the button.
    @objc func updateItemQuantity() {
        itemQuantityDescription = textBox.text
    }
    
    
    // UI Code
    func setUI(){
        setUpdateUI()
        setTextBoxUIAndConfirmButton()
    }
    
    
    func setUpdateUI() {
        setUpdateButtonConfigurations()
        configureUpdateButton()
    }
    
    func setTextBoxUIAndConfirmButton() {
        configureTextBox()
        setConfirmButtonConfigurations()
        configureConfirmButton()
    }
    
    func setConfirmButtonConfigurations() {
        confirmButton.configuration = .tinted()
        confirmButton.configuration?.title = "Confirm"
        confirmButton.configuration?.baseForegroundColor = .systemCyan
        confirmButton.configuration?.baseBackgroundColor = .systemCyan
        confirmButton.configuration?.cornerStyle = .medium
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureConfirmButton() {
        view.addSubview(confirmButton)
        // This calls the updateItemQuantity function that will change the string to equal that of what's in the text box.
        confirmButton.addTarget(self, action: #selector(updateItemQuantity), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            confirmButton.widthAnchor.constraint(equalToConstant: 200),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.topAnchor.constraint(equalTo: textBox.bottomAnchor, constant: 20)
            
        ])
    }

    func configureTextBox() {
        
        textBox.placeholder = "Enter Number Here"
        textBox.borderStyle = UITextField.BorderStyle.line
        
        textBox.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textBox)
        
        NSLayoutConstraint.activate([
            textBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textBox.heightAnchor.constraint(equalToConstant: 150),
            textBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textBox.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // Update Handler in this function
    func setUpdateButtonConfigurations() {
        // This is setting the configurations to the button for when it loads.
        updateButton.configuration = .plain()
        
        updateButton.configuration?.cornerStyle = .medium
        updateButton.configuration?.image = UIImage(systemName: "flag.2.crossed")
        
        
        // This is what you need to put in order to be called when we need to update the button dynamically.
        updateButton.configurationUpdateHandler = {
            [unowned self] button in
            
            // Change the button image for when the button is highlighted to show it's about to be selected.
            var config = button.configuration
            config?.image = button.isHighlighted ? UIImage(systemName: "flag.2.crossed.fill") : UIImage(systemName: "flag.2.crossed")
            
            // Update the button text.
            config?.subtitle = self.itemQuantityDescription
            // Set configurations.
            button.configuration = config
        }
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureUpdateButton() {
        view.addSubview(updateButton)
        
        
        NSLayoutConstraint.activate([
            updateButton.widthAnchor.constraint(equalToConstant: 200),
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            updateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35)
            
        ])
    }

}

