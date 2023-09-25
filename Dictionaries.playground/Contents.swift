// File: Dictionaries.playground
// Creator: Johnathan Huijon
// Date: 7/5/2023


// Dictionaries in Swift provide a powerful way to store and retrieve data using key-value pairs. They allow you to associate values with unique keys and efficiently access those values. This file explores the syntax and functionality of dictionaries, covering topics such as adding and accessing elements, updating values, checking for key existence, and more. Dive into the world of dictionaries to unleash the full potential of organizing and managing your data in Swift.

import UIKit

// [Keys: Values]
// This is the syntax for creating a dictionary in Swift. You can define a dictionary using square brackets and provide key-value pairs, separated by a colon. The keys and values can be of any valid Swift type, allowing you to store and retrieve data in a structured manner.
var idsNamesDict: [Int: String] = [
    1: "Karina",
    15: "Dale",
    69: "Claude",
    54562: "Johnathan Huijon"
]

// When declaring an empty dictionary, it's important to specify the types of the keys and values. This allows you to define the structure of the dictionary and ensure type safety. There are various ways to declare an empty dictionary in Swift, but all of them involve specifying the key and value types explicitly.
var emptyDict1 = [String: String]()
var emptyDict2: [String: String] = [:]
var emptyDict3 = Dictionary<String, String>()


// In dictionaries, you can retrieve the value associated with a specific key by using the syntax Dict[key]. This operation has constant time complexity, making it efficient for performance.
print (idsNamesDict[54562]!)

// Adding elements to a dictionary can be done by assigning a value to a specific key. By using the subscript notation, you can assign a value to a key, effectively adding it to the dictionary.
idsNamesDict[54561] = "Berenice Huijon"
print (idsNamesDict[54561]!)

// Updating the value of a specific key in a dictionary can be done by assigning a new value to that key. By using the subscript notation and specifying the key, you can update the value associated with that key in the dictionary.
idsNamesDict[1] = "Karen"
print (idsNamesDict[1]!)

// This code snippet determines whether the dictionary contains a specific key. If the key exists, the corresponding value can be accessed using subscripting. If the key doesn't exist, the value will be nil.
let keyExists = idsNamesDict[1] != nil

// To access the value associated with a specific key in the dictionary, use subscripting with the key. Make sure to ensure the key exists in the dictionary before accessing it to avoid runtime errors.
let value = idsNamesDict[1]!
