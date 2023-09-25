//
//  ViewController.swift
//  UIButtons
//
//  Created by Johnathan Huijon on 8/7/23.
//

// This file covers the usage of UI Buttons, focusing on creating them as variables and placing them on the screen using configurations to visually represent different types of buttons. The other files provide classes for specific types of buttons, including both regular and attributed variations. For more detailed comments, refer to the file TintedButtonsClasses.swift.

import UIKit

class ViewController: UIViewController {


    // tinted code
    let tintedLabel = UILabel()
    
    let tintedRegularButton = TintedButton(color: .red, title: "Peace")
    let tintedImageButton = TintedButton(color: .green, title: "Pizza", systemImageName: "list.bullet.circle")
    
    //let tintedAttributedButton = TintedAttributedButton(color: .cyan, title: "Cheese", systemImageName: "list.bullet.circle", fontName: UIFont.nameOf.Arial_BoldMT.rawValue, fontSize: 20, textColor: .blue, textHighlighterColor: .systemPink, underlineStyle: .single, underlineColor: .black, strikethroughStyle: .double, strikethroughColor: .lightGray)
    
    let tintedAttributedButton = TintedAttributedButton(color: .cyan, title: "Cheese", systemImageName: "list.bullet.circle", underlineColor: .black, strikethroughStyle: .double, strikethroughColor: .yellow)
    
    
    // Filled code
    let filledLabel = UILabel()
    
    let filledRegularButton = FilledButton(foregroundColor: .black, backgroundColor: .green, title: "Buy Now")
    let filledImageButton = FilledButton(foregroundColor: .white, backgroundColor: .systemCyan, title: "Buy", systemImageName: "cart.circle")
    
    let filledAttributedButton = FilledAttributedButton(foregroundColor: .white, backgroundColor: .red, title: "Delete", systemImageName: "flame.fill", fontName: UIFont.nameOf.TimesNewRomanPS_BoldMT.rawValue, fontSize: 16, textColor: .black, textHighlighterColor: .systemPink, underlineStyle: .double, underlineColor: .black, strikethroughStyle: .single, strikethroughColor: .black)
    
    //let filledAttributedButton = FilledAttributedButton(buttonColor: .red, title: "Delete", systemImageName: "flame.fill", fontName: UIFont.nameOf.TimesNewRomanPS_BoldMT.rawValue, fontSize: 16, textColor: .black, textHighlighterColor: .systemPink, underlineStyle: .double, underlineColor: .black, strikethroughStyle: .single, strikethroughColor: .black)
    
    
    // Grayed code
    let grayedLabel = UILabel()
    
    let grayedRegularButton = GrayedButton(foregroundColor: .systemBlue, title: "Hello")
    let grayedImageButton = GrayedButton(foregroundColor: .magenta, title: "Boardwalk", systemImageName: "puzzlepiece.fill")
    
    let grayedAtributedButton = GrayedAttributedButton(foregroundColor: .red, title: "Punch", systemImageName: "eraser.fill", textColor: .systemYellow, strikethroughStyle: .single, strikethroughColor: .black)
    
    
    // Plain code
    let plainLabel = UILabel()
    
    let plainRegularButton = PlainButton(foregroundColor: .purple, title: "Nabbit")
    let plainImageButton = PlainButton(foregroundColor: .systemGreen, title: "Luigi", systemImageName: "gamecontroller.fill")
    
    let plainAttributedButton = PlainAttributedButton(foregroundColor: .systemCyan, title: "Ice", fontName: UIFont.nameOf.HoeflerText_Regular.rawValue)
    
    // UiBUttons
    let DIYLabel = UILabel()
    
    let diyButton = DIYButton(backgroundColor: .orange, title: "Sunny")
    
    let diyAttributedButton = DIYAttributedButton(backgroundColor: .red, title: "Stop")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        
    }
    

    // UI Funcs
    func configureUI() {
        configureTintedButtons()
        configureFilledButtons()
        configureGrayedButtons()
        configurePlainButtons()
        configureDIYButtons()
    }
    
    func configureTintedButtons() {
        configureTintedLabel()
        configureRegularTinted()
        configureImageTinted()
        configureAttributedTinted()
    }
    
    func configureFilledButtons() {
        configureFilledLabel()
        configureRegularFilled()
        configureImageFilled()
        configureAttributedFilled()
    }
    
    func configureGrayedButtons() {
        configureGrayedLabel()
        configureRegularGrayed()
        configureImageGrayed()
        configureAttributedGrayed()
    }
    
    func configurePlainButtons() {
        configurePlainLabel()
        configureRegularPlain()
        configureImagePlain()
        configureAttributedPlain()
    }
    
    func configureDIYButtons() {
        configureDIYLabel()
        configureDIY()
        configureDIYAttributed()
    }
    
    
    
    func configureTintedLabel() {
        view.addSubview(tintedLabel)
        tintedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tintedLabel.text = "Tinted Buttons"
        tintedLabel.font = .boldSystemFont(ofSize: 40)
        tintedLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            tintedLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tintedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tintedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])

    }
    
    func configureRegularTinted() {
        view.addSubview(tintedRegularButton)
        
        NSLayoutConstraint.activate([
            tintedRegularButton.widthAnchor.constraint(equalToConstant: 115),
            tintedRegularButton.heightAnchor.constraint(equalToConstant: 50),
            tintedRegularButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tintedRegularButton.topAnchor.constraint(equalTo: tintedLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configureImageTinted() {
        view.addSubview(tintedImageButton)
        
        NSLayoutConstraint.activate([
            tintedImageButton.widthAnchor.constraint(equalToConstant: 115),
            tintedImageButton.heightAnchor.constraint(equalToConstant: 50),
            tintedImageButton.rightAnchor.constraint(equalTo: tintedRegularButton.leftAnchor, constant: -10),
            tintedImageButton.centerYAnchor.constraint(equalTo: tintedRegularButton.centerYAnchor)
        ])
    }
    
    func configureAttributedTinted() {
        view.addSubview(tintedAttributedButton)
        NSLayoutConstraint.activate([
            tintedAttributedButton.widthAnchor.constraint(equalToConstant: 115),
            tintedAttributedButton.heightAnchor.constraint(equalToConstant: 50),
            tintedAttributedButton.leftAnchor.constraint(equalTo: tintedRegularButton.rightAnchor, constant: 10),
            tintedAttributedButton.centerYAnchor.constraint(equalTo: tintedRegularButton.centerYAnchor)
        ])
    }
    
    
    
    
    func configureFilledLabel() {
        view.addSubview(filledLabel)
        filledLabel.translatesAutoresizingMaskIntoConstraints = false
        
        filledLabel.text = "Filled Buttons"
        filledLabel.font = .boldSystemFont(ofSize: 40)
        filledLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            filledLabel.topAnchor.constraint(equalTo: tintedRegularButton.bottomAnchor, constant: 20),
            filledLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            filledLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureRegularFilled() {
        view.addSubview(filledRegularButton)
        
        NSLayoutConstraint.activate([
            filledRegularButton.widthAnchor.constraint(equalToConstant: 115),
            filledRegularButton.heightAnchor.constraint(equalToConstant: 50),
            filledRegularButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            filledRegularButton.topAnchor.constraint(equalTo: filledLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    func configureImageFilled() {
        view.addSubview(filledImageButton)
        
        NSLayoutConstraint.activate([
            filledImageButton.widthAnchor.constraint(equalToConstant: 115),
            filledImageButton.heightAnchor.constraint(equalToConstant: 50),
            filledImageButton.centerYAnchor.constraint(equalTo: filledRegularButton.centerYAnchor),
            filledImageButton.rightAnchor.constraint(equalTo: filledRegularButton.leftAnchor, constant: -10)
        ])
    }
    
    func configureAttributedFilled() {
        view.addSubview(filledAttributedButton)
        
        NSLayoutConstraint.activate([
            filledAttributedButton.widthAnchor.constraint(equalToConstant: 115),
            filledAttributedButton.heightAnchor.constraint(equalToConstant: 50),
            filledAttributedButton.centerYAnchor.constraint(equalTo: filledRegularButton.centerYAnchor),
            filledAttributedButton.leftAnchor.constraint(equalTo: filledRegularButton.rightAnchor, constant: 10)
        ])
    }
    
    
    
    
    func configureGrayedLabel() {
        view.addSubview(grayedLabel)
        grayedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        grayedLabel.text = "Grayed Buttons"
        grayedLabel.font = .boldSystemFont(ofSize: 40)
        grayedLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            grayedLabel.topAnchor.constraint(equalTo: filledRegularButton.bottomAnchor, constant: 20),
            grayedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            grayedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureRegularGrayed() {
        view.addSubview(grayedRegularButton)
        
        NSLayoutConstraint.activate([
            grayedRegularButton.widthAnchor.constraint(equalToConstant: 115),
            grayedRegularButton.heightAnchor.constraint(equalToConstant: 50),
            grayedRegularButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            grayedRegularButton.topAnchor.constraint(equalTo: grayedLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    func configureImageGrayed() {
        view.addSubview(grayedImageButton)
        
        NSLayoutConstraint.activate([
            grayedImageButton.widthAnchor.constraint(equalToConstant: 115),
            grayedImageButton.heightAnchor.constraint(equalToConstant: 50),
            grayedImageButton.centerYAnchor.constraint(equalTo: grayedRegularButton.centerYAnchor),
            grayedImageButton.rightAnchor.constraint(equalTo: grayedRegularButton.leftAnchor, constant: -10)
        ])
    }
    
    func configureAttributedGrayed() {
        view.addSubview(grayedAtributedButton)
        
        NSLayoutConstraint.activate([
            grayedAtributedButton.widthAnchor.constraint(equalToConstant: 115),
            grayedAtributedButton.heightAnchor.constraint(equalToConstant: 50),
            grayedAtributedButton.centerYAnchor.constraint(equalTo: grayedRegularButton.centerYAnchor),
            grayedAtributedButton.leftAnchor.constraint(equalTo: grayedRegularButton.rightAnchor, constant: 10)
        ])
    }
    
    
    
    
    func configurePlainLabel() {
        view.addSubview(plainLabel)
        plainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        plainLabel.text = "Plain Buttons"
        plainLabel.font = .boldSystemFont(ofSize: 40)
        plainLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            plainLabel.topAnchor.constraint(equalTo: grayedRegularButton.bottomAnchor, constant: 20),
            plainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            plainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureRegularPlain() {
        view.addSubview(plainRegularButton)
        
        NSLayoutConstraint.activate([
            plainRegularButton.widthAnchor.constraint(equalToConstant: 115),
            plainRegularButton.heightAnchor.constraint(equalToConstant: 50),
            plainRegularButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plainRegularButton.topAnchor.constraint(equalTo: plainLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    func configureImagePlain() {
        view.addSubview(plainImageButton)
        
        NSLayoutConstraint.activate([
            plainImageButton.widthAnchor.constraint(equalToConstant: 115),
            plainImageButton.heightAnchor.constraint(equalToConstant: 50),
            plainImageButton.centerYAnchor.constraint(equalTo: plainRegularButton.centerYAnchor),
            plainImageButton.rightAnchor.constraint(equalTo: plainRegularButton.leftAnchor, constant: -10)
        ])
    }
    
    func configureAttributedPlain() {
        view.addSubview(plainAttributedButton)
        
        NSLayoutConstraint.activate([
            plainAttributedButton.widthAnchor.constraint(equalToConstant: 115),
            plainAttributedButton.heightAnchor.constraint(equalToConstant: 50),
            plainAttributedButton.centerYAnchor.constraint(equalTo: plainRegularButton.centerYAnchor),
            plainAttributedButton.leftAnchor.constraint(equalTo: plainRegularButton.rightAnchor, constant: 10)
        ])
    }
    
    
    
    
    func configureDIYLabel() {
        view.addSubview(DIYLabel)
        DIYLabel.translatesAutoresizingMaskIntoConstraints = false
        
        DIYLabel.text = "UIButtons (DIY Buttons)"
        DIYLabel.font = .boldSystemFont(ofSize: 40)
        DIYLabel.textAlignment = .center
        DIYLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            DIYLabel.topAnchor.constraint(equalTo: plainRegularButton.bottomAnchor, constant: 20),
            DIYLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            DIYLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureDIY() {
        view.addSubview(diyButton)
        
        NSLayoutConstraint.activate([
            diyButton.widthAnchor.constraint(equalToConstant: 115),
            diyButton.heightAnchor.constraint(equalToConstant: 50),
            diyButton.centerXAnchor.constraint(equalTo: plainImageButton.rightAnchor),
            diyButton.topAnchor.constraint(equalTo: DIYLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    func configureDIYAttributed() {
        view.addSubview(diyAttributedButton)
        
        NSLayoutConstraint.activate([
            diyAttributedButton.widthAnchor.constraint(equalToConstant: 115),
            diyAttributedButton.heightAnchor.constraint(equalToConstant: 50),
            diyAttributedButton.centerXAnchor.constraint(equalTo: plainAttributedButton.leftAnchor),
            diyAttributedButton.topAnchor.constraint(equalTo: DIYLabel.bottomAnchor, constant: 10)
            
        ])
        
    }
    
}
