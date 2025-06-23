// Swift for Python Developers - Example 09: OOP (Inheritance, Protocols, Extensions)

// --- Inheritance ---
// A class can inherit methods, properties, and other characteristics from another class (superclass).
// The inheriting class is the subclass. Structs do not support inheritance.
// Python: class Subclass(Superclass):

print("--- Inheritance ---")
class Vehicle {
    var currentSpeed = 0.0
    var description: String { // Read-only computed property
        return "traveling at \(currentSpeed) miles per hour"
    }

    func makeNoise() {
        // Do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print("Vehicle: Generic noise (superclass)")
    }

    init() {
        print("Vehicle (superclass) initialized.")
    }

    // Final methods/properties/subscripts cannot be overridden. `final class` cannot be subclassed.
    final func reportSpeed() {
        print("Current speed reported: \(currentSpeed) mph")
    }
}

class Bicycle: Vehicle { // Bicycle inherits from Vehicle
    var hasBasket = false // New stored property specific to Bicycle

    // Subclasses do not inherit superclass initializers by default (with some exceptions).
    // They must provide their own or rely on inherited ones if safe.
    // If a subclass doesn't define any designated initializers, it automatically inherits
    // all of its superclass designated initializers if certain conditions are met.
    // (Basically, if all new properties have defaults). Here, hasBasket has no default.

    override init() { // Must override if superclass has a matching init we want to use/change
        // Initialize subclass properties first (if any that need it here)
        super.init() // Call superclass initializer
        print("Bicycle (subclass) initialized.")
    }

    init(hasBasket: Bool) {
        self.hasBasket = hasBasket
        super.init() // Always call super.init() from a designated initializer (if superclass has one)
        print("Bicycle (subclass) with basket option initialized.")
    }


    // Overriding a method (must use `override` keyword)
    override func makeNoise() {
        print("Bicycle: Ring ring!")
    }

    // Cannot override a final method from superclass
    // override func reportSpeed() { ... } // Error: Instance method overrides a 'final' instance method
}

let someVehicle = Vehicle()
print("Some Vehicle: \(someVehicle.description)")
someVehicle.makeNoise()

let myBicycle = Bicycle(hasBasket: true)
myBicycle.currentSpeed = 15.0
print("My Bicycle: \(myBicycle.description)") // Accesses inherited `description`
print("My Bicycle has basket: \(myBicycle.hasBasket)")
myBicycle.makeNoise() // Calls overridden `makeNoise`
myBicycle.reportSpeed() // Calls final method from superclass

// Accessing Superclass Members (`super.`)
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0

    override init() { // Overriding Bicycle's init()
        super.init(hasBasket: true) // Call superclass (Bicycle) initializer
        self.currentNumberOfPassengers = 1 // Default for a tandem
        print("Tandem (subclass of Bicycle) initialized.")
    }

    init(passengers: Int, basket: Bool) {
        self.currentNumberOfPassengers = passengers
        super.init(hasBasket: basket) // Call superclass (Bicycle) initializer
        print("Tandem (subclass of Bicycle) with passengers/basket option initialized.")
    }

    override func makeNoise() {
        super.makeNoise() // Call superclass (Bicycle's) makeNoise
        print("Tandem: ...and a gentle whoosh.")
    }

    override var description: String { // Overriding a computed property
        return super.description + ", with \(currentNumberOfPassengers) passenger(s)"
    }
}

let myTandem = Tandem(passengers: 2, basket: false)
myTandem.currentSpeed = 12.0
print("My Tandem: \(myTandem.description)")
myTandem.makeNoise()


// --- Protocols (Like Interfaces or Abstract Base Classes in Python) ---
// Define a blueprint of methods, properties, and other requirements.
// Classes, structs, or enums can then *conform* to the protocol.
// Python: from abc import ABC, abstractmethod
print("\n--- Protocols ---")

protocol Named { // Protocol names usually end in -able, -ible, or -ing, or describe the role.
    var name: String { get } // A gettable property requirement
    // For a settable property: { get set }
    func identify() -> String // Method requirement
}

protocol Aged {
    var age: Int { get set }
}

// Conforming to a protocol
struct Person: Named, Aged { // Can conform to multiple protocols
    var name: String // Implementation of `name` property from Named
    var age: Int     // Implementation of `age` property from Aged

    func identify() -> String { // Implementation of `identify` method from Named
        return "I am a person named \(name), age \(age)."
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Dog: Named { // Classes can also conform
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }

    func identify() -> String {
        return "I am a \(breed) dog named \(name)."
    }
}

var john = Person(name: "John Doe", age: 30)
let buddy = Dog(name: "Buddy", breed: "Golden Retriever")

print(john.identify())
print(buddy.identify())

john.age += 1 // `age` is settable

// Using protocol as a type (Polymorphism)
var somethingNamed: Named // Can hold any instance that conforms to Named
somethingNamed = john
print("Something named (Person): \(somethingNamed.identify())")
// print(somethingNamed.age) // Error: 'somethingNamed' is of type 'Named', which doesn't have 'age'

somethingNamed = buddy
print("Something named (Dog): \(somethingNamed.identify())")

// Collections of protocol types
let identifiableThings: [Named] = [john, buddy]
for thing in identifiableThings {
    print("From collection: \(thing.identify())")
    if let person = thing as? Person { // Type casting to check specific type
        print("   (This one is a person, age: \(person.age))")
    }
}

// Protocol requirements can include type properties and type methods (static)
protocol Togglable {
    mutating func toggle() // `mutating` for value types (structs, enums)
    static var description: String { get }
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off: self = .on
        case .on:  self = .off
        }
        print("Switch toggled to \(self).")
    }
    static var description: String {
        return "A switch that can be toggled between on and off."
    }
}
print(OnOffSwitch.description)
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle() // on
lightSwitch.toggle() // off

// Protocol Inheritance
// A protocol can inherit from one or more other protocols.
protocol PrettyTextRepresentable: CustomStringConvertible, CustomDebugStringConvertible {
    var prettyDescription: String { get }
}
// CustomStringConvertible requires `description: String`
// CustomDebugStringConvertible requires `debugDescription: String`

struct GameObject: PrettyTextRepresentable {
    var id: Int
    var name: String

    var description: String { // For CustomStringConvertible
        return "GameObject ID: \(id)"
    }
    var debugDescription: String { // For CustomDebugStringConvertible
        return "GameObject(id: \(id), name: \"\(name)\")"
    }
    var prettyDescription: String { // For PrettyTextRepresentable
        return "✨ \(name) (ID: \(id)) ✨"
    }
}
let playerObject = GameObject(id: 1, name: "Hero")
print(playerObject) // Uses `description` via CustomStringConvertible
print("Debug: \(String(reflecting: playerObject))") // Uses `debugDescription`
print(playerObject.prettyDescription)


// --- Extensions ---
// Add new functionality to an existing class, structure, enumeration, or protocol type.
// This includes adding computed properties, methods, initializers, subscripts,
// and conforming to protocols *after* the original type definition.
// Similar to Python's monkey-patching but more structured and type-safe.
print("\n--- Extensions ---")

// Extend built-in Double type
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }

    func squared() -> Double {
        return self * self
    }
}
let oneMeter = 1.0
print("One meter in cm: \(oneMeter.cm)") // 100.0
let distanceKm = 2.5.km
print("2.5 km is \(distanceKm) meters.") // 2500.0
print("5.0 squared is \(5.0.squared())") // 25.0

// Conforming to a protocol via an extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct GameScore { // Original struct definition
    var points: Int
    var level: Int
}
// Later, or in another file, extend GameScore to conform to TextRepresentable
extension GameScore: TextRepresentable {
    var textualDescription: String {
        return "Score: \(points) at Level \(level)"
    }
}
let currentScore = GameScore(points: 1500, level: 3)
print(currentScore.textualDescription) // "Score: 1500 at Level 3"

// Adding new initializers with extensions
// (Useful for structs to keep their automatic memberwise initializer and add custom ones)
struct Size {
    var width = 0.0, height = 0.0
}
extension Size {
    init(squareSide: Double) { // New initializer
        self.init(width: squareSide, height: squareSide) // Calls original memberwise/default init
        print("Size initialized as square via extension.")
    }
}
let defaultSize = Size() // Still works (width: 0, height: 0)
let customSize = Size(width: 10, height: 20) // Memberwise still works
let squareSize = Size(squareSide: 5.0) // New initializer from extension
print("Square size: width=\(squareSize.width), height=\(squareSize.height)")

// Adding methods with extensions
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    var isEven: Bool {
        return self % 2 == 0
    }
}
3.repetitions {
    print("Hello from Int extension!")
}
print("Is 4 even? \(4.isEven)") // true
print("Is 7 even? \(7.isEven)") // false

// Nested Types within an Extension
extension Character {
    enum Kind { // Define a nested enum Kind inside Character via extension
        case vowel, consonant, other
    }
    var kind: Kind { // Computed property using the nested enum
        switch String(self).lowercased() {
        case "a", "e", "i", "o", "u":
            return .vowel
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            return .consonant
        default:
            return .other
        }
    }
}
let charA: Character = "a"
let charB: Character = "B"
let charNum: Character = "7"
print("'\(charA)' is a \(charA.kind)") // vowel
print("'\(charB)' is a \(charB.kind)") // consonant
print("'\(charNum)' is a \(charNum.kind)") // other
```
