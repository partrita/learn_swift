// Swift for Python Developers - Example 06: Closures

// Closures are self-contained blocks of functionality that can be passed around and used in your code.
// They can capture and store references to any constants and variables from the context in which they are defined.
// This is known as "closing over" those constants and variables.
// Similar to Python's lambdas, but more powerful and versatile (like blocks in Ruby or anonymous functions in JS).

print("--- Closures ---")

// --- The `sorted` Method Example ---
// Swift's standard library provides a method called `sorted(by:)`, which sorts an array
// of values of a known type, based on the output of a sorting closure that you provide.
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("Original names: \(names)")

// 1. Using a Normal Function as the Sorting Logic
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2 // True if s1 should come before s2 (descending order)
}
var reversedNames = names.sorted(by: backward)
print("Sorted (using function 'backward'): \(reversedNames)")


// 2. Closure Expression Syntax
// General form:
// { (parameters) -> return_type in
//     statements
// }

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
print("Sorted (full closure syntax): \(reversedNames)")


// 3. Inferring Type From Context
// Swift can infer the types of its parameters and the type of the value it returns.
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
print("Sorted (inferred types): \(reversedNames)")


// 4. Implicit Returns from Single-Expression Closures
// If the closure body is a single expression, the `return` keyword can be omitted.
// The expression's value is implicitly returned.
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })
print("Sorted (implicit return): \(reversedNames)")


// 5. Shorthand Argument Names
// Swift automatically provides shorthand argument names to inline closures: $0, $1, $2, and so on.
// $0 refers to the first argument, $1 to the second, etc.
reversedNames = names.sorted(by: { $0 > $1 })
print("Sorted (shorthand argument names): \(reversedNames)")


// 6. Operator Methods
// If the closure's body is just an operator that takes arguments of the correct type and returns the correct type,
// you can simply use the operator itself.
reversedNames = names.sorted(by: >) // `>` is a String operator function (String, String) -> Bool
print("Sorted (operator method): \(reversedNames)")


// --- Trailing Closures ---
// If a closure expression is the last argument to a function, you can write it as a trailing closure
// after the function call's parentheses. If it's the *only* argument, you can omit the parentheses entirely.

// Example: `map` method on arrays
let numbers = [1, 2, 3, 4, 5]
print("\nOriginal numbers: \(numbers)")

// Using map with a full closure
let doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})
print("Doubled (full closure): \(doubledNumbers)")

// Using map with a trailing closure
let tripledNumbers = numbers.map { number in // `number in` implies parameters and start of body
    return number * 3
}
print("Tripled (trailing closure): \(tripledNumbers)")

// Using map with shorthand argument names and implicit return in a trailing closure
let squaredNumbers = numbers.map { $0 * $0 }
print("Squared (shorthand, implicit return, trailing): \(squaredNumbers)")

// If a function takes only a closure, parentheses can be omitted entirely.
func performAction(using closure: () -> Void) {
    print("About to perform action...")
    closure()
    print("Action performed.")
}
performAction { // No parentheses for performAction()
    print("...The action itself is happening now...")
}


// --- Capturing Values ---
// A closure can capture constants and variables from the surrounding context in which it is defined.
// The closure can then refer to and modify the values of those constants and variables from
// within its body, even if the original scope that defined the constants and variables no longer exists.

print("\n--- Capturing Values ---")
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0 // `runningTotal` and `amount` are captured by the returned closure

    // Define nested function (which is a closure)
    func incrementer() -> Int {
        runningTotal += amount // Modifies captured `runningTotal`, uses captured `amount`
        return runningTotal
    }

    return incrementer // Return the closure
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print("Increment by ten:")
print(incrementByTen()) // Output: 10 (runningTotal is 0 + 10)
print(incrementByTen()) // Output: 20 (runningTotal is 10 + 10)
print(incrementByTen()) // Output: 30 (runningTotal is 20 + 10)

let incrementBySeven = makeIncrementer(forIncrement: 7)
print("\nIncrement by seven:")
print(incrementBySeven()) // Output: 7 (new runningTotal for this instance)
print(incrementBySeven()) // Output: 14

// The `incrementByTen` and `incrementBySeven` closures have their own independent
// captured `runningTotal` variables. They don't interfere with each other.
print("\nCalling incrementByTen again:")
print(incrementByTen()) // Output: 40 (continues from its own captured runningTotal)


// --- Closures Are Reference Types ---
// When you assign a closure to a constant or variable, you are actually setting that
// constant or variable to be a *reference* to the closure.
// This means if you assign a closure to two different constants/variables,
// both will refer to the same closure and its captured environment.

let alsoIncrementByTen = incrementByTen // `alsoIncrementByTen` refers to the same closure as `incrementByTen`
print("\nUsing 'alsoIncrementByTen':")
print(alsoIncrementByTen()) // Output: 50 (continues from the same runningTotal)


// --- Escaping Closures (`@escaping`) ---
// A closure is said to *escape* a function when the closure is passed as an argument to the function,
// but is called *after* the function returns.
// This can happen if the closure is stored in a variable defined outside the function,
// or if the closure is part of an asynchronous operation.
// You must mark the closure parameter's type with `@escaping`.

var completionHandlers: [() -> Void] = [] // An array to store escaping closures

// `someFunctionWithEscapingClosure` takes a closure and appends it to `completionHandlers`
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
    print("Escaping closure added. Count: \(completionHandlers.count)")
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    print("Nonescaping closure called immediately:")
    closure() // Called within the function's scope
}

// Example usage:
print("\n--- Escaping Closures ---")
let myEscapingClosure = { print("Escaping closure has been executed!") }
someFunctionWithEscapingClosure(completionHandler: myEscapingClosure)
someFunctionWithEscapingClosure(completionHandler: { print("Another escaping closure executed!") })

let myNonescapingClosure = { print("Nonescaping closure action!") }
someFunctionWithNonescapingClosure(closure: myNonescapingClosure)

// Now, we can call the stored escaping closures outside of the function that accepted them:
print("\nExecuting stored escaping closures:")
for handler in completionHandlers {
    handler()
}
// Output:
// Escaping closure has been executed!
// Another escaping closure executed!


// --- Autoclosures (`@autoclosure`) ---
// An autoclosure is a closure that is automatically created to wrap an expression that’s being
// passed as an argument to a function. It doesn’t take any arguments, and when it’s called,
// it returns the value of the expression that’s wrapped inside of it.
// This syntactic convenience lets you omit braces around a function’s parameter by writing
// a normal expression instead of an explicit closure.
// Used for operations that should be delayed, e.g., the right-hand side of `&&` or `||`, or `assert`.

print("\n--- Autoclosures ---")
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("Initial customers: \(customersInLine)")

// The `customerProvider` closure is not executed unless `customersInLine` is empty.
// `@autoclosure` allows calling `serve(customer:)` with just a String expression.
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!") // Closure is called here
}

// Calling `serve` with a String expression, which is automatically wrapped in a closure.
serve(customer: customersInLine.removeFirst()) // "Chris" is removed and served.
// The expression `customersInLine.removeFirst()` is only evaluated when `customerProvider()` is called.

// If you need an escaping autoclosure: `@autoclosure @escaping () -> String`
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
    print("Customer provider collected. Count: \(customerProviders.count)")
}

collectCustomerProviders(customersInLine.removeFirst()) // Alex
collectCustomerProviders(customersInLine.removeFirst()) // Ewa

print("\nServing collected customers:")
for provider in customerProviders {
    serve(customer: provider()) // Calls the autoclosures stored
}
print("Remaining customers: \(customersInLine)") // Barry, Daniella
```
