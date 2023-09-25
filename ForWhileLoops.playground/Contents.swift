// File: ForWhileLoops.playground
// Creator: Johnathan Huijon
// Date: 7/12/2023

// This file explores the concept of for loops in Swift, which allow for repetitive execution of code based on specified conditions. It covers the syntax and usage of for loops, including iterating over ranges, arrays, and other collections. Additionally, it introduces concepts such as loop variables and nested loops. Understanding for loops is essential for implementing iterative algorithms and efficiently processing collections of data in Swift.

import UIKit

// This is a simple for loop that iterates through each item in an array and executes the code block for each item.
var marioWonderCast = ["Mario", "Luigi", "Peach", "Toad", "Daisy", "Yoshi"]
for char in marioWonderCast{
    print (char + " is a playable character in Mario Wonder")
}
// This is an advanced form of a for loop with a "where" condition. It allows you to iterate through a sequence or collection and execute the code block only for items that meet the specified condition.
for char in marioWonderCast where char == "Luigi"{
    print (char + " is pookie!!! <3")
}




// Another way to use for loops is by iterating over a range of values. In this example, the loop will execute 26 times as we start the range from zero and increment by one in each iteration.
for i in 0...25{
    print (i)
}




// In this example, the loop will execute 25 times as we start the range from zero and iterate up to 24.
for i in 0..<25{
    print (i)
}




// This will be used when your doing a for loop based on the .count of an array (same result by just doing 0.array.count-1)
// this would repeat 6 times
for i in 0..<marioWonderCast.count{
    // different ways of adding Strings together
    print ("Player " + String(i+1) + ": " + marioWonderCast[i])
    print ("Player \(String(i+1)): \(marioWonderCast[i])")
}





// For loops can be used for a variety of tasks. Here's an example of using a for loop to generate random numbers and populate an array with them.
var numArray: [Int] = []
// If we're not using the `name` variable, we can use "_" as a placeholder to indicate that we're intentionally ignoring the value and suppress any warning about unused variables.
for _ in 0..<25{
    let randomNumber = Int.random(in: 0...100)
    numArray.append(randomNumber)
}
print(numArray)





// In this for loop, we're adding values to the same variable using the "+=" operator. This is a shorthand way to accumulate values in a variable, and it can also be used with numbers for arithmetic operations.
var wordsArray = ["This", "is", "a", "sentence!"]
var sentence = ""
for word in wordsArray{
    sentence += "\(word) "
}
print (sentence)





// This example demonstrates how to use a for loop to iterate through a dictionary. By using the "for (key, value) in dictionary" syntax, we can access each key-value pair in the dictionary and perform operations or access their values as needed.
var colorMarioDict = [
    "Red": "Mario",
    "Green": "Luigi",
    "Pink": "Peach",
    "Yellow": "Toad",
    "Orange": "Daisy",
    "Blue": "Yoshi"
]
for (color,player) in colorMarioDict{
    print ("\(player) is the color \(color)")
}





// While loops function similarly to for loops, but they continue iterating until a certain condition is met. In this example, the loop will continue until the value of X is greater than a specified number, at which point the loop will stop executing.
var num: Int = 0
while !(num > 25){
    num += Int.random(in: 0...3)
    print(num)
}
// While loops should be used with caution, as writing the wrong condition for termination can lead to runtime errors. It's important to carefully consider the condition that will end the loop to ensure it behaves as intended.






// Heres an example of nested loops
// outer loop
for week in 1...2 {
  print("Week: \(week)")

// inner loop
    for day in 1...7 {
      print("  Day:  \(day)")
  
   }
   print("")
}

// Similarly, in the case of nested loops, this showcases the application of `continue`, which skips iterations within the loop.
// outer loop
for week in 1...2 {
  print("Week: \(week)")

  // inner loop
  for day in 1...7 {

    // use of continue statement
    if(day % 2 != 0) {
      continue
      }

   print("  Day:  \(day)")
   }

  print("")
}
