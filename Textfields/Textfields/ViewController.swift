//
//  ViewController.swift
//  Textfields
//
//  Created by Johnathan Huijon on 8/23/23.
//

// TextFields are fundamental UI elements used to capture user input, such as text, numbers, or passwords. These versatile components are essential for creating interactive forms, login screens, search bars, and more. TextFields offer various customization options, allowing developers to control appearance, keyboard types, input validation, and placeholder text. By integrating TextFields into an app's user interface, developers can enhance user engagement and enable seamless data entry.

//  One more thing; textfeilds can only hold one line!!! if you want to have one that has multiple lines you need to look at textviews instead!!!

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Syntax to create a text field
    let roundedTextfield = UITextField()
    let charCount = UILabel()
    let lineTextfield = UITextField()
    let bezelTextfield = UITextField()
    let noneTextfield = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        updateCharacterCount()
    }

    // Update character count labels to match the text field count
    func updateCharacterCount() {
        let characterCount = self.roundedTextfield.text!.count
        charCount.text = "\(characterCount) / 50 Characters"
        
     }
    
    // This function is utilized in the `configureRounded` function as an `addTarget` to ensure that every time we modify the content of the text field, the character count is updated.
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateCharacterCount()
    }
    
    // This check ensures that the text field content doesn't exceed the set word count limit.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Verify that the text field matches the desired one and set the limit accordingly here.
        if(textField == roundedTextfield) {
            // If this condition is true, characters will be allowed to be typed.
            return textField.text!.count + (string.count - range.length) <= 50
        }
        // If the condition doesn't return true, the character won't be typed at all.
        return false
    }

    
    func configureUI() {
        configureRoundedTF()
        setRoundedTFConstraints()
        configureLineTF()
        setLineTFConstraints()
        configureBezelTF()
        setBezelTFConstraints()
        configureNoneTF()
        setNoneTFConstraints()
        configureAndSetCharCountLabel()
    }
    
    func configureAndSetCharCountLabel() {
        charCount.textAlignment = .right
        
        charCount.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(charCount)
        NSLayoutConstraint.activate([
            charCount.widthAnchor.constraint(equalToConstant: 300),
            charCount.heightAnchor.constraint(equalToConstant: 15),
            charCount.topAnchor.constraint(equalTo: roundedTextfield.bottomAnchor, constant: 3),
            charCount.trailingAnchor.constraint(equalTo: roundedTextfield.trailingAnchor)
        ])
    }
    
    // Rounded text field code here
    func configureRoundedTF() {
        // This layout is commonly seen in login screens, where the text fields have a fixed height that cannot be adjusted. Other types of text fields allow for height customization.
        roundedTextfield.borderStyle = .roundedRect
        // This adjustment ensures that the text field is properly visible in dark mode.
        roundedTextfield.backgroundColor = .tertiarySystemBackground
        roundedTextfield.text = "Rounded (Good for log ins)"
        roundedTextfield.delegate = self
        roundedTextfield.keyboardType = .default
        // This functionality is used to display "******" when typing in the text field. This is commonly used for password input fields.
        //roundedTextfield.isSecureTextEntry = true
        
        roundedTextfield.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
        roundedTextfield.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setRoundedTFConstraints() {
        view.addSubview(roundedTextfield)
        
        NSLayoutConstraint.activate([
            // Height for a rounded text field is already set and cannot be changed; consider using another text field for height adjustments. Note that significant height adjustments are not encouraged as only one line of text can be shown in a text field.
            roundedTextfield.widthAnchor.constraint(equalToConstant: 300),
            roundedTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundedTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    // No border text field code here
    func configureNoneTF() {
        noneTextfield.borderStyle = .none
        noneTextfield.text = "None; Kinda nakes tbh"
        noneTextfield.backgroundColor = .tertiarySystemBackground
        
        noneTextfield.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setNoneTFConstraints() {
        view.addSubview(noneTextfield)
        
        NSLayoutConstraint.activate([
            noneTextfield.widthAnchor.constraint(equalToConstant: 300),
            noneTextfield.heightAnchor.constraint(equalToConstant: 50),
            noneTextfield.topAnchor.constraint(equalTo: bezelTextfield.bottomAnchor, constant: 30),
            noneTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // Bezel text field code here
    func configureBezelTF() {
        bezelTextfield.borderStyle = .bezel
        bezelTextfield.text = "Bezel Style; kinda 3D"
        bezelTextfield.backgroundColor = .tertiarySystemBackground
        
        
        bezelTextfield.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setBezelTFConstraints() {
        view.addSubview(bezelTextfield)
        
        NSLayoutConstraint.activate([
            bezelTextfield.widthAnchor.constraint(equalToConstant: 300),
            bezelTextfield.heightAnchor.constraint(equalToConstant: 50),
            bezelTextfield.topAnchor.constraint(equalTo: lineTextfield.bottomAnchor, constant: 30),
            bezelTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // Single-line text field code here
    func configureLineTF() {
        lineTextfield.borderStyle = .line
        lineTextfield.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        lineTextfield.backgroundColor = .tertiarySystemBackground
        
        lineTextfield.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLineTFConstraints() {
        view.addSubview(lineTextfield)
        
        NSLayoutConstraint.activate([
            lineTextfield.widthAnchor.constraint(equalToConstant: 300),
            lineTextfield.heightAnchor.constraint(equalToConstant: 50),
            lineTextfield.topAnchor.constraint(equalTo: roundedTextfield.bottomAnchor, constant: 30),
            lineTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

