// File: Functions.playground
// Creator: Johnathan Huijon
// Date: 7/5/2023

// Functions in Swift allow you to define reusable blocks of code that can be called and executed at any point in your program. They encapsulate a set of instructions and can take in input parameters and return output values. Functions provide modularity, reusability, and enhance the overall organization and structure of your code.

import UIKit

// To create a simple function without any parameters, you can use the following syntax. This function will perform a specific task or execute a set of statements when called. Keep in mind that since it doesn't have parameters, it cannot accept any inputs from the caller.
func printName(){
    print("Printing Successful")
}
printName()

// Functions with parameters allow you to accept inputs when calling the function. You can specify the number and types of parameters the function expects. If you include the "->" symbol followed by a type, it indicates that the function should return a value of that type. In such cases, you must include a return statement inside the function body to provide the desired output.
func addNumbers(firstNumber: Int, secondNumber: Int) -> Int{
    let addedValue = firstNumber + secondNumber
    return addedValue
}
print(addNumbers(firstNumber: 5, secondNumber: 5))

// By using external parameter names before the parameters, you can provide descriptive labels that make the function more readable when calling it. The external names are used as labels for each parameter, enhancing the clarity and intent of the function's purpose.
func printSentence(Groom firstTopic: String, Bride secondTopic: String){
    let sentence = firstTopic + " will marry " + secondTopic
    print(sentence)
}
printSentence(Groom: "Homer", Bride: "Marge")
