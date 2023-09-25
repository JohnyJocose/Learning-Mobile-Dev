// File: Optionals.playground
// Creator: Johnathan Huijon
// Date: 7/12/2023

// Optionals in Swift provide a way to represent values that may be absent or nil. This file will cover the concept of optionals, their usage, and how they help in handling situations where a value may be missing. You will learn about if lets, guards, forced unwrapping, and nil coalescing. Understanding optionals is crucial in writing robust and safe Swift code.

import UIKit

// This example demonstrates that variables can sometimes have a value of nil, indicating the absence of a value.
var emptyArray: [Int] = []
let lastNum = emptyArray.last
// We need to handle nil values in our code to ensure that it performs its intended function correctly and avoids any unexpected errors or crashes.


// if let
if let lastNum2 = emptyArray.last{
    print (lastNum2)
}
else{
    print("We got nil")
}


// nil coalescing
let lastNum3 = emptyArray.last ?? 0
print(lastNum3)


// guard statement
func getLastNum(){
    guard let lastNum4 = emptyArray.last else{ return }
    print("last num is \(lastNum4)")
    // In this code snippet, the statement inside the `guard` block will cause the function to exit early if it evaluates to false. Therefore, the subsequent code after the `guard` block will not execute if the condition is not met, and the expected output will not be printed.
}
getLastNum()


// Force unwrap
emptyArray.append(15)
let lastNum5 = emptyArray.last!
print (lastNum5)
// In this instance, we're utilizing force unwrapping, indicating to Xcode to use the value regardless of its state. It's vital to understand that using force unwrapping may result in crashes and is generally discouraged in programming practices.
// Nevertheless, there are instances where you are certain it won't be nil. For example, when dealing with images stored in image assets and using `UIImage(named: "ImageName")`, it might appear as optional. In such cases, alternative methods might be time-consuming, and the certainty of its presence makes force unwrapping viable.
