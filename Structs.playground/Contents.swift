// File: Structs.playground
// Creator: Johnathan Huijon
// Date: 7/15/2023


// Structs in Swift are lightweight data structures that allow you to encapsulate related properties and behaviors. They are value types, meaning they are copied when assigned to a new variable or passed as a function argument. Structs are ideal for representing simple data models, organizing code, and ensuring immutability when needed.

// In this file, we will explore how to define and use structs in Swift. We will cover declaring properties, initializing instances, defining methods. Structs provide a powerful tool for organizing and modeling your data in a clear and efficient manner.

import UIKit

// Structs in Swift are similar to classes in their structure but are defined using the keyword "struct" instead. Unlike classes, structs do not require an initializer method (init) since they have an automatically generated memberwise initializer.
struct GameCharacter {
    var Name: String
    var HP: Int
    var Atk: Int
    var Def: Int
    var Ability: String?
    var AbilityDescription: String?
    
    // Structs in Swift can also have functions defined within them, just like classes. These functions can perform operations and computations based on the struct's properties.
    func printStats(){
        print("\(Name)'s Stats")
        print("HP: \(HP)")
        print("Atk: \(Atk)")
        print("Def: \(Def)")
        if let ability = Ability{
            print ("Ability: \(ability)")
        }
        if let abilityDesc = AbilityDescription{
            print("Ability's Description: \(abilityDesc)")
        }
    }
}

var byleth = GameCharacter(Name: "Byleth", HP: 100, Atk: 99, Def: 98)
byleth.printStats()
// When we create a copy of a struct variable, it creates an entirely new instance with its own set of values. Any changes made to one copy of the struct will not affect the other copies. This is different from classes, where changes to one instance can impact other instances due to reference semantics.
var edelgard = byleth
edelgard.Name = "Edelgard"
print("See how the name in the edelgard varible is \"\(edelgard.Name)\" and the byleth variable's name is still \"\(byleth.Name)\"")

