// Swift for Python Developers - Example 05: Functions

import Foundation // For things like String manipulation if needed, not strictly for basic functions

// --- Defining and Calling Functions ---
// `func` keyword, explicit parameter types, and explicit return type.
// Python:
// def greet(name):
//     return f"Hello, {name}!"
// message = greet("Pythonista")

print("--- Basic Functions ---")
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

// Calling a function - argument labels are used (by default, same as parameter name)
let message = greet(person: "Swift Developer")
print(message)


// --- Function Parameters and Return Values ---

// Functions Without Parameters
func sayHelloWorld() -> String {
    return "Hello, world"
}
print(sayHelloWorld())

// Functions Without Return Values (implicitly returns Void)
func greetWithoutReturn(person: String) {
    print("Hello, \(person) (from void function)!")
}
greetWithoutReturn(person: "Alice")

// Can also explicitly state Void
func printAndReturnNothing(message: String) -> Void {
    print("Message to print: \(message)")
}
printAndReturnNothing(message: "Test message")

// Functions with Multiple Parameters
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
let sum = addTwoInts(a: 5, b: 3)
print("Sum of 5 and 3 is \(sum)")

// Functions Returning Tuples (for multiple return values)
// Python:
// def get_http_status():
//     return (404, "Not Found")
// code, msg = get_http_status()

func getHttpStatus() -> (code: Int, description: String) { // Named tuple elements
    return (404, "Not Found")
}
let status = getHttpStatus()
print("HTTP Status Code: \(status.code), Description: \(status.description)")

let (statusCode, statusMessage) = getHttpStatus() // Decomposing the tuple
print("Decomposed - Code: \(statusCode), Message: \(statusMessage)")


// --- Argument Labels and Parameter Names ---
// Each function parameter has both an argument label and a parameter name.
// Argument label: used when calling the function.
// Parameter name: used in the implementation of the function.
// By default, parameter names are used as their argument labels.

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // Inside the function:
    // firstParameterName refers to the first argument value
    // secondParameterName refers to the second argument value
    print("Inside someFunction: \(firstParameterName), \(secondParameterName)")
}
someFunction(firstParameterName: 1, secondParameterName: 2)


// Specifying Argument Labels (external name different from internal name)
func greet(person name: String, from hometown: String) -> String {
    // `name` and `hometown` are internal parameter names
    return "Hello \(name)! Glad you could visit from \(hometown)."
}
// `person` and `from` are external argument labels used when calling
print(greet(person: "Bill", from: "Cupertino"))


// Omitting Argument Labels (using `_`)
func multiply(_ num1: Int, by num2: Int) -> Int {
    // `num1` and `num2` are internal parameter names
    return num1 * num2
}
// No argument label for the first parameter, `by` for the second.
let product = multiply(8, by: 3) // More like a natural sentence
print("Product of 8 and 3 is \(product)")


// Default Parameter Values
// Python:
// def power(base, exponent=2):
//     return base ** exponent
print("\n--- Default Parameter Values ---")
func power(base: Int, exponent: Int = 2) -> Int {
    var result = 1
    for _ in 0..<exponent {
        result *= base
    }
    return result
}
print("3 to the power of 2 (default): \(power(base: 3))")       // Uses default exponent 2
print("3 to the power of 3: \(power(base: 3, exponent: 3))") // Overrides default


// Variadic Parameters (accept zero or more values of a specified type, like *args in Python)
// The values are made available within the function's body as an array of the appropriate type.
// A function may have at most one variadic parameter, and it must be the last parameter.
print("\n--- Variadic Parameters ---")
func average(_ numbers: Double...) -> Double { // `numbers` is [Double] inside
    if numbers.isEmpty {
        return 0.0
    }
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print("Average of 1,2,3,4,5: \(average(1.0, 2.0, 3.0, 4.0, 5.0))")
print("Average of 10.5, 12.5: \(average(10.5, 12.5))")
print("Average of no numbers: \(average())")


// In-Out Parameters
// Function parameters are constants by default.
// In-out parameters allow a function to modify a variable passed to it, and those
// changes are reflected in the original variable after the function call returns.
// Similar to pass-by-reference.
// Python mutable types (like lists, dicts) are passed by object reference, so changes inside function affect original.
// For immutable types, Python effectively passes by value.
print("\n--- In-Out Parameters ---")
func swapTwoInts(_ a: inout Int, _ b: inout Int) { // `inout` keyword
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
print("Before swap: someInt = \(someInt), anotherInt = \(anotherInt)")
swapTwoInts(&someInt, &anotherInt) // Pass variables with `&` (ampersand)
print("After swap: someInt = \(someInt), anotherInt = \(anotherInt)")
// Note: You can only pass variables (not constants or literals) as in-out arguments.


// --- Function Types ---
// Every function has a specific function type, made up of the parameter types and the return type.
// Example: `(Int, Int) -> Int` is the type of a function that takes two Ints and returns an Int.
print("\n--- Function Types ---")
func add(a: Int, b: Int) -> Int { return a + b }
func subtract(a: Int, b: Int) -> Int { return a - b }

var mathFunction: (Int, Int) -> Int // Declaring a variable of function type

mathFunction = add // Assign `add` function to `mathFunction`
print("Result of mathFunction (add): \(mathFunction(10, 5))") // 15

mathFunction = subtract // Assign `subtract` function
print("Result of mathFunction (subtract): \(mathFunction(10, 5))") // 5

// Using Function Types as Parameter Types (Higher-Order Functions)
func printMathResult(_ operation: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = operation(a, b)
    print("Calculation result: \(result)")
}
printMathResult(add, 20, 7)      // Pass `add` function as an argument
printMathResult(subtract, 20, 7) // Pass `subtract` function

// Using Function Types as Return Types (Functions returning functions)
func stepForward(_ input: Int) -> Int { return input + 1 }
func stepBackward(_ input: Int) -> Int { return input - 1 }

func chooseStepFunction(backward: Bool) -> (Int) -> Int { // Returns a function of type (Int) -> Int
    return backward ? stepBackward : stepForward
}

var currentValue = 3
print("Current value: \(currentValue)")
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero is now either stepBackward or stepForward

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue) // Call the returned function
}
print("Zero!")


// --- Nested Functions ---
// Functions can be defined inside other functions.
// Nested functions are hidden from the outside world by default but can be called by their enclosing function.
// An enclosing function can also return one of its nested functions.
print("\n--- Nested Functions ---")
func chooseAnotherStepFunction(backward: Bool) -> (Int) -> Int {
    func goForward(input: Int) -> Int { return input + 1 }
    func goBackward(input: Int) -> Int { return input - 1 }

    return backward ? goBackward : goForward
}

var val = -2
let nextStepFunc = chooseAnotherStepFunction(backward: val < 0)
while val != 0 {
    print("\(val)... (nested)")
    val = nextStepFunc(val)
}
print("Zero! (nested)")

// Closures are covered in a separate example, as they are a more advanced topic related to functions.
```
