//
//  FilledButtonClasses.swift
//  UIButtons
//
//  Created by Johnathan Huijon on 8/11/23.
//


import UIKit

class FilledButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(foregroundColor: UIColor, backgroundColor: UIColor, title:String, systemImageName:String? = nil) {
        super.init(frame: .zero)
        configuration = .filled()
        
        configuration?.title = title

        configuration?.baseForegroundColor = foregroundColor
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.cornerStyle = .medium
        
        if let imageName = systemImageName{
            configuration?.image = UIImage(systemName: imageName)
            configuration?.imagePadding = 5
            configuration?.imagePlacement = .leading
        }

        translatesAutoresizingMaskIntoConstraints = false
        
    }
}


class FilledAttributedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    init(foregroundColor: UIColor, backgroundColor: UIColor, title: String, systemImageName: String? = nil, fontName: UIFont.nameOf.RawValue = UIFont.nameOf.Helvetica.rawValue , fontSize: CGFloat = 16, textColor: UIColor? = nil, textHighlighterColor: UIColor? = nil, underlineStyle: NSUnderlineStyle? = nil, underlineColor: UIColor? = nil, strikethroughStyle: NSUnderlineStyle? = nil, strikethroughColor: UIColor? = nil)
    {
        super.init(frame: .zero)
        

        configuration = .filled()
        

        let string = title
        var attributedString = AttributedString(string)
        

        attributedString.font = .init(name: fontName, size: fontSize)
        

        if let color = textColor {
            attributedString.foregroundColor = color
        }
        if let highlight = textHighlighterColor {
            attributedString.backgroundColor = highlight
        }
        if let lineStyle = underlineStyle {
            attributedString.underlineStyle = lineStyle
        }
        if let lineColor = underlineColor {
            attributedString.underlineColor = lineColor
        }
        if let strikeStyle = strikethroughStyle {
            attributedString.strikethroughStyle = strikeStyle
        }
        if let strikeColor = strikethroughColor {
            attributedString.strikethroughColor = strikeColor
        }

        configuration?.attributedTitle = attributedString
        

        configuration?.baseForegroundColor = foregroundColor
        configuration?.baseBackgroundColor = backgroundColor
        configuration?.cornerStyle = .medium
        

        if let imageName = systemImageName{
            configuration?.image = UIImage(systemName: imageName)
            configuration?.imagePadding = 5
            configuration?.imagePlacement = .leading
        }
        

        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}


