// Swift for Python Developers - Example 02: Data Types

// --- Basic Data Types ---

// Integer (Int) - similar to Python's int
// Size depends on the platform (32-bit or 64-bit)
let age: Int = 30
let score = 95 // Inferred as Int
print("Age: \(age), Score: \(score)")

// Floating-Point Numbers
// Double: 64-bit floating-point number (default for floating-point literals) - like Python's float
let pi: Double = 3.1415926535
let gravity = 9.80665 // Inferred as Double
print("Pi: \(pi), Gravity: \(gravity)")

// Float: 32-bit floating-point number
let price: Float = 19.99
print("Price: \(price)")

// Boolean (Bool) - similar to Python's bool
// Can only be `true` or `false`
let isActive: Bool = true
let hasPermission = false
print("Is active: \(isActive), Has permission: \(hasPermission)")

// String - similar to Python's str
// An ordered collection of characters
let greeting: String = "Hello, Swift Developer!"
var message = "Welcome"
message += " to the world of Swift." // String concatenation
print(greeting)
print(message)

// String Interpolation (like Python's f-strings)
let name = "Alice"
let personalizedGreeting = "Hello, \(name)!"
print(personalizedGreeting)

let a = 5
let b = 3
print("\(a) + \(b) = \(a + b)")

// Multi-line Strings (like Python's triple-quoted strings)
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)

// Character - represents a single character
// Python doesn't have a separate character type; single characters are strings of length 1.
let initial: Character = "J"
let heartSymbol: Character = "❤️"
print("Initial: \(initial), Symbol: \(heartSymbol)")


// --- Collection Types ---

// Array - ordered collection of values of the SAME type. Similar to Python lists, but type-homogeneous.
// Python lists can store mixed types. Swift arrays require elements to be of the same type.
var numbers: [Int] = [1, 2, 3, 4, 5]
var fruits = ["Apple", "Banana", "Orange"] // Inferred as [String]

print("First number: \(numbers[0])")
print("Second fruit: \(fruits[1])")

numbers.append(6) // Add element
print("Numbers after append: \(numbers)")
fruits.insert("Mango", at: 1) // Insert element
print("Fruits after insert: \(fruits)")

// fruits.append(100) // Error: Cannot convert value of type 'Int' to expected argument type 'String'

// Empty Array
var emptyIntArray: [Int] = []
var emptyStringArray = [String]()
print("Empty int array count: \(emptyIntArray.count)")

// Array with default values
var threeDoubles = Array(repeating: 0.0, count: 3) // [0.0, 0.0, 0.0]
print("Three doubles: \(threeDoubles)")


// Dictionary - unordered collection of key-value pairs. Similar to Python dicts.
// Keys must be of the same hashable type, values must be of the same type.
var person: [String: String] = ["name": "John Doe", "city": "New York"]
var scores: [String: Int] = ["Math": 90, "Science": 85] // Inferred as [String: Int]

print("Person's name: \(person["name"] ?? "N/A")") // Accessing returns an optional
print("Math score: \(scores["Math"] ?? 0)")

person["occupation"] = "Developer" // Add new key-value pair
scores["Math"] = 92 // Update existing value
print("Person after update: \(person)")

// To use mixed value types, you can use `Any` but it's less type-safe.
var mixedInfo: [String: Any] = ["name": "Jane", "age": 28, "isStudent": false]
print("Mixed info age: \(mixedInfo["age"] as? Int ?? 0)") // Requires type casting for 'Any'

// Empty Dictionary
var emptyDict: [String: Int] = [:]
var anotherEmptyDict = [String: Double]()
print("Empty dict count: \(emptyDict.count)")


// Set - unordered collection of unique values of the SAME type. Similar to Python sets.
var uniqueNumbers: Set<Int> = [1, 2, 3, 2, 1, 4] // {1, 2, 3, 4} (order may vary)
var vowels: Set<Character> = ["a", "e", "i", "o", "u"]
print("Unique numbers: \(uniqueNumbers.sorted())") // Print sorted for consistent output

uniqueNumbers.insert(5)
print("Unique numbers after insert 5: \(uniqueNumbers.sorted())")
if uniqueNumbers.contains(3) {
    print("Set contains 3")
}

// Set operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

print("Union: \(oddDigits.union(evenDigits).sorted())")
print("Intersection: \(oddDigits.intersection(singleDigitPrimeNumbers).sorted())")
print("Symmetric Difference: \(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())")
print("Subtracting: \(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())")


// --- Tuples ---
// A fixed-size, ordered collection of values that can be of different types.
// Python tuples are similar.
let httpStatus = (404, "Not Found")
print("Status code: \(httpStatus.0), Message: \(httpStatus.1)")

// Naming tuple elements
let namedPoint = (x: 10, y: 20, z: 5)
print("Point coordinates: x=\(namedPoint.x), y=\(namedPoint.y), z=\(namedPoint.z)")

// Decomposing a tuple
let (statusCode, statusMessage) = httpStatus
print("Decomposed - Code: \(statusCode), Message: \(statusMessage)")

// You can ignore parts of a tuple with an underscore (_)
let (justCode, _) = httpStatus
print("Just the code: \(justCode)")

// Tuples can be useful as return types for functions returning multiple values.
func getUser() -> (name: String, age: Int, isActive: Bool) {
    return ("Alice", 30, true)
}
let user = getUser()
print("User \(user.name) is \(user.age) years old.")


// --- Optionals ---
// Used to handle the absence of a value. An optional can either contain a value or be `nil`.
// Python uses `None` for this, but Swift's optionals are more type-safe.

var optionalString: String? = "Hello"
print("OptionalString: \(optionalString ?? "is nil")") // Nil-coalescing operator

optionalString = nil
print("OptionalString after nil: \(optionalString ?? "is nil")")

// If a non-optional variable is declared, it MUST have a value.
// var nonOptionalString: String // Error: Variables must be initialized before being used, unless they are optionals.
var nonOptionalString: String = "I must have a value"

// Forced Unwrapping (use with extreme caution - crashes if nil)
var anotherOptional: String? = "Value exists"
// print(anotherOptional!) // "Value exists"
// anotherOptional = nil
// print(anotherOptional!) // This would CRASH: Fatal error: Unexpectedly found nil while unwrapping an Optional value

// Optional Binding (safer way to unwrap)
var maybeName: String? = "Carol"
// maybeName = nil // Uncomment to see the else block execute

if let actualName = maybeName {
    print("The name is \(actualName).") // Executes only if maybeName has a value
} else {
    print("The name is nil.")
}

// Multiple optional bindings and boolean conditions in one if statement
var maybeAge: Int? = 30
var maybeCity: String? = "London"

if let name = maybeName, let age = maybeAge, age > 18, let city = maybeCity {
    print("\(name) is \(age) and lives in \(city).")
} else {
    print("Could not get all required information or age is not > 18.")
}

// Implicitly Unwrapped Optionals (rarely needed, primarily for Objective-C interop)
// Behaves like an optional but can be accessed without `!` (will crash if nil at access time).
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitValue: String = assumedString // No `!` needed, but assumedString MUST have a value here.
print(implicitValue)

// let badAssumedString: String! = nil
// let badValue = badAssumedString // CRASHES here if badAssumedString is nil.

// Type Aliases (similar to typedef in C, or just assigning a type to a variable in Python)
// Define an alternative name for an existing type.
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // Use the type alias
print("Max amplitude: \(maxAmplitudeFound)")

typealias Point = (Int, Int)
var screenOrigin: Point = (0,0)
print("Screen origin: \(screenOrigin)")

typealias StringDictionary = [String: String]
var userPreferences: StringDictionary = ["theme": "dark", "language": "en"]
print("User theme: \(userPreferences["theme"] ?? "default")")
