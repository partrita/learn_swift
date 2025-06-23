// Swift for Python Developers - Example 01: Variables and Constants

// --- Constants ---
// In Python, constants are often a convention (e.g., uppercase variables).
// In Swift, `let` creates a true constant - its value cannot be changed after assignment.
let maxLoginAttempts = 10
// maxLoginAttempts = 5 // This would cause a compile-time error: "Cannot assign to value: 'maxLoginAttempts' is a 'let' constant"

let welcomeMessage = "Hello, Swift!"
print(welcomeMessage)

// --- Variables ---
// In Python, all variables can be reassigned.
// In Swift, `var` creates a mutable variable.
var currentLoginAttempts = 0
print("Initial attempts: \(currentLoginAttempts)")

currentLoginAttempts = 1
print("Attempts after one try: \(currentLoginAttempts)")

currentLoginAttempts += 1 // Swift doesn't have ++ or -- operators, use += or -=
print("Attempts after another try: \(currentLoginAttempts)")


// --- Type Inference ---
// Python is dynamically typed, types are checked at runtime.
// Swift is statically typed, but often infers the type from the initial value.

let implicitInteger = 70      // Inferred as Int
let implicitDouble = 70.0     // Inferred as Double
let implicitBoolean = true    // Inferred as Bool
let implicitString = "Test"   // Inferred as String

print("Type of implicitInteger: \(type(of: implicitInteger))")
print("Type of implicitDouble: \(type(of: implicitDouble))")


// --- Explicit Type Annotation ---
// Sometimes you need to be explicit, especially if a variable isn't initialized
// or if you want a specific type (e.g., Float instead of Double).

var explicitFloat: Float = 3.14159 // Explicitly Float
var explicitDouble: Double = 3.1415926535 // Explicitly Double

var environmentName: String // Declared but not initialized
environmentName = "Development" // Initialized later
print("Environment: \(environmentName)")

// let serverResponseCode: Int // Error: 'let' constants must be initialized before use
let serverResponseCode: Int = 200 // Correct
print("Server response: \(serverResponseCode)")


// --- Type Safety ---
// Swift is type-safe. You can't assign a value of one type to a variable of another incompatible type.
var myNumber: Int = 100
// myNumber = "One hundred" // Compile-time error: Cannot assign value of type 'String' to type 'Int'

// You need explicit type conversion:
let label = "The width is "
let width = 94
let widthLabel = label + String(width) // Convert Int to String for concatenation
print(widthLabel)

// String interpolation is often cleaner:
let anotherWidthLabel = "The width is \(width)"
print(anotherWidthLabel)

let piValue = 3.14
// let integerPi: Int = piValue // Error: Cannot convert Double to Int implicitly
let integerPi: Int = Int(piValue) // Explicit conversion (truncates)
print("Integer Pi: \(integerPi)")


// --- Naming Conventions ---
// Swift uses camelCase for variables and constants (e.g., `myVariableName`).
// This is different from Python's snake_case (e.g., `my_variable_name`).
let httpStatusCode = 404
var userName = "swift_learner"

print("Status: \(httpStatusCode), User: \(userName)")

// Multiple variables can be declared on a single line, separated by commas.
var x = 0.0, y = 0.0, z = 0.0
print("Coordinates: (\(x), \(y), \(z))")

// You can include almost any character in constant and variable names, including Unicode characters.
// However, names cannot contain whitespace characters, mathematical symbols, arrows, private-use Unicode scalar values,
// or line- and box-drawing characters. Nor can they begin with a number, although numbers may be included elsewhere within the name.
let π = 3.14159
let 😊 = "happy"
print("Value of π: \(π), Mood: \(😊)")

// If you need to use a Swift keyword as a name, surround it with backticks (`).
var `let` = "This is a string assigned to a variable named 'let'"
print(`let`)
// However, it's generally better to avoid using keywords as names.
