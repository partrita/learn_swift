// Swift for Python Developers - Example 10: Error Handling

// Swift provides first-class support for throwing, catching, propagating,
// and manipulating recoverable errors at runtime.
// Python uses try-except-finally blocks for exceptions.

import Foundation // For some examples like file operations

// --- Representing Errors ---
// In Swift, errors are represented by values of types that conform to the `Error` protocol (an empty protocol).
// Enumerations are often well-suited for modeling a group of related error conditions.

enum SandwichError: Error {
    case outOfBread
    case missingIngredient(ingredient: String)
    case insufficientFunds(coinsNeeded: Int)
    case machineBroken(reason: String)
}

// --- Throwing Errors ---
// You use `throw` to indicate that something unexpected happened and the normal flow of execution can't continue.
// `throw SandwichError.outOfBread`

// --- Propagating Errors Using `throws` ---
// A function/method/initializer that can throw an error must be marked with `throws` keyword in its declaration.
// If you call a function that `throws`, you must handle the error or propagate it.

struct Sandwich {
    var ingredients: [String]
    var price: Int
}

var availableBreadSlices = 4
var availableIngredients = ["cheese": 3, "ham": 2, "lettuce": 5]
var cashInRegister = 100

func makeSandwich(desiredIngredients: [String], payment: Int) throws -> Sandwich {
    print("\nAttempting to make sandwich with \(desiredIngredients), payment: \(payment)...")

    guard availableBreadSlices >= 2 else {
        print("Error: Out of bread!")
        throw SandwichError.outOfBread // Throw the error
    }

    for ingredient in desiredIngredients {
        guard let count = availableIngredients[ingredient], count > 0 else {
            print("Error: Missing ingredient - \(ingredient)!")
            throw SandwichError.missingIngredient(ingredient: ingredient)
        }
    }

    let sandwichPrice = 5 + desiredIngredients.count // Base price + $1 per ingredient
    guard payment >= sandwichPrice else {
        let needed = sandwichPrice - payment
        print("Error: Insufficient funds! Need \(needed) more coins.")
        throw SandwichError.insufficientFunds(coinsNeeded: needed)
    }

    // Simulate a random machine failure
    if Bool.random() && Bool.random() { // ~25% chance of failure
        let reasons = [" jammed", " overheated", " on strike"]
        let reason = reasons.randomElement() ?? "unknown issue"
        print("Error: Machine broke - \(reason)!")
        throw SandwichError.machineBroken(reason: reason)
    }

    // If all checks pass, make the sandwich
    availableBreadSlices -= 2
    for ingredient in desiredIngredients {
        availableIngredients[ingredient]? -= 1
    }
    cashInRegister += sandwichPrice

    let newSandwich = Sandwich(ingredients: desiredIngredients, price: sandwichPrice)
    print("Successfully made sandwich: \(newSandwich.ingredients.joined(separator: ", ")). Price: \(newSandwich.price).")
    return newSandwich
}


// --- Handling Errors ---
// When you call a throwing function, you prepend `try` to the expression.
// Swift offers several ways to handle errors:

// 1. Propagate the error from a function to the code that calls that function.
//    (The calling function must also be marked `throws`)
func buySandwich(ingredients: [String], amountPaid: Int) throws -> Sandwich {
    // If makeSandwich throws, buySandwich will also throw
    let sandwich = try makeSandwich(desiredIngredients: ingredients, payment: amountPaid)
    print("Enjoy your \(sandwich.ingredients.joined(separator: ", ")) sandwich!")
    return sandwich
}

// 2. Handle the error using a `do-catch` statement.
print("--- Handling with do-catch ---")
func tryToBuyASandwich(ingredients: [String], payment: Int) {
    do {
        let sandwich = try buySandwich(ingredients: ingredients, amountPaid: payment)
        // If buySandwich succeeds, this code runs
        print("Do-Catch: Purchase successful for \(sandwich.ingredients.joined(separator: ", ")).")
    } catch SandwichError.outOfBread {
        print("Do-Catch: Error - So sorry, we're all out of bread today.")
    } catch SandwichError.missingIngredient(let ingredient) {
        print("Do-Catch: Error - We're missing \(ingredient) for your sandwich.")
    } catch SandwichError.insufficientFunds(let coinsNeeded) {
        print("Do-Catch: Error - Not enough money. You need \(coinsNeeded) more coins.")
    } catch SandwichError.machineBroken(let reason) {
        print("Do-Catch: Error - The sandwich machine is broken because it\(reason). Try again later.")
    } catch { // A generic catch block (catches any other error)
        // `error` is an implicitly available local constant of type `Error`
        print("Do-Catch: An unexpected error occurred: \(error)")
        // You can also cast it: `if let unknownError = error as? MyCustomErrorType`
    }
    print("--- End of do-catch attempt ---")
}

// Test do-catch
availableBreadSlices = 5
availableIngredients = ["cheese": 3, "ham": 2, "lettuce": 5]
cashInRegister = 100

tryToBuyASandwich(ingredients: ["cheese", "ham"], payment: 10) // Should succeed (unless machine breaks)
tryToBuyASandwich(ingredients: ["turkey"], payment: 8)        // Missing ingredient
availableBreadSlices = 1
tryToBuyASandwich(ingredients: ["cheese"], payment: 6)         // Out of bread
availableBreadSlices = 4
tryToBuyASandwich(ingredients: ["lettuce"], payment: 1)        // Insufficient funds


// 3. Handle the error as an optional value using `try?`.
// If an error is thrown, the expression becomes `nil`.
print("\n--- Handling with try? ---")
func tryToGetSandwichSilently(ingredients: [String], payment: Int) -> Sandwich? {
    let sandwich = try? makeSandwich(desiredIngredients: ingredients, payment: payment)
    // `sandwich` is Sandwich? (optional Sandwich)
    // If makeSandwich throws an error, sandwich will be nil.

    if let s = sandwich {
        print("Try?: Sandwich successfully created: \(s.ingredients.joined(separator: ", ")).")
    } else {
        print("Try?: Failed to create sandwich (error converted to nil).")
    }
    return sandwich
}
availableBreadSlices = 1
let s1 = tryToGetSandwichSilently(ingredients: ["cheese"], payment: 10) // Fails (out of bread), s1 is nil
availableBreadSlices = 4
availableIngredients["tomato"] = 0
let s2 = tryToGetSandwichSilently(ingredients: ["tomato"], payment: 10) // Fails (missing tomato), s2 is nil
availableIngredients["tomato"] = 2
let s3 = tryToGetSandwichSilently(ingredients: ["tomato", "cheese"], payment: 10) // Should succeed (unless machine breaks)
print("s1: \(String(describing: s1)), s2: \(String(describing: s2)), s3: \(String(describing: s3))")


// 4. Disable error propagation using `try!`.
// Use `try!` only when you are absolutely sure that the throwing function will NOT throw an error at runtime.
// If it does throw, your program will crash. (Similar to force unwrapping an optional `!`).
print("\n--- Handling with try! (Use with extreme caution!) ---")
// Example: Loading a resource you know is in your app bundle
// let imageData = try! Data(contentsOf: URL(fileURLWithPath: "path/to/known/image.jpg"))
// If image.jpg is missing or path is wrong, this will crash.

// Let's make sure our sandwich making will succeed before using try!
availableBreadSlices = 10
availableIngredients = ["cheese": 10, "ham": 10]
cashInRegister = 200
// Assuming no machine break for this specific demo of try!
// (In real code, you can't assume away random failures like machineBroken)
// For this example, we'll temporarily make `makeSandwich` not throw the random error
func makeGuaranteedSandwich(desiredIngredients: [String], payment: Int) throws -> Sandwich {
    guard availableBreadSlices >= 2 else { throw SandwichError.outOfBread }
    for ingredient in desiredIngredients {
        guard let count = availableIngredients[ingredient], count > 0 else {
            throw SandwichError.missingIngredient(ingredient: ingredient)
        }
    }
    let sandwichPrice = 5 + desiredIngredients.count
    guard payment >= sandwichPrice else {
        throw SandwichError.insufficientFunds(coinsNeeded: sandwichPrice - payment)
    }
    // NO random machineBroken error for this version
    availableBreadSlices -= 2
    for ingredient in desiredIngredients { availableIngredients[ingredient]? -= 1 }
    cashInRegister += sandwichPrice
    let newSandwich = Sandwich(ingredients: desiredIngredients, price: sandwichPrice)
    print("Guaranteed sandwich made: \(newSandwich.ingredients.joined(separator: ", ")). Price: \(newSandwich.price).")
    return newSandwich
}

// Now we can use try! because we are "sure" it won't fail under these specific conditions
let definitelyGoodSandwich = try! makeGuaranteedSandwich(desiredIngredients: ["ham", "cheese"], payment: 20)
print("Try!: Successfully got the 'definitelyGoodSandwich': \(definitelyGoodSandwich.ingredients.joined(separator: ", "))")
// If makeGuaranteedSandwich *did* throw (e.g., if we set availableBreadSlices = 0 before), this line would crash.


// --- Specifying Cleanup Actions with `defer` ---
// A `defer` statement executes a block of code just before execution leaves the current scope
// (e.g., function returns normally, an error is thrown, or a loop breaks).
// Useful for resource cleanup, like closing files.
// `defer` statements are executed in reverse order of their appearance if multiple exist.
// Python: `finally` block in try-except-finally.

print("\n--- Defer Statement ---")
enum FileError: Error { case openFailed, writeFailed, closeFailed }

func processFile(filename: String, data: String) throws {
    print("Opening file: \(filename)")
    // Simulate opening a file (in C, this would return a file descriptor)
    let fileDescriptor = 1 // Dummy descriptor
    var fileIsOpen = true

    defer {
        // This block is executed when processFile exits, no matter how.
        print("Defer: Closing file \(filename)...")
        if fileIsOpen {
            // Simulate closing the file
            fileIsOpen = false
            print("Defer: File \(filename) closed.")
            // In real C interop, you might have a close() call that could also throw.
            // Defer blocks cannot themselves throw errors out of their scope.
        } else {
            print("Defer: File \(filename) was already closed or failed to open.")
        }
    }

    defer {
        print("Defer: Second defer statement (runs before the first one above).")
    }

    // Simulate file operations
    if filename.isEmpty {
        print("Error: Filename is empty.")
        // fileIsOpen might be false if open failed before this check in a real scenario
        // For this example, assume open succeeded if filename is not empty.
        throw FileError.openFailed // Triggers defer blocks
    }

    print("Writing data '\(data)' to \(filename)...")
    if data == "corrupt" {
        print("Error: Data is corrupt, cannot write.")
        throw FileError.writeFailed // Triggers defer blocks
    }

    print("Finished processing \(filename).")
    // Normal exit also triggers defer blocks
}

do {
    try processFile(filename: "document.txt", data: "Hello, Swift!")
} catch {
    print("Caught file error: \(error)")
}
print("---")
do {
    try processFile(filename: "report.pdf", data: "corrupt")
} catch {
    print("Caught file error: \(error)")
}
print("---")
do {
    try processFile(filename: "", data: "Empty filename test")
} catch {
    print("Caught file error: \(error)")
}

// `rethrows`
// A function or method can be declared with `rethrows` if it takes a throwing closure
// as a parameter and only throws an error if that closure throws an error.
// It cannot throw its own errors.
print("\n--- Rethrows ---")
func performOperation(_ operation: () throws -> String) rethrows -> String {
    // This function itself doesn't throw. It only re-throws if `operation` throws.
    print("PerformOperation: about to call operation.")
    let result = try operation() // If operation throws, performOperation re-throws it.
    print("PerformOperation: operation succeeded.")
    return "Result: " + result
}

func successfulTask() -> String { // Doesn't throw
    print("SuccessfulTask: running.")
    return "Success!"
}

func failingTask() throws -> String { // Throws
    print("FailingTask: running, about to throw.")
    throw SandwichError.machineBroken(reason: "power surge")
}

// Calling performOperation with a non-throwing closure:
// No `try` needed here because successfulTask doesn't throw, so performOperation won't rethrow.
let r1 = performOperation(successfulTask)
print(r1)

// Calling performOperation with a throwing closure:
// `try` is needed here because failingTask can throw, so performOperation might rethrow.
do {
    let r2 = try performOperation(failingTask)
    print(r2) // Won't be reached
} catch {
    print("Caught error from performOperation(failingTask): \(error)")
}
```
