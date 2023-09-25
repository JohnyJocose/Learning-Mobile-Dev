// File: Basic_Types.playground
// Creator: Johnathan Huijon
// Date: 6/30/2023


// This file contains examples of basic data types in Swift, such as integers, floating-point numbers,
// strings, and booleans. These types are fundamental building blocks for storing and manipulating data
// in your code. Use these examples as a reference and starting point for working with basic types in Swift.

import UIKit

// Variable declaration and initialization with specific type and value.

var intValue: Int = 15

var floatValue: Float = 11.15

var doubleValue: Double = 11.15200021

var stringValue: String = "Super Cape"

var boolValue: Bool = true


// Swift can infer the variable type if not explicitly declared, based on its assigned value.
var intValueBasic = 15
var floatsAndDoublesBasic = 11.15
var stringValueBasic = "Super Cape"
var boolValueaBasic = true


// Use type(of: variableName) to determine the type of a variable. Alternatively, you can press Option and click on a variable to see its type.
print(type(of: intValue))
