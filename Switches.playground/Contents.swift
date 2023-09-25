// File: Switches.playground
// Creator: Johnathan Huijon
// Date: 7/12/2023

// Switch statements in Swift provide a concise and efficient way to handle multiple possible conditions or cases. This file will explore the usage of switch statements. Switches offer a structured approach to handle complex decision-making scenarios and can be particularly useful when working with enumerated types or comparing values against multiple options.

import UIKit

// Switch cases are commonly paired with enums as they provide a convenient way to handle different cases based on specific values. Since enums have a finite set of possible values, we don't need a default case as we can account for all possible scenarios.
enum marioChar: String {
    case Mario
    case Luigi
    case Peach
    case Toad
}
func getMarioCharDescription(on char: marioChar) {
    switch char {
    case .Mario:
        print("He's Red")
    case .Luigi:
        print("He's Green and Pookie")
    case .Peach:
        print("She's Pink")
    case .Toad:
        print("He's Yellow")
    }
}

getMarioCharDescription(on: .Luigi)



// This is an example of using switch cases without using enums. While there may not be a significant performance difference compared to using if-else statements, switch cases provide a more readable and concise way to handle multiple conditions. It is important to include a default case in these scenarios to account for any unexpected or unhandled cases.
let matchMakingTier = 115
func determinePlayerTier(from tier: Int){
    switch tier{
    case 0:
        print("Start Game")
    case 1..<50:
        print("You are tier 1")
    case 50..<150:
        print("You are tier 2")
    case 150..<300:
        print("You are tier 3")
    case 300..<1000:
        print("You are tier 4")
    case 1000...5000:
        print("You are tier 5")
    default:
        print("Error")
    }
}
determinePlayerTier(from: matchMakingTier)
