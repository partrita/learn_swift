// Solution for Exercise 04: OOP (Classes, Structs, Protocols, Extensions), Closures, Error Handling

import Foundation // For Double.pi and DispatchQueue

// --- Part 1: Object-Oriented Programming ---

// 1. Struct vs. Class:
print("--- 1. Struct vs. Class ---")
//    a. Define a struct `Book` with properties: `title` (String), `author` (String), `pageCount` (Int).
struct Book {
    var title: String
    var author: String
    var pageCount: Int
}

//    b. Define a class `Library` with a property: `name` (String) and an array `books` of type `[Book]`.
class Library {
    var name: String
    var books: [Book] = [] // Initialize with an empty array

    init(name: String) {
        self.name = name
    }

//    c. Add a method to `Library` called `addBook(_ book: Book)` that appends a book to its `books` array.
    func addBook(_ book: Book) {
        books.append(book)
        print("'\(book.title)' added to \(name).")
    }

//    d. Add another method to `Library` called `listBooks()` that prints the title and author of each book in the library.
    func listBooks() {
        print("\nBooks in \(name):")
        if books.isEmpty {
            print("The library is empty.")
            return
        }
        for book in books {
            print("- '\(book.title)' by \(book.author) (\(book.pageCount) pages)")
        }
    }
}

//    e. Create a `Library` instance and a few `Book` instances. Add the books to the library and list them.
let myLibrary = Library(name: "City Central Library")
let book1 = Book(title: "The Swift Programming Language", author: "Apple Inc.", pageCount: 500)
let book2 = Book(title: "Structure and Interpretation of Computer Programs", author: "Abelson & Sussman", pageCount: 650)
let book3 = Book(title: "A Short History of Nearly Everything", author: "Bill Bryson", pageCount: 544)

myLibrary.addBook(book1)
myLibrary.addBook(book2)
myLibrary.addBook(book3)
myLibrary.listBooks()

//    f. Explain in a comment why `Book` is suitable as a struct and `Library` might be more suitable as a class in this context.
// `Book` is suitable as a struct because:
//    - It's a relatively simple data container.
//    - When you pass a book around or assign it, you often want a distinct copy (value semantics).
//      For example, if you lend a book (a copy of its info) to a system, changes to that copy shouldn't affect the original in the library.
//    - It doesn't have a complex identity or lifecycle that needs to be managed by reference.
//
// `Library` is more suitable as a class because:
//    - It represents a unique entity (a specific library). If multiple parts of your application
//      need to interact with the *same* library, they should all hold references to the single library instance.
//    - Changes made to the library (like adding a book) through one reference should be visible to all other references.
//    - It has a state (the collection of books) that is modified over time, and these modifications should be shared.
//    - It might have a more complex lifecycle or require deinitialization logic in a real application.


// 2. Inheritance:
print("\n--- 2. Inheritance ---")
//    a. Define a class `Shape` with a computed property `area: Double` that returns 0.0.
//       It should also have a method `describe()` that prints "This is a generic shape."
class Shape {
    var area: Double {
        return 0.0 // Placeholder for generic shape
    }

    func describe() {
        print("This is a generic shape.")
    }

    init() {
        // print("Shape initialized") // Optional: for tracking
    }
}

//    b. Define a class `Rectangle` that inherits from `Shape`.
//       - It should have stored properties `width: Double` and `height: Double`.
//       - Override the `area` property to calculate and return the actual area (width * height).
//       - Override the `describe()` method to print "This is a rectangle with width [width] and height [height]."
//       - Provide an initializer `init(width: Double, height: Double)`.
class Rectangle: Shape {
    var width: Double
    var height: Double

    override var area: Double {
        return width * height
    }

    override func describe() {
        print("This is a rectangle with width \(width) and height \(height).")
    }

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init() // Call superclass initializer
        // print("Rectangle initialized")
    }
}

//    c. Define a class `Circle` that inherits from `Shape`.
//       - It should have a stored property `radius: Double`.
//       - Override the `area` property to calculate and return the actual area (π * radius^2). Use `Double.pi`.
//       - Override the `describe()` method to print "This is a circle with radius [radius]."
//       - Provide an initializer `init(radius: Double)`.
class Circle: Shape {
    var radius: Double

    override var area: Double {
        return Double.pi * radius * radius
    }

    override func describe() {
        print("This is a circle with radius \(radius).")
    }

    init(radius: Double) {
        self.radius = radius
        super.init()
        // print("Circle initialized")
    }
}

//    d. Create instances of `Rectangle` and `Circle`. Call their `describe()` methods and print their `area`.
let myRectangle = Rectangle(width: 10.0, height: 5.0)
myRectangle.describe()
print("Rectangle area: \(myRectangle.area)")

let myCircle = Circle(radius: 3.0)
myCircle.describe()
print("Circle area: \(myCircle.area)")


// 3. Protocols:
print("\n--- 3. Protocols ---")
//    a. Define a protocol `Playable` with a method requirement `play()` and a gettable property `duration: Int` (representing seconds).
protocol Playable {
    var duration: Int { get }
    func play()
}

//    b. Create a struct `Song` that conforms to `Playable`. It should have properties `title: String`, `artist: String`, and `duration: Int`.
//       Implement the `play()` method to print "Now playing [title] by [artist] (\(duration)s)".
struct Song: Playable {
    var title: String
    var artist: String
    var duration: Int // Conforms to `duration` requirement

    func play() { // Conforms to `play()` requirement
        print("Now playing '\(title)' by \(artist) (\(duration)s).")
    }
}

//    c. Create a class `Movie` that conforms to `Playable`. It should have properties `title: String`, `director: String`, and `duration: Int`.
//       Implement the `play()` method to print "Now showing [title], directed by [director] (\(duration)s)".
class Movie: Playable {
    var title: String
    var director: String
    var duration: Int

    init(title: String, director: String, duration: Int) {
        self.title = title
        self.director = director
        self.duration = duration
    }

    func play() {
        print("Now showing '\(title)', directed by \(director) (\(duration)s).")
    }
}

//    d. Create an array `playlist` of type `[Playable]` containing instances of `Song` and `Movie`.
let song1 = Song(title: "Bohemian Rhapsody", artist: "Queen", duration: 354)
let movie1 = Movie(title: "Inception", director: "Christopher Nolan", duration: 8880) // 2h 28m
let song2 = Song(title: "Imagine", artist: "John Lennon", duration: 183)

let playlist: [Playable] = [song1, movie1, song2]

//    e. Iterate through the `playlist` and call `play()` on each item. Also, print the total duration of the playlist.
print("e. Playlist playback:")
var totalDuration = 0
for item in playlist {
    item.play()
    totalDuration += item.duration
}
print("Total playlist duration: \(totalDuration) seconds.")


// 4. Extensions:
print("\n--- 4. Extensions ---")
//    a. Extend the built-in `Int` type to add a computed property `isEven` (Bool) that returns `true` if the integer is even, `false` otherwise.
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

//    b. Extend `Int` to add a method `times(_ task: () -> Void)` that executes the given closure `self` number of times.
//       Example: `3.times { print("Hello") }` should print "Hello" three times.
extension Int {
    func times(_ task: () -> Void) {
        if self > 0 { // Ensure positive number of repetitions
            for _ in 0..<self {
                task()
            }
        }
    }
}

//    c. Test your extensions.
let num1 = 4
let num2 = 7
print("c. Is \(num1) even? \(num1.isEven)") // true
print("c. Is \(num2) even? \(num2.isEven)") // false

print("c. Repeating a task 3 times:")
3.times {
    print("   Hello from Int extension!")
}
print("c. Repeating a task 0 times (should do nothing):")
0.times {
    print("   This should not print.")
}


// --- Part 2: Closures ---
print("\n--- 5. Closures & map ---")
// 5. Basic Closure & `map`:
//    Given an array of integers `numbers = [1, 2, 3, 4, 5]`:
let numbers = [1, 2, 3, 4, 5]
print("Original numbers: \(numbers)")
//    a. Use the `map` function with a closure to create a new array `squaredNumbers` where each number is squared.
let squaredNumbers = numbers.map { number in number * number }
// Shorter: let squaredNumbers = numbers.map { $0 * $0 }
print("a. Squared numbers: \(squaredNumbers)")

//    b. Use `map` with a closure to create a new array `stringifiedNumbers` where each number is converted to a string like "Number: X".
let stringifiedNumbers = numbers.map { number -> String in
    return "Number: \(number)"
}
// Shorter: let stringifiedNumbers = numbers.map { "Number: \($0)" }
print("b. Stringified numbers: \(stringifiedNumbers)")


print("\n--- 6. filter and reduce ---")
// 6. `filter` and `reduce`:
//    Given the same `numbers` array:
//    a. Use the `filter` function with a closure to create a new array `evenNumbers` containing only the even numbers from the `numbers` array.
let evenNumbers = numbers.filter { number in number % 2 == 0 }
// Shorter: let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("a. Even numbers: \(evenNumbers)")

//    b. Use the `reduce` function with a closure to calculate the sum of all numbers in the `numbers` array.
let sumOfNumbers = numbers.reduce(0) { accumulator, currentElement in
    return accumulator + currentElement
}
// Shorter: let sumOfNumbers = numbers.reduce(0, +)
// `0` is the initial result. `+` is an operator function that matches the closure type.
print("b. Sum of numbers: \(sumOfNumbers)")


print("\n--- 7. Trailing Closures ---")
// 7. Trailing Closures:
//    Write a function `performAsyncTask(then completionHandler: @escaping (String) -> Void)`
//    that simulates an asynchronous task (e.g., using `DispatchQueue.main.asyncAfter` or just calling the handler directly for simplicity in this exercise).
//    After the "task" is done, it should call the `completionHandler` with a success message string.
//    Call `performAsyncTask` using trailing closure syntax to print the success message.
func performAsyncTask(then completionHandler: @escaping (String) -> Void) {
    print("Starting async task...")
    // Simulate delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Small delay for simulation
        print("Async task finished.")
        completionHandler("Task completed successfully!")
    }
}

// To test this in a command-line tool or playground that exits quickly,
// we might need to keep the program alive or call directly.
// For this exercise, direct call is fine for demonstration if async is tricky.
// Let's do a direct call version for simplicity of output in this context.
func performTaskDirectly(then completionHandler: (String) -> Void) {
    print("Starting direct task...")
    // Simulate work
    print("Direct task finished.")
    completionHandler("Direct task completed successfully!")
}

performTaskDirectly { resultMessage in // Trailing closure syntax
    print("Completion Handler: \(resultMessage)")
}
// If using the DispatchQueue version in a playground, ensure "Needs Indefinite Execution" is on.
// Or, for a command-line app, you might need a RunLoop or other mechanism to wait.


// --- Part 3: Error Handling ---
print("\n--- 8. Custom Error and Throwing Function ---")
// 8. Custom Error and Throwing Function:
//    a. Define an enum `OperationError` that conforms to the `Error` protocol.
//       It should have at least two cases: `divisionByZero` and `negativeInput(message: String)`.
enum OperationError: Error {
    case divisionByZero
    case negativeInput(message: String)
    case unknownOperation(operation: String)
}

//    b. Write a function `performCalculation(a: Double, b: Double, operation: String) throws -> Double`.
func performCalculation(a: Double, b: Double, operation: String) throws -> Double {
    print("Performing calculation: \(a) \(operation) \(b)")
    switch operation {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        if b == 0 {
            throw OperationError.divisionByZero
        }
        // Example for negativeInput check, though not strictly required by prompt for '/'
        if a < 0 || b < 0 {
             // For this example, let's say division doesn't allow negative inputs.
             // throw OperationError.negativeInput(message: "Division arguments must be non-negative.")
        }
        return a / b
    // Example of a custom operation that might be sensitive to negative input
    case "sqrt_sum_positive_only":
        if a < 0 || b < 0 {
            throw OperationError.negativeInput(message: "Inputs for sqrt_sum_positive_only must be non-negative.")
        }
        return (a+b).squareRoot() // Assuming Double has squareRoot() or use Foundation.sqrt()
    default:
        throw OperationError.unknownOperation(operation: operation)
    }
}


print("\n--- 9. Do-Catch and try? ---")
// 9. Do-Catch and `try?`:
//    a. Call `performCalculation` several times within a `do-catch` block to demonstrate handling different errors:
print("a. Do-Catch examples:")
//       - A successful division.
do {
    let result = try performCalculation(a: 10.0, b: 2.0, operation: "/")
    print("   Successful division: 10.0 / 2.0 = \(result)")
} catch {
    print("   Error during 10.0 / 2.0: \(error)") // Should not happen
}

//       - Division by zero.
do {
    let result = try performCalculation(a: 5.0, b: 0.0, operation: "/")
    print("   Division by zero result (should not print): \(result)")
} catch OperationError.divisionByZero {
    print("   Caught error: Division by zero is not allowed.")
} catch let OperationError.negativeInput(message) {
    print("   Caught error: Negative input - \(message)")
} catch OperationError.unknownOperation(let op) {
    print("   Caught error: Unknown operation '\(op)'.")
} catch {
    print("   Caught an unexpected error: \(error)")
}

//       - (Optional if implemented) An operation with negative input that throws.
do {
    let result = try performCalculation(a: -4.0, b: 2.0, operation: "sqrt_sum_positive_only")
    print("   sqrt_sum_positive_only result (should not print): \(result)")
} catch OperationError.divisionByZero {
    print("   Caught error: Division by zero is not allowed.")
} catch let OperationError.negativeInput(message) {
    print("   Caught error: Negative input - \(message)")
} catch OperationError.unknownOperation(let op) {
    print("   Caught error: Unknown operation '\(op)'.")
} catch {
    print("   Caught an unexpected error: \(error)")
}

//       - An unknown operation.
do {
    let result = try performCalculation(a: 10.0, b: 2.0, operation: "%")
    print("   Unknown operation result (should not print): \(result)")
} catch OperationError.divisionByZero {
    print("   Caught error: Division by zero is not allowed.")
} catch let OperationError.negativeInput(message) {
    print("   Caught error: Negative input - \(message)")
} catch OperationError.unknownOperation(let op) {
    print("   Caught error: Unknown operation '\(op)'.")
} catch {
    print("   Caught an unexpected error: \(error)")
}


//    b. Call `performCalculation` for a case that might throw an error, but use `try?` to get an optional result.
//       Print the result or a message if it was `nil`.
print("\nb. try? example:")
let resultTryOptional = try? performCalculation(a: 8.0, b: 0.0, operation: "/")
if let result = resultTryOptional {
    print("   Result with try?: \(result)")
} else {
    print("   Calculation failed (try? returned nil). Error was: Division by zero (expected).")
}

let successfulResultTryOptional = try? performCalculation(a: 9.0, b: 3.0, operation: "/")
if let result = successfulResultTryOptional {
    print("   Result with try? (success): \(result)")
} else {
    print("   Calculation failed (try? returned nil, unexpected for 9/3).")
}

// To make performAsyncTask testable without a long wait or complex setup:
// If running from command line and it exits too fast for DispatchQueue:
// RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.5)) // Keep alive for a bit
// However, for automated testing or simple script execution, direct calls are easier.
```
