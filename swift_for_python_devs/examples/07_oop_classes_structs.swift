// Swift for Python Developers - Example 07: Object-Oriented Programming (Classes and Structs)

import Foundation // For sqrt function if needed

// Swift has two main ways to create custom data types with properties and methods:
// - Classes
// - Structures (structs)

// --- Key Differences ---
// 1. Type:
//    - Classes are REFERENCE types.
//    - Structs are VALUE types.
// 2. Inheritance:
//    - Classes support inheritance.
//    - Structs do NOT support inheritance.
// 3. Mutability:
//    - For classes (reference types), a `let` constant can have its variable properties changed.
//      The constant refers to the same instance, but the instance's state can change.
//    - For structs (value types), if a struct instance is assigned to a `let` constant,
//      none of its properties can be changed, even if they are declared as `var`.
//      This is because the constant holds the entire value.
// 4. Initializers:
//    - Structs get a free memberwise initializer if they don't define any custom initializers.
//    - Classes must have all their stored properties initialized (either with a default value or in an initializer).
//      They only get a default parameterless initializer if all properties have defaults and no custom inits are defined.
// 5. Deinitializers (`deinit`):
//    - Classes can have deinitializers to clean up resources.
//    - Structs cannot have deinitializers.

print("--- Structures (Structs) ---")
// Good for simple data structures, things that don't need inheritance,
// and when you want value semantics (copies are independent).

struct Point { // Value type
    var x: Double
    var y: Double

    // Method within a struct
    func description() -> String {
        return "Point at (x: \(x), y: \(y))"
    }

    // Methods that modify properties of a value type (struct, enum) must be marked `mutating`.
    mutating func moveBy(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
        // Alternatively: self = Point(x: self.x + deltaX, y: self.y + deltaY)
    }

    // Computed property
    var distanceFromOrigin: Double {
        // `get` is implicit for read-only computed properties
        return (x * x + y * y).squareRoot()
    }
}

// Structs get a memberwise initializer automatically if you don't define custom ones.
var p1 = Point(x: 3.0, y: 4.0)
print(p1.description()) // "Point at (x: 3.0, y: 4.0)"
print("Distance from origin for p1: \(p1.distanceFromOrigin)") // 5.0

// Value type behavior: p2 is a COPY of p1
var p2 = p1
print("p2 initially: " + p2.description())

p1.moveBy(deltaX: 1.0, deltaY: 1.0) // Modifies p1
print("p1 after move: " + p1.description())      // "Point at (x: 4.0, y: 5.0)"
print("p2 after p1 moved: " + p2.description()) // "Point at (x: 3.0, y: 4.0)" (p2 is unchanged)

// If a struct instance is a constant (`let`), its properties cannot be changed,
// even if they are variable properties (`var`) or if you call a mutating method.
let fixedPoint = Point(x: 1.0, y: 1.0)
print("Fixed point: " + fixedPoint.description())
// fixedPoint.x = 2.0 // Error: Cannot assign to property: 'fixedPoint' is a 'let' constant
// fixedPoint.moveBy(deltaX: 1.0, deltaY: 1.0) // Error: Cannot use mutating member on immutable value: 'fixedPoint' is a 'let' constant


print("\n--- Classes ---")
// Used for more complex objects, when inheritance is needed, or when reference semantics are desired.
// Python classes are always reference types.

class Vehicle { // Reference type
    var currentSpeed: Double = 0.0 // Stored property with a default value
    let numberOfWheels: Int // Stored property, must be initialized

    // Initializer (constructor)
    // Classes do not get a memberwise initializer automatically.
    // All stored properties must have a value after initialization.
    init(numberOfWheels: Int) {
        self.numberOfWheels = numberOfWheels // `self` refers to the instance
        print("Vehicle with \(numberOfWheels) wheels initialized.")
    }

    // Another initializer (overloading)
    init(numberOfWheels: Int, initialSpeed: Double) {
        self.numberOfWheels = numberOfWheels
        self.currentSpeed = initialSpeed
        print("Vehicle with \(numberOfWheels) wheels and initial speed \(initialSpeed) initialized.")
    }

    // If all properties have default values and no custom initializers are defined,
    // a default parameterless initializer `init()` is provided.
    // Example:
    // class AnotherVehicle {
    //     var name = "Default"
    // }
    // let av = AnotherVehicle() // Uses default init()

    // Computed property
    var description: String {
        return "A vehicle with \(numberOfWheels) wheels traveling at \(currentSpeed) mph."
    }

    // Method
    func accelerate(by amount: Double) {
        currentSpeed += amount
    }

    func makeNoise() {
        print("Generic vehicle noise")
    }

    // Deinitializer (like a destructor, called when instance is deallocated by ARC)
    deinit {
        print("Vehicle with \(numberOfWheels) wheels is being deinitialized.")
    }
}

// Creating an instance of a class
var car = Vehicle(numberOfWheels: 4, initialSpeed: 30.0)
print(car.description)
car.accelerate(by: 25.0)
print("Car after accelerating: " + car.description)

// Reference type behavior: anotherCarRef points to the SAME instance as car
var anotherCarRef = car
print("AnotherCarRef speed: \(anotherCarRef.currentSpeed)") // 55.0

car.accelerate(by: 10.0) // Modifies the instance `car` refers to
print("Car speed after further acceleration: \(car.currentSpeed)")           // 65.0
print("AnotherCarRef speed after car accelerated: \(anotherCarRef.currentSpeed)") // 65.0 (sees the change)

// Identity Operators (=== and !==)
// Check if two constants or variables refer to the exact same class instance.
let car2 = Vehicle(numberOfWheels: 4)
let car3 = car // car3 refers to the same instance as car

if car === car2 {
    print("car and car2 refer to the same instance.") // Not printed
} else {
    print("car and car2 refer to different instances.")
}

if car === car3 {
    print("car and car3 refer to the same instance.") // Printed
}

// `let` constant referring to a class instance:
// You can change the *variable properties* of the instance,
// but you cannot reassign the constant to refer to a *different instance*.
let myTruck = Vehicle(numberOfWheels: 18, initialSpeed: 50.0)
print("My truck: \(myTruck.description)")
myTruck.currentSpeed = 55.0 // OK: currentSpeed is a `var` property
// myTruck.numberOfWheels = 16 // Error: numberOfWheels is a `let` property
print("My truck after speed change: \(myTruck.description)")

// myTruck = Vehicle(numberOfWheels: 6) // Error: Cannot assign to value: 'myTruck' is a 'let' constant


// --- Choosing Between Classes and Structs ---
// - Use STRUCTS by default.
// - Use classes when you need Objective-C interoperability.
// - Use classes when you need to control the identity of the data you're modeling.
// - Use structs when you don't need to control identity and your data is simple,
//   or you want value-type semantics (copies are independent).
// - Data structures like Point, Size, Rectangle are good candidates for structs.
// - More complex entities that have an identity and lifecycle (e.g., Document, Person, Window)
//   are often better as classes.

// Example: A struct for a simple data bundle
struct Resolution {
    var width = 0
    var height = 0

    func area() -> Int {
        return width * height
    }
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // cinema is a COPY of hd
cinema.width = 2048
print("HD width: \(hd.width), Cinema width: \(cinema.width)") // 1920, 2048


// --- Properties ---
// Stored Properties (store constant or variable values as part of an instance)
//   - `let` for constant stored properties
//   - `var` for variable stored properties
// Computed Properties (calculate a value rather than store it)
//   - Provide a getter and an optional setter.
//   - Covered briefly in Point (distanceFromOrigin) and Vehicle (description)

// Lazy Stored Properties
// A property whose initial value is not calculated until the first time it is used.
// Must be `var`, cannot be `let`. Useful for expensive initializations.
class DataImporter {
    var filename = "data.txt"
    init() {
        // Simulate expensive setup
        print("DataImporter for \(filename) initialized (potentially expensive).")
        Thread.sleep(forTimeInterval: 0.1) // Simulate work
    }
    func importData() -> String {
        return "Data from \(filename)"
    }
}

class DataManager {
    lazy var importer = DataImporter() // Not initialized until first accessed
    var data: [String] = []

    init() {
        print("DataManager initialized.")
    }

    func loadData() {
        print("DataManager is about to load data...")
        // The `importer` is created here, the first time it's accessed
        data.append(importer.importData())
        print("Data loaded.")
    }
}
print("\n--- Lazy Stored Properties ---")
let manager = DataManager() // importer is NOT yet created
print("DataManager instance created.")
// ... some time later ...
manager.loadData() // importer is created now
// manager.importer.filename = "other_data.txt" // Accessing importer also initializes it
// manager.loadData() // importer is already created

// Property Observers (`willSet` and `didSet`)
// Observe and respond to changes in a property's value.
// Not called during initialization.
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) { // Called just BEFORE the value is stored
            print("About to set totalSteps to \(newTotalSteps) from \(totalSteps)")
        }
        didSet(oldTotalSteps) { // Called immediately AFTER the new value is stored
                                // `oldValue` is the default name for the old parameter if not specified
            if totalSteps > oldTotalSteps {
                print("Added \(totalSteps - oldTotalSteps) steps. Current total: \(totalSteps)")
            } else {
                print("totalSteps changed from \(oldTotalSteps) to \(totalSteps).")
            }
        }
    }
}
print("\n--- Property Observers ---")
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200 from 0
// Added 200 steps. Current total: 200
stepCounter.totalSteps = 360
// About to set totalSteps to 360 from 200
// Added 160 steps. Current total: 360
stepCounter.totalSteps = 300
// About to set totalSteps to 300 from 360
// totalSteps changed from 360 to 300.


// Type Properties (static properties)
// Properties that belong to the type itself, not to any one instance.
// Use `static` keyword. For computed type properties in classes, you can use `class` to allow overriding.
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
class SomeClass {
    static var storedTypeProperty = "Another value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int { // `class` allows subclasses to override
        return 42
    }
}
print("\n--- Type Properties ---")
print(SomeStructure.storedTypeProperty) // "Some value."
SomeStructure.storedTypeProperty = "A new value."
print(SomeStructure.storedTypeProperty) // "A new value."
print(SomeClass.overrideableComputedTypeProperty) // 42

// Methods (Instance Methods and Type Methods) are covered in more detail in a separate example,
// but `description()` and `accelerate()` above are instance methods.
// Type methods (static methods) are also called with `static` or `class` keyword.
```
