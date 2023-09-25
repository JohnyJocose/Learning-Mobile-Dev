// File: Arrays.playground
// Creator: Johnathan Huijon
// Date: 6/30/2023

// This file dives into the concept of arrays in Swift, which allow for organizing and storing multiple related values in a single collection. Arrays provide a powerful tool for working with lists of data, enabling operations such as appending, accessing, modifying, and iterating over elements. Understanding how to leverage arrays effectively enhances the functionality and efficiency of your code, opening doors to a wide range of data manipulation and processing tasks.

import UIKit

// This is how you can create a list using arrays.
// You can either declare the type of the list or let Swift infer it.
var list = [1, 15, 13, 99, 100, 987, 16, 69]
var listType: [Int] = [1, 15, 13, 99, 100, 987, 16, 69]

// This is how you create an empty list using arrays.
// You must declare the type that the list will be!
var emptyList: [Int] = []

// Subscripting with `array[I]` allows you to access the item in the list corresponding to the index number `I`. This convenient feature is called subscripting, enabling easy retrieval of specific elements from the array based on their index.
var getNum = list[0]

// The `.count` property returns the number of items in an array as an integer.
print("The count of the array is " + String(list.count))

// The `.first` property returns the first item in an array. Similarly, there is a `.last` property that returns the last item in the array.
print("The the first number of the array is " + String(list.first!))

// The `.isEmpty` property returns a boolean value indicating whether or not the array is empty. It returns `true` if the array has no elements, and `false` otherwise.
print("The array is empty so it should return true: " + String(emptyList.isEmpty))

// The `.append` method allows you to add an element to the end of the array. It modifies the array by adding the specified element as the last item in the list.
list.append(21)
print("21 should be added at the end: ", list)

// Using the `.insert(object, index)` method, you can insert an item into an array at a specific index of your choice. This allows you to precisely position an object within the array by specifying the desired index where it should be inserted.
list.insert(420, at: 1)

// The `.sort()` method is used to sort the elements in an array in ascending order. When called on an array, it rearranges the elements in a way that they are sorted from smallest to largest, based on their inherent comparison rules. This can be useful when you want to organize the items in your array in a specific order.
list.sort()

// The `.reverse()` method is used to reverse the order of elements in an array. When called on an array, it rearranges the elements so that the last element becomes the first, the second-to-last element becomes the second, and so on. This can be helpful when you want to change the order of the items in your array to be in the opposite direction.
list.reverse()

// The `.shuffle()` method can be used to randomly shuffle the elements in an array. By calling this method on an array, the order of its elements will be randomly rearranged. This can be useful when you want to introduce a sense of randomness or unpredictability to the order of items in your array.
list.shuffle()

// The `.remove(at: index)` method is used to remove an item from an array at a specific index. By providing the desired index as an argument to the method, you can remove the element located at that index from the array. This can be useful when you want to selectively remove an item from your array based on its position.
list.remove(at: 1)

// The `.removeAll` method is used to remove all elements from the array, resulting in an empty list. It provides a convenient way to clear the contents of the array.
list.removeAll()
print("The array should be empty now: ", list)

// This is a brief overview of common operations you can perform with arrays. It serves as a reference for syntax and understanding how arrays work. Feel free to refer to this guide whenever you need a quick reminder or review.


