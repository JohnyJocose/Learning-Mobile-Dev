// File: Extensions.playground
// Creator: Johnathan Huijon
// Date: 7/17/2023


// Extensions in Swift allow us to add new functionality to existing types, including classes, structs, enums, and protocols. With extensions, we can add computed properties, instance methods, type methods, initializers, and even conform to protocols. They provide a way to extend the capabilities of a type without modifying its original implementation. This promotes code organization, reusability, and enhances readability.

import UIKit

// This code block demonstrates an extension applied to strings. By explicitly stating that this is an extension for strings, it clarifies the context for the following code.
extension String {
    // This function adds a string to the end of another string. By using the `self` keyword, it refers to the original string that the function is called on, allowing the new string to be appended to it.
    func addLuigiIsPookie() -> String {
        return self + "LuigiIsPookie"
    }
    // If you want to have access to a specific string in every file, you can make it a static property within the extension. By making it static, the string becomes accessible throughout your codebase. However, note that this approach does not apply to extensions of classes like `UIColor` or `UIButton`.
    static var luigiString: String{
        return "Luigi"
    }
    
    
}

// This extension of UIColor adds a customColor property that returns a UIColor object with a custom color value. It allows you to easily access this custom color throughout your code by calling UIColor.customColor.
extension UIColor {

    class var customGreen: UIColor {
        let darkGreen = 0x008110
        return UIColor.rgb(fromHex: darkGreen)
    }

    class func rgb(fromHex: Int) -> UIColor {

        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        let alpha = CGFloat(1.0)

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    // This extension on String allows conversion of a hex color string to RGB values. It provides a convenient way to convert hex color codes to UIColor objects, as Xcode does not natively support hex color codes.
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    
    
    // this will generate a random color that can be called in any file
    // the difference between class and static is that you can override class methods in a subclass
    static func random() -> UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
    class func random2() -> UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
}



// This example showcases the usage of the string extension to perform a specific task. It demonstrates how the extension enhances the functionality of the String type and provides additional capabilities for working with strings.
var randomString = "Hello"
print(randomString.addLuigiIsPookie())
// This example demonstrates the usage of another string extension. By declaring the variable as a string, we can directly access the extension's functions using the dot notation without explicitly referencing the string type.
var pookie:String = .luigiString
print(pookie)
// Here's an example of using the hex string function from the UIColor extension. This allows you to create a UIColor instance using a hex color string, providing a convenient way to work with colors in your code.
var green = UIColor(hexString: "fffff")

// Observe how we specified the type of the empty list, allowing us to utilize `.funcType` during appending. The extension being of the same type as the list enables this convenient syntax.
var colorsArray: [UIColor] = []
colorsArray.append(.random())
print(colorsArray)


var colorRandom = UIColor.random()
var colorRandom2 = UIColor.random2()

