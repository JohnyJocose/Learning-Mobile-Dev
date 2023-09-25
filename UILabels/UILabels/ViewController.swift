//
//  ViewController.swift
//  UILabels
//
//  Created by Johnathan Huijon on 8/17/23.
//

//
// Description: This file delves into the world of UILabels, an essential component in Swift's Xcode ecosystem for rendering text-based content. UILabels are a cornerstone of user interface design, offering a straightforward yet powerful means of displaying textual information. Through intuitive integration, developers can configure UILabels to showcase diverse content, from simple text strings to complex formatted data. These versatile elements can be positioned within various UI elements to convey crucial information, instructions, or dynamic updates to users. This exploration of UILabels underscores their fundamental role in crafting effective and visually appealing user interfaces, shaping a seamless and informative user experience within Swift applications.
//

import UIKit

class ViewController: UIViewController {
    
    // Syntax to create a UILabel
    let exampleLabel = UILabel()
    let attributedLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLabel()
        configureAttributedLabel()
    }
    
    // UI Funcs
    func configureLabel() {
        view.addSubview(exampleLabel)
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // You can customize your label with various properties such as text, font, text alignment, number of lines, text colors, and more.
        exampleLabel.text = "A bunch of text goes here"
        exampleLabel.font = .boldSystemFont(ofSize: 40)
        exampleLabel.textAlignment = .center
        // If you set the number of lines to 0, the label can have as many lines as fit within its frame. If you specify a fixed number of lines, e.g., 1 or 2, and there's more text to display, it will show what fits within the specified lines and add "..." at the end.
        exampleLabel.numberOfLines = 0
        exampleLabel.textColor = .cyan
        
        NSLayoutConstraint.activate([
            exampleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            exampleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            exampleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])

    }
    
    // Unlike buttons, which accept regular attributed strings, labels utilize NSAttributedStrings, affording developers a slightly broader range of customization options.
    func configureAttributedLabel() {
        view.addSubview(attributedLabel)
        attributedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let quote = "Haters gonna hate. \nForever and ever"
        let font = UIFont.systemFont(ofSize: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.firstLineHeadIndent = 5.0
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.blue,
            .paragraphStyle: paragraphStyle,
            .shadow: shadow
        ]

        let attributedQuote = NSAttributedString(string: quote, attributes: attributes)
        
        attributedLabel.attributedText = attributedQuote
        
        attributedLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            attributedLabel.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 30),
            attributedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            attributedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])

    }
    
}

