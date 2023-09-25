//
//  UiButtonsClasses.swift
//  UIButtons
//
//  Created by Johnathan Huijon on 8/11/23.
//


import UIKit


class DIYButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        // if the thing we are working with is the same as the parameter name we have to use self in order to use the parameter name
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }


    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}

class DIYAttributedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        // if the thing we are working with is the same as the parameter name we have to use self in order to use the parameter name
        self.backgroundColor = backgroundColor
        
        let font = UIFont.systemFont(ofSize: 16)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowBlurRadius = 5

        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.white,
            .shadow: shadow,
            .underlineStyle: NSUnderlineStyle.single
        ]
        
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)

        
        setAttributedTitle(attributedTitle, for: .normal)
        setTitle(title, for: .normal)
        
        configure()
    }


    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
