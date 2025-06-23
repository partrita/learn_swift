// Swift for Python Developers - Example 08: OOP (Methods and Initialization)

// --- Instance Methods ---
// Functions that are part of an instance of a class, structure, or enumeration.
// Python: methods defined within a class, taking `self` as the first argument.
print("--- Instance Methods ---")
class Counter {
    var count = 0 // Stored property

    // Instance method
    func increment() {
        count += 1 // `self.count` can also be used, `self` is implicit here
    }

    // Instance method with a parameter
    func increment(by amount: Int) {
        count += amount
    }

    // Instance method to reset
    func reset() {
        count = 0
    }

    // Instance method that returns a value
    func currentCount() -> Int {
        return count
    }
}

let counter = Counter()
print("Initial count: \(counter.currentCount())") // 0
counter.increment()
print("Count after increment: \(counter.currentCount())") // 1
counter.increment(by: 5)
print("Count after increment by 5: \(counter.currentCount())") // 6
counter.reset()
print("Count after reset: \(counter.currentCount())") // 0


// The `self` Property
// Every instance of a type has an implicit property called `self`, which is exactly
// equivalent to the instance itself.
// You use `self` to refer to the current instance within its own instance methods.
// Usually, you don't need to write `self` explicitly. Swift infers it.
// One case where `self` is needed is to distinguish between a parameter name and a property name.
struct Point {
    var x = 0.0, y = 0.0

    // Method to check if a point is to the right of another x-coordinate
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x // `self.x` refers to the instance property, `x` refers to the parameter
    }

    // Mutating method (for value types like structs and enums)
    // If a method modifies the properties of a value type, it must be marked `mutating`.
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        // self.x += deltaX // One way to modify
        // self.y += deltaY
        self = Point(x: self.x + deltaX, y: self.y + deltaY) // Another way: assign a new instance to self
    }
}

var somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line x == 1.0")
}
somePoint.moveBy(x: 2.0, y: -1.0)
print("Point moved to: (\(somePoint.x), \(somePoint.y))")


// --- Type Methods (Static Methods) ---
// Methods called on the type itself, not on an instance.
// Use `static` keyword. For classes, you can use `class` to allow subclasses to override.
// Python: methods decorated with `@staticmethod` or `@classmethod`.
print("\n--- Type Methods ---")
struct LevelTracker {
    static var highestUnlockedLevel = 1 // Stored type property
    var currentLevel = 1               // Stored instance property

    // Type method
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
            print("Level \(level) unlocked! Highest is now \(highestUnlockedLevel).")
        } else {
            print("Level \(level) was already unlocked or lower than highest (\(highestUnlockedLevel)).")
        }
    }

    // Type method that returns a Bool
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    // Instance method that uses type properties/methods
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) { // Call type method on the type itself
            if level > currentLevel {
                currentLevel = level
                print("Player advanced to level \(currentLevel).")
                return true
            } else {
                print("Player is already at or past level \(level).")
                return false
            }
        } else {
            print("Cannot advance to level \(level), it's locked. Highest unlocked: \(LevelTracker.highestUnlockedLevel).")
            return false
        }
    }
}

LevelTracker.unlock(5) // Call type method on the type
LevelTracker.unlock(3) // Already unlocked or lower
print("Is level 4 unlocked? \(LevelTracker.isUnlocked(4))") // true
print("Is level 6 unlocked? \(LevelTracker.isUnlocked(6))") // false

var player1 = LevelTracker() // currentLevel = 1, highestUnlockedLevel = 5
player1.advance(to: 3) // Advances
player1.advance(to: 6) // Fails, level 6 is locked

class SomeGameClass {
    static var gameName = "Generic Game"

    static func describeGame() {
        print("This is the \(gameName).")
    }

    // `class func` can be overridden by subclasses
    class func getGameRules() -> String {
        return "No specific rules for generic game."
    }
}
SomeGameClass.describeGame()
print(SomeGameClass.getGameRules())


// --- Initialization (`init`) ---
// Process of preparing an instance of a class, structure, or enumeration for use.
// Involves setting initial values for stored properties.
// Python: `__init__` method.
print("\n--- Initialization ---")

struct Celsius {
    var temperatureInCelsius: Double
    // Initializer
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
        print("Initialized Celsius from Fahrenheit: \(temperatureInCelsius)°C")
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
        print("Initialized Celsius from Kelvin: \(temperatureInCelsius)°C")
    }
    // If you define any custom init, the automatic memberwise init (for structs) is lost,
    // unless all properties have default values.
    // To keep it, you can define custom inits in an extension, or re-define it.
    init(_ celsius: Double) { // Parameter label can be omitted with `_`
        self.temperatureInCelsius = celsius
        print("Initialized Celsius directly: \(temperatureInCelsius)°C")
    }
}
let boilingPoint = Celsius(fromFahrenheit: 212.0) // Calls init(fromFahrenheit:)
let freezingPoint = Celsius(fromKelvin: 273.15)    // Calls init(fromKelvin:)
let bodyTemperature = Celsius(37.0)                // Calls init(_:)

// Default Property Values
// You can set a default value for a stored property as part of its definition.
class ShoppingListItem {
    var name: String? // Optional String, defaults to nil
    var quantity = 1  // Defaults to 1
    var purchased = false // Defaults to false

    // If all properties have default values, a default parameterless initializer is synthesized
    // (unless you define other initializers).
    // init() {} // This is implicitly available if no other inits are here.

    // Custom initializer
    init(name: String, quantity: Int = 1, purchased: Bool = false) { // Default parameter values in init
        self.name = name
        self.quantity = quantity
        self.purchased = purchased
        print("ShoppingListItem '\(name)' initialized.")
    }
}
var item1 = ShoppingListItem(name: "Eggs", quantity: 12)
var item2 = ShoppingListItem(name: "Milk") // Uses default quantity (1) and purchased (false)
// var item3 = ShoppingListItem() // Error if the custom init above is defined, as it removes the default init().
                               // To have both, you'd need to provide init() explicitly or put custom inits in an extension.

// Memberwise Initializers for Structure Types
// Structure types automatically receive a memberwise initializer if they don't define any of their own.
struct Size {
    var width = 0.0, height = 0.0 // With default values
}
let zeroSize = Size() // Uses synthesized init() -> width=0.0, height=0.0
let customSize = Size(width: 10.0, height: 5.0) // Uses synthesized memberwise init

struct NoDefaultSize {
    var width: Double
    var height: Double
}
// let noDef = NoDefaultSize() // Error: missing arguments for parameters 'width', 'height'
let customNoDef = NoDefaultSize(width: 3.0, height: 4.0) // Memberwise init is available


// Initializer Delegation for Value Types (Structs, Enums)
// Initializers can call other initializers from the same type (`self.init`).
// Useful to avoid code duplication.
struct Rect {
    var origin = Point() // Default Point(x:0,y:0)
    var size = Size()    // Default Size(width:0,height:0)

    init() {} // Parameterless initializer

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        // Calls another initializer of the same type (delegation)
        self.init(origin: Point(x: originX, y: originY), size: size)
        print("Rect initialized with center.")
    }
}
let basicRect = Rect()
let originRect = Rect(origin: Point(x: 1.0, y: 1.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 2.5, y: 2.5), size: Size(width: 3.0, height: 3.0))
print("CenterRect origin: (\(centerRect.origin.x), \(centerRect.origin.y))")


// Class Initialization (Designated, Convenience, Inheritance) - More complex, covered in inheritance example.
// Briefly:
// - Designated initializers: Primary initializers. Fully initialize all properties of the class
//   and call an appropriate superclass initializer.
// - Convenience initializers: Secondary. Must call another initializer from the same class (`self.init`).
//   Marked with `convenience` keyword. Eventually, a designated initializer must be called.

class Food {
    var name: String
    // Designated Initializer
    init(name: String) {
        self.name = name
        print("Food '\(name)' designated init.")
    }
    // Convenience Initializer
    convenience init() {
        self.init(name: "[Unnamed Food]") // Calls the designated init of Food
        print("Food convenience init called.")
    }
}
let mysteryMeat = Food() // Calls convenience, which calls designated
let apple = Food(name: "Apple") // Calls designated


// Failable Initializers (`init?` or `init!`)
// Initialization can fail (return `nil`).
// Useful when initialization depends on external data or conditions.
print("\n--- Failable Initializers ---")
struct Animal {
    let species: String
    init?(species: String) { // Failable: returns Animal?
        if species.isEmpty {
            print("Species cannot be empty. Initialization failed.")
            return nil // Indicate failure
        }
        self.species = species
        print("Animal initialized with species: \(species).")
    }
}
let someCreature = Animal(species: "Giraffe") // someCreature is of type Animal?
if let giraffe = someCreature {
    print("Successfully created a \(giraffe.species).")
}

let anonymousCreature = Animal(species: "") // Returns nil
if anonymousCreature == nil {
    print("Failed to create anonymous creature.")
}

// Example: Failable init for numeric type conversion
struct Product {
    let id: String
    let stock: Int

    init?(id: String, stockString: String) {
        self.id = id
        guard let stockCount = Int(stockString), stockCount >= 0 else {
            print("Invalid stock string '\(stockString)' or negative stock. Product init failed for ID \(id).")
            return nil // Conversion to Int failed or stock is negative
        }
        self.stock = stockCount
        print("Product \(id) initialized with stock \(stock).")
    }
}
let book = Product(id: "123", stockString: "10") // Valid
let toy = Product(id: "456", stockString: "five") // Fails, stockString not Int
let gadget = Product(id: "789", stockString: "-2") // Fails, stock is negative

// Required Initializers (`required init`)
// Indicate that every subclass of a class must implement that initializer.
// Add `required` before the definition of a class initializer.
class BaseClass {
    var id: Int
    required init(id: Int) { // All subclasses MUST implement this (or inherit it if it meets criteria)
        self.id = id
        print("BaseClass required init with id: \(id)")
    }
}
class SubClass: BaseClass {
    var name: String
    // Subclass must also mark its implementation of the required init with `required`.
    // It doesn't need `override` if it's directly implementing a required init.
    required init(id: Int) {
        self.name = "Default Name" // Initialize subclass properties first
        super.init(id: id) // Call superclass's designated/required init
        print("SubClass required init with id: \(id)")
    }
    // Can have other initializers too
    init(id: Int, name: String) {
        self.name = name
        super.init(id: id) // Call superclass's designated/required init
        print("SubClass custom init with id: \(id), name: \(name)")
    }
}
let subInstance1 = SubClass(id: 101)
let subInstance2 = SubClass(id: 102, name: "MySubInstance")


// Setting a Default Property Value with a Closure or Function
// If a stored property’s default value requires some setup or customization.
class SomeManager {
    // let defaultSettings: [String: Any] = { // Error: Cannot find 'self' in scope if closure uses self
    //     // Complex setup for defaultSettings
    //     var settings: [String: Any] = [:]
    //     settings["volume"] = 11
    //     settings["darkMode"] = true
    //     // If this closure needed to access `self` or other instance properties, it wouldn't work here directly.
    //     // For that, use a lazy var or initialize in `init`.
    //     return settings
    // }() // The parentheses `()` at the end cause the closure to be executed immediately.

    // Simpler example not needing self:
    let uniqueID: String = {
        // Imagine some logic to generate a unique ID
        return "ID_\(Int.random(in: 1000...9999))"
    }() // Executed once when an instance is created

    var configuration: String

    init(config: String = "Default Config") {
        self.configuration = config
        print("SomeManager initialized with ID: \(uniqueID), Config: \(configuration)")
    }
}
let manager1 = SomeManager()
let manager2 = SomeManager(config: "Custom Setup")
print("Manager1 ID: \(manager1.uniqueID), Manager2 ID: \(manager2.uniqueID)") // IDs will be different


// Deinitialization (`deinit`) - For classes only.
// Called just before a class instance is deallocated by ARC to free up memory.
// Used to perform any custom cleanup.
// Python: `__del__` (less deterministic).
print("\n--- Deinitialization ---")
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(_ numberOfCoinsToVend: Int) -> Int {
        let n = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= n
        return n
    }
    static func receiveCoins(_ coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    let name: String

    init(name: String, coins: Int) {
        self.name = name
        self.coinsInPurse = Bank.vendCoins(coins)
        print("Player \(name) initialized with \(coinsInPurse) coins.")
    }

    func winCoins(_ coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
        print("Player \(name) won \(coins) coins, now has \(coinsInPurse).")
    }

    deinit { // No parentheses for deinit
        Bank.receiveCoins(coinsInPurse)
        print("Player \(name) deinitialized. Returned \(coinsInPurse) coins to the bank. Bank now has \(Bank.coinsInBank) coins.")
    }
}

var playerOne: Player? = Player(name: "Alice", coins: 100)
print("Bank has \(Bank.coinsInBank) coins.") // 9900

if var p = playerOne {
    p.winCoins(2000)
}
// playerOne is still alive here if the above was `if let p = playerOne` due to scope.
// Using `if var p = playerOne` creates a mutable copy of the optional, not a strong reference to the original `playerOne` binding.
// Let's re-do to show deinit more clearly.

var playerTwo: Player? = Player(name: "Bob", coins: 50) // Bank has 9900 - 50 = 9850
playerOne = nil // Deinitializes Alice's Player instance if it exists
// Output: Player Alice deinitialized. Returned 100 coins to the bank. Bank now has 9950 coins. (Assuming Alice had 100)

print("Setting playerTwo to nil...")
playerTwo = nil // Deinitializes Bob's Player instance
// Output: Player Bob deinitialized. Returned 50 coins to the bank. Bank now has 10000 coins.
```
