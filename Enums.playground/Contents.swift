// File: Enums.playground
// Creator: Johnathan Huijon
// Date: 6/30/2023

/*
 * Enums in Swift
 *
 * This file contains definitions and examples of enums, a powerful language feature in Swift.
 * Enums allow you to define a group of related values, making your code more expressive and readable.
 *
 * By understanding and utilizing enums effectively, you can enhance the structure and functionality
 * of your code, improving its maintainability and reducing the likelihood of errors.
 */


import UIKit

// By utilizing the 'Var: Basic Type' with a raw value, I am able to assign specific values to each case within the enumeration. This allows for easier referencing and manipulation of these values throughout the code.
enum MarioCharacter: String {
    case Mario = "red and overall an average person"
    case Luigi = "POOKIE!!! <3 Absolutely the best person to ever exist!!! Very Green and Handsome!"
    case Bowser = "yellow and Green"
    case Peach = "pink... and she slays"
    case Yoshi = "so cute OMGGGGG! Literally a dinosaur!"
}

// The enum can be effectively utilized in various contexts, including within functions. Furthermore, observe the remarkable readability of this particular line of code, showcasing the clarity and simplicity afforded by using an enum.
func rateJohnysOpinion(on char: MarioCharacter){
    print("I love the character \(char) because they are \(char.rawValue)")
}

rateJohnysOpinion(on: .Luigi)



// Here's another example of using enums; however, this illustration does not involve raw values.
enum ZeldaCharacter: String {
    case Link
    case Zelda
    case Ganon
    case Impa
    case Beedle
    case Tingle
}
// Once you set the variable and want to change it later, you can switch it to any of the possible values of the enum using `.case` without needing to specify the enum explicitly.
var favoriteZeldaChar = ZeldaCharacter.Zelda
favoriteZeldaChar = .Link
print ("My favortie zelda character is \(favoriteZeldaChar)")
