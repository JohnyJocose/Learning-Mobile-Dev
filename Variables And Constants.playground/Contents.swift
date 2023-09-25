// File: Variables_And_Constants.playground
// Creator: Johnathan Huijon
// Date: 6/30/2023

// This file explores the use of variables and constants in Swift, utilizing the var and let keywords. Variables (var) allow for storing and modifying values that can be changed throughout the program, providing flexibility and speed. On the other hand, constants (let) are used for values that remain constant and unchangeable, optimizing performance and ensuring data integrity. Mastering the effective utilization of variables and constants contributes to faster and efficient code execution.

import UIKit

var variable = "Anything"

let constantLet = "Immutable"



// This example demonstrates how we were able to change the value using `var`.
variable = "Mutable"
print(variable)



// If we use `let` and attempt to change the variable, an error will occur.

// Uncommenting this portion of the code will result in an error.
//constantLet = "Change?"
