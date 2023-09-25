//
//  TintedButtonsClasses.swift
//  UIButtons
//
//  Created by Johnathan Huijon on 8/8/23.
//

import UIKit

// This class creates a standard tinted button.
class TintedButton: UIButton {
    // When working with a subclass of an existing class, we need to override its methods.
    // If we don't create a new init and we just call this new class, it will take the exact same parameters as the regular class. However, we can add more operations at the end, such as calling functions we've defined in the class.
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    // This is a required init that's always needed, just in case there's something necessary from the underlying UIButton class that Apple designed.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Our own init that has the parameters color, which determines the button's appearance, title for the button text, and an optional parameter systemImageName for a system image that can be added to the button if desired.
    init(color: UIColor, title:String, systemImageName:String? = nil) {
        super.init(frame: .zero)
        // This class defines a tinted button, so it naturally needs to be of the tinted button type.
        configuration = .tinted()
        
        configuration?.title = title
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
        configuration?.cornerStyle = .medium
        
        if let imageName = systemImageName{
            configuration?.image = UIImage(systemName: imageName)
            configuration?.imagePadding = 5
            configuration?.imagePlacement = .leading
        }
        // TAMIC required
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}


// If you want to add unique features to your buttons, such as different fonts, you can utilize attributed strings to customize the text's appearance according to your preferences. This additional button class focuses on this capability.
class TintedAttributedButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Our more complicated init that only requires color and title; although at that point, you would just use the regular non-attributed Button. But the other parameters that you use will put that attribute you specified into the button you want to create.
    init(color: UIColor, title: String, systemImageName: String? = nil, fontName: UIFont.nameOf.RawValue = UIFont.nameOf.Helvetica.rawValue , fontSize: CGFloat = 16, textColor: UIColor? = nil, textHighlighterColor: UIColor? = nil, underlineStyle: NSUnderlineStyle? = nil, underlineColor: UIColor? = nil, strikethroughStyle: NSUnderlineStyle? = nil, strikethroughColor: UIColor? = nil)
    {
        super.init(frame: .zero)
        
        // this is a tinted button
        configuration = .tinted()
        
        // crete attributedstring to set Title
        // Note that attributed strings can be combined using the addition operator, allowing each attributed string to retain its own unique attributes. This enables developers to create complex and stylized button titles by merging multiple attributed strings with distinct formatting. This powerful feature enhances the flexibility and creativity in designing button content using attributed strings within the modern UIButton APIs.
        let string = title
        var attributedString = AttributedString(string)
        
        // We've assigned default values to the font name and font size, which eliminates the need for conditional checks.
        attributedString.font = .init(name: fontName, size: fontSize)
        
        // Since all of these attributes are optional, we're using "if let" constructs to ensure they are not nil before setting them.
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
        // Lastly, we configure all the provided attributes for the attributed string.
        configuration?.attributedTitle = attributedString
        
        
        // set button color and corner style
        configuration?.baseForegroundColor = color
        configuration?.cornerStyle = .medium
        
        // if image is given we can set it!
        if let imageName = systemImageName{
            configuration?.image = UIImage(systemName: imageName)
            configuration?.imagePadding = 5
            configuration?.imagePlacement = .leading
        }
        
        // TAMIC :/
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}

