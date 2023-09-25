// File: Classes.playground
// Creator: Johnathan Huijon
// Date: 7/15/2023

// Classes are a fundamental concept in object-oriented programming. They allow you to define custom data types that can have properties and methods. In this file, we will explore the concept of classes in Swift and learn how to create and use them. Classes provide a blueprint for creating objects, encapsulating data and behavior, and enabling code reusability. We will cover topics such as class declaration, instance properties, methods, inheritance, and more. By understanding classes, you will have the foundation to build complex and modular applications in Swift.


import UIKit

// This is the basic syntax to define a class in Swift.
class GameCharacterRegular {
    // Declare the properties (variables) that you will be using within your class.
    var Name: String
    var HP: Int
    var Atk: Int
    var Def: Int
    var Ability: String
    var AbilityDescription: String
    
    // Initialize the properties by providing an initializer (init) method. You can also use parameter names before the property names to make them more descriptive when calling the class. Within the initializer, assign the values of the passed parameters to the corresponding properties using `self.propertyName`.
    // The parameter names in the initializer can be chosen as per your preference, but ensure that all the properties are assigned values from the passed parameters.
    init(name: String, hp: Int, atk: Int, def: Int, ability: String, abilityDescription: String){
        self.Name = name
        self.HP = hp
        self.Atk = atk
        self.Def = def
        self.Ability = ability
        self.AbilityDescription = abilityDescription
    }
    
    // We can create functions within these classes that can be called and will perform a specific method.
    func printName(){
        print(Name)
    }
}

// To create an instance of the class, assign it to a variable and initialize it by providing the required information based on the declared properties in the initializer.
var sigurd = GameCharacterRegular(name: "Sigurd", hp: 10, atk: 5, def: 5, ability: "Canto", abilityDescription: "Can move 2 spaces after turn")

// To access the information of a created instance of the class, use the variable name followed by a dot and the name of one of the stored properties.
sigurd.Ability
sigurd.AbilityDescription

// Here's an example of calling one of the functions created in the class.
sigurd.printName()





// In some cases, we may want to provide an empty version of the initializer. Here's an example of how to create an empty initializer for a class.
class GameCharacterNoInit {
    var Name: String?
    var HP: Int?
    var Atk: Int?
    var Def: Int?
    var Ability: String?
    var AbilityDescription: String?
    
    init() {}
}


var bramimond = GameCharacterNoInit()
// If we check the properties at this point, we will see that they are nil.
bramimond.Ability
bramimond.HP

// having an mepty init means at any point of time we can asign these properties at any time
bramimond.Name = "Bramimond"
bramimond.Ability = "Mimic"
bramimond.HP = 99
print("\(bramimond.Name!)'s ability is \(bramimond.Ability!) and they have \(bramimond.HP!) Hp")







// Here's an example of creating a class where some of the declared properties can be optional if desired. This allows flexibility in initializing objects of this class.
class GameCharacterOptionalInit {
    var Name: String?
    var HP: Int
    var Atk: Int
    var Def: Int
    var Ability: String?
    var AbilityDescription: String?
    
    
    init(Name: String?, HP: Int, Atk: Int, Def: Int, Ability: String?, AbilityDescription: String?){
        self.Name = Name
        self.HP = HP
        self.Atk = Atk
        self.Def = Def
        self.Ability = Ability
        self.AbilityDescription = AbilityDescription
    }
    
    func printName(){
        print(Name!)
    }
}

// Because we made `name`, `ability`, and `abilityDescription` optional, when we create the variable for this class, we have the option to assign `nil` instead of providing a value for those properties.
var eliwood = GameCharacterOptionalInit(Name: nil, HP: 15, Atk: 7, Def: 8, Ability: nil, AbilityDescription: nil)
eliwood.Name
eliwood.HP


// Lastly, here's an example of how to omit some variables when calling the class. This can be useful when we don't need to provide a value for all the declared properties, allowing for more concise code.
class GameCharacterOmit {
    var Name: String
    var HP: Int
    var Atk: Int
    var Def: Int
    var Ability: String?
    var AbilityDescription: String?
    
    // In this example, the properties "Name", "Ability", and "AbilityDescription" can be omitted when calling the class because they have default values. When we call the class, these properties will appear grayed out, and we can hold down the "Option" key to make them visible. Note that "Name" is not declared as an optional because it always defaults to "NPC", while "Ability" and "AbilityDescription" have optional values and can be omitted, resulting in nil.
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

// In this example, "enemyTroop" was created without the need to specify the omitted variable. The omitted variable will default to its declared value or nil if no value is provided.
var enemyTroop = GameCharacterOmit(HP: 10, Atk: 20, Def: 30)
enemyTroop.printStats()
// In the "claude" variable, all the variables in the class except one have been specified. The unspecified variable will take its default value or be nil if no value is provided.
var claude = GameCharacterOmit(Name: "Claude", HP: 100, Atk: 40, Def: 40, Ability: "Fallen Star")
claude.printStats()


