// File: ifElse_And_Operators.playground
// Creator: Johnathan Huijon
// Date: 7/5/2023


// If/else statements are fundamental control flow structures in programming. They allow you to make decisions and execute different blocks of code based on specified conditions. With if/else statements, you can create branching logic to handle different scenarios and control the flow of your program. This file covers the syntax and usage of if/else statements in Swift, demonstrating how to perform conditional checks and execute specific code blocks based on the evaluation of the conditions.


import UIKit

// Simple if statements checking equality of a variable with a string.
var crazy = "delulu"
if crazy == "delulu"{
    print ("I am a crazy person")
}

// If-else statement checking the condition of a boolean variable. Since it evaluates to false, it will execute the else portion of the statement.
var boyfriendResponded = false
if boyfriendResponded{
    print ("I am not delulu")
}
else{
    print ("I just dont get it? Is it because shes pretty? Is it because she smokes and i dont? What could a weeek have on three years? NOTHING, Shes just NEW?! I CANT SAY WHAT ELSE BECAUSE THATS NOT NICE! IM TRYING TO WORK ON HAVING A KIND HEART")
}


// This portion demonstrates the usage of multiple "else" statements. Each "else" is associated with an "if" condition. If none of the "if" conditions are met, the final "else" block will be executed.
var num = 15

if num >= 115{
    print ("number is greater than 115")
}
else if num >= 100{
    print ("number is greater than 100")
}
else if num >= 50{
    print ("number is greater than 50")
}
else{
    print ("number is less than 50")
}



// Comparison Operators

// Swift supports the following comparison operators:

// Equal to (a == b)
1 == 1   // true because 1 is equal to 1
// Not equal to (a != b)
2 != 1   // true because 2 isn't equal to 1
// Greater than (a > b)
2 > 1    // true because 2 is greater than 1
// Less than (a < b)
1 < 2    // true because 1 is less than 2
// Greater than or equal to (a >= b)
1 >= 1   // true because 1 is greater than or equal to 1
// Less than or equal to (a <= b)
2 <= 1   // false because 2 isn't less than or equal to 1




// Logical Operators

// Logical operators modify or combine the Boolean logic values true and false. Swift supports the three standard logical operators found in C-based languages:


// Logical NOT (!a)
let safeUnlocked = false
if !safeUnlocked{
    print ("Please unlock the safe!")
}
// Logical AND (a && b)
let tvOn = true
let videoGameOn = false
if tvOn && videoGameOn{
    print ("Everything is ready for you to start playing!")
}
else{
    print ("Please make sure both your TV and System are on!")
    // Prints this outcome ^
}
// Logical OR (a || b)
let faceId = false
let passCode = true
if faceId || passCode{
    print ("Phone is now unlocked")
    // Prints this outcome
}
else{
    print ("unlock phone with either faceId or entering your passcode")
}
// Combining multiple operators
if (tvOn && videoGameOn) || safeUnlocked || passCode{
    print ("something came out true")
    // prints this outcome because passcode was true
}
else {
    print ("none of the conditions were met")
}


