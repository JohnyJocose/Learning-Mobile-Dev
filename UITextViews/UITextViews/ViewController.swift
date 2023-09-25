//
//  ViewController.swift
//  UITextViews
//
//  Created by Johnathan Huijon on 9/13/23.
//

import UIKit

// This file covers the setup, customization, and utilization of UITextView, a versatile component for displaying and editing text within an app.

class ViewController: UIViewController {
    
    // Syntax for creating a UITextView variable.
    var textviewExample = UITextView()
    var wordCount = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        configureTextview()
        configureLabel()
        updateCharacterCount()
        
    }
    
    func configureLabel() {
        wordCount.textColor = .gray
        wordCount.textAlignment = .right
        wordCount.numberOfLines = 0
        
        wordCount.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(wordCount)
        
        NSLayoutConstraint.activate([
            wordCount.trailingAnchor.constraint(equalTo: textviewExample.trailingAnchor),
            wordCount.topAnchor.constraint(equalTo: textviewExample.bottomAnchor, constant: 4),
            wordCount.leadingAnchor.constraint(equalTo: textviewExample.leadingAnchor)
        ])
    }
    
    // Function for configuring UITextView settings and properties.
    func configureTextview() {
        // Customize UITextView appearance and behavior, including text alignment, font, and content.
        textviewExample.textAlignment = .left
        textviewExample.font = .italicSystemFont(ofSize: 18)
        textviewExample.textColor = .systemPink
        // Although not essential for basic functionality, setting UITextView's delegate allows access to functions within this file, such as tracking edits to implement a word count feature.
        textviewExample.delegate = self
        textviewExample.text = "Hello"
        textviewExample.layer.borderWidth = 3
        textviewExample.layer.cornerRadius = 15
        textviewExample.layer.borderColor = UIColor.tertiarySystemBackground.cgColor
        
        textviewExample.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textviewExample)
        
        NSLayoutConstraint.activate([
            textviewExample.widthAnchor.constraint(equalToConstant: 300),
            textviewExample.heightAnchor.constraint(equalToConstant: 150),
            textviewExample.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textviewExample.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
            
        ])
    }


}

extension ViewController: UITextViewDelegate{

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // Ensure the UITextView content matches the desired format and set any applicable limits accordingly.
        switch textView {
        case textviewExample:
            // If this condition is true, characters will be allowed to be typed.
            return textviewExample.text!.count + (text.count - range.length) <= 500
        default:
            // If we don't want the UITextView to have a word count, we return false, and characters won't be allowed to be typed. To prevent this, we simply don't assign a delegate to the UITextView.
            return false
        }
    }

    // Every time we modify the content of the UITextView, the character count is updated.
    func textViewDidChange(_ textView: UITextView) {
        updateCharacterCount()
    }

    // Update character count labels to match the character count of the UITextField.
    func updateCharacterCount() {
        let characterCount = self.textviewExample.text!.count
        wordCount.text = "\(characterCount) / 500 Characters"

     }


}

