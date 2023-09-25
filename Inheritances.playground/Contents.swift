// File: Inheritances.playground
// Creator: Johnathan Huijon
// Date: 7/15/2023

// Inheritance is a fundamental concept in object-oriented programming that allows one class to inherit properties, methods, and other characteristics from another class. With inheritance, you can create a hierarchy of classes, where a derived class inherits the features of a base class.
// This file explores the concept of inheritance in Swift. It covers how to define a derived class that inherits from a base class using the colon notation. It also discusses the access levels, overriding methods and properties, and the use of the "super" keyword to refer to the superclass.
// By understanding inheritance, you can create more flexible and modular code by reusing existing functionality and organizing classes into meaningful relationships.


import UIKit

// Note: This base class is taken from the "classes.playground" file and serves as a reference for understanding class inheritance in Swift.
class GameCharacterOmit {
    var Name: String
    var HP: Int
    var Atk: Int
    var Def: Int
    var Ability: String?
    var AbilityDescription: String?
    
    init(Name: String = "NPC", HP: Int, Atk: Int, Def: Int, Ability: String? = nil, AbilityDescription: String? = nil){
        self.Name = Name
        self.HP = HP
        self.Atk = Atk
        self.Def = Def
        self.Ability = Ability
        self.AbilityDescription = AbilityDescription
    }
    
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


// To implement inheritance, create a new class using the syntax "class NewClass: PreviousClass {}". This allows the new class to inherit all the stored properties and functionality of the previous class, making them accessible when calling the new class.
class ArmyHouse: GameCharacterOmit {
    // Inheritance allows you to add new declared stored properties to the subclass, in addition to inheriting the properties from the superclass. This gives you the flexibility to extend the functionality of the class by introducing new properties specific to the subclass.
    var houseOrigin: String?
    
    // You can add new functions in the subclass to customize the behavior based on specific requirements.
    func printCharsOriginalHouse(){
        if let houseOrigin = houseOrigin{
            print ("House Orgin: \(houseOrigin)")
        }
        else{
            print ("Origins Unknown")
        }
    }
    
    // The `override` keyword allows you to modify an existing function in a parent class and customize its behavior according to your needs.
    override func printStats() {
        if let ability = Ability{
            print ("I am \(Name) and I know the special technique \(ability)!")
        }
        else{
            print ("I am \(Name)")
        }
    }
    
}

// In this example, we can observe the usage of the `override` keyword, which allows us to modify an inherited function in the subclass. Additionally, we demonstrate calling one of the newly defined functions within this subclass.
var hilda = ArmyHouse(Name: "Hilda", HP: 70, Atk: 80, Def: 20, Ability: "Lazy")
hilda.printStats()
hilda.houseOrigin = "Golden Deer"
hilda.printCharsOriginalHouse()
