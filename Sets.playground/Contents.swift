// File: Sets.playground
// Creator: Johnathan Huijon
// Date: 7/5/2023

// Sets in Swift are an unordered collection of unique values. They provide a way to store and operate on a collection of distinct elements. Unlike arrays, sets do not have a defined order, and each element can only appear once. Sets are useful when you need to perform membership tests or eliminate duplicate elements from a collection.
import UIKit

// You can create a set by converting an existing array into a set.
var listType: [Int] = [1, 15, 13, 99, 100, 987, 16, 69, 69, 1]
var listSet = Set(listType)


// You can create a set directly without converting from an existing array.
var newListType: Set<Int> = [1, 15, 13, 99, 100, 987, 16, 69, 69, 1]
// You can create an empty set by declaring its type and initializing it with empty square brackets "[]" similar to arrays.
var emptyListSet: Set<Int> = []

// The ".contains" method can be used to check if an item is present in a set. This operation has excellent performance thanks to the use of hashable elements.
listSet.contains(15)
// The ".insert" method allows you to add an element to the set.
listSet.insert(5)

