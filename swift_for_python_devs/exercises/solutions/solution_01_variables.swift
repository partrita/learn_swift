// Solution for Exercise 01: Variables, Constants, and Basic Types

// 1. Declare a constant `appName` and assign it the value "MyApp".
//    Print the value of `appName`.
let appName = "MyApp"
print("1. App Name: \(appName)")


// 2. Declare a variable `currentUserScore` of type Int and initialize it to 0.
//    Increment the score by 10.
//    Print the score.
var currentUserScore: Int = 0
currentUserScore += 10
print("2. Current User Score: \(currentUserScore)")


// 3. Declare a variable `temperatureCelsius` with an initial value of 25.5 (let Swift infer its type).
//    Declare a constant `celsiusToFahrenheitMultiplier` with the value 1.8.
//    Declare a constant `fahrenheitOffset` with the value 32.0.
//    Calculate the temperature in Fahrenheit using the formula: (Celsius * Multiplier) + Offset.
//    Store the result in a constant `temperatureFahrenheit`.
//    Print the Fahrenheit temperature, like "25.5°C is 77.9°F".
var temperatureCelsius = 25.5 // Inferred as Double
let celsiusToFahrenheitMultiplier = 1.8
let fahrenheitOffset = 32.0
let temperatureFahrenheit = (temperatureCelsius * celsiusToFahrenheitMultiplier) + fahrenheitOffset
print("3. \(temperatureCelsius)°C is \(temperatureFahrenheit)°F")


// 4. Declare a variable `username` of type String.
//    Assign it your name.
//    Create a greeting string `personalizedGreeting` using string interpolation: "Hello, [username]! Welcome to Swift."
//    Print the greeting.
var username: String
username = "Jules" // Replace with your name
let personalizedGreeting = "Hello, \(username)! Welcome to Swift."
print("4. \(personalizedGreeting)")


// 5. Declare a constant `isEnabled` of type Bool and set it to `true`.
//    Print a message indicating whether the feature is enabled or disabled based on this constant.
//    Example: "Feature status: Enabled" or "Feature status: Disabled"
let isEnabled: Bool = true
let statusMessage = isEnabled ? "Enabled" : "Disabled"
print("5. Feature status: \(statusMessage)")
// Alternative using if-else:
// if isEnabled {
//     print("5. Feature status: Enabled")
// } else {
//     print("5. Feature status: Disabled")
// }


// 6. Declare an optional String variable `middleName` and initialize it to `nil`.
//    Declare a non-optional String `firstName` with your first name.
//    Declare a non-optional String `lastName` with your last name.
//    Using the nil-coalescing operator (`??`), create a `fullName` string.
//    If `middleName` is `nil`, `fullName` should be "firstName lastName".
//    If `middleName` has a value, `fullName` should be "firstName middleName lastName".
//    Print the `fullName`.
//    Then, assign a value to `middleName` and print `fullName` again.
var middleName: String? = nil
let firstName = "Jules"
let lastName = "The Coder"

var fullName = "\(firstName) \(middleName ?? "") \(lastName)"
// A slightly better way to handle the extra space if middleName is nil:
if let actualMiddleName = middleName {
    fullName = "\(firstName) \(actualMiddleName) \(lastName)"
} else {
    fullName = "\(firstName) \(lastName)"
}
print("6. Full Name (middleName is nil): \(fullName)")

middleName = "AI"
if let actualMiddleName = middleName {
    fullName = "\(firstName) \(actualMiddleName) \(lastName)"
} else {
    fullName = "\(firstName) \(lastName)"
}
print("6. Full Name (middleName has value): \(fullName)")


// 7. Create a tuple `httpResponse` representing a server response.
//    It should contain two elements: `statusCode` (Int) with value 200, and `message` (String) with value "OK".
//    Print the status code and message from the tuple.
//    Then, decompose the tuple into two separate constants `code` and `msg` and print them.
let httpResponse = (statusCode: 200, message: "OK")
print("7. Tuple access: Status Code: \(httpResponse.statusCode), Message: \(httpResponse.message)")

let (code, msg) = httpResponse
print("7. Decomposed: Code: \(code), Msg: \(msg)")


// 8. Type Conversion:
//    Declare a Double `preciseValue` with value 123.456.
//    Convert `preciseValue` to an Int, storing it in `integerValue`. Print `integerValue`.
//    Declare an Int `largeNumber` with value 1_000_000 (using underscores for readability).
//    Convert `largeNumber` to a String, storing it in `numberString`. Print `numberString`.
let preciseValue: Double = 123.456
let integerValue: Int = Int(preciseValue) // Truncates: 123
print("8. Double \(preciseValue) to Int: \(integerValue)")

let largeNumber: Int = 1_000_000
let numberString: String = String(largeNumber)
print("8. Int \(largeNumber) to String: \(numberString)")


// 9. What is the difference between `let` and `var` in Swift? Explain in a comment.
// `let` is used to declare constants. Once a value is assigned to a `let` constant, it cannot be changed.
// `var` is used to declare variables. The value of a `var` variable can be changed after its initial assignment.


// 10. Why is Swift considered a type-safe language? Explain in a comment.
//     Provide a small code example (that would cause a compile-time error if uncommented)
//     to illustrate type mismatch.
// Swift is type-safe because it checks types at compile-time. This means the compiler ensures that
// a variable or constant declared as a certain type can only hold values of that type.
// You cannot assign a value of one type to a variable of another incompatible type without
// explicit conversion. This helps catch many common programming errors early in development.

// Example of type mismatch:
var myAge: Int = 30
// myAge = "Thirty" // This line would cause a compile-time error:
                   // "Cannot assign value of type 'String' to type 'Int'"
```
