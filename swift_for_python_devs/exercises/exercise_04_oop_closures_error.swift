// Exercise 04: OOP (Classes, Structs, Protocols, Extensions), Closures, Error Handling

// --- Part 1: Object-Oriented Programming ---

// 1. Struct vs. Class:
//    a. Define a struct `Book` with properties: `title` (String), `author` (String), `pageCount` (Int).
//    b. Define a class `Library` with a property: `name` (String) and an array `books` of type `[Book]`.
//    c. Add a method to `Library` called `addBook(_ book: Book)` that appends a book to its `books` array.
//    d. Add another method to `Library` called `listBooks()` that prints the title and author of each book in the library.
//    e. Create a `Library` instance and a few `Book` instances. Add the books to the library and list them.
//    f. Explain in a comment why `Book` is suitable as a struct and `Library` might be more suitable as a class in this context.


// 2. Inheritance:
//    a. Define a class `Shape` with a computed property `area: Double` that returns 0.0.
//       It should also have a method `describe()` that prints "This is a generic shape."
//    b. Define a class `Rectangle` that inherits from `Shape`.
//       - It should have stored properties `width: Double` and `height: Double`.
//       - Override the `area` property to calculate and return the actual area (width * height).
//       - Override the `describe()` method to print "This is a rectangle with width [width] and height [height]."
//       - Provide an initializer `init(width: Double, height: Double)`.
//    c. Define a class `Circle` that inherits from `Shape`.
//       - It should have a stored property `radius: Double`.
//       - Override the `area` property to calculate and return the actual area (π * radius^2). Use `Double.pi`.
//       - Override the `describe()` method to print "This is a circle with radius [radius]."
//       - Provide an initializer `init(radius: Double)`.
//    d. Create instances of `Rectangle` and `Circle`. Call their `describe()` methods and print their `area`.


// 3. Protocols:
//    a. Define a protocol `Playable` with a method requirement `play()` and a gettable property `duration: Int` (representing seconds).
//    b. Create a struct `Song` that conforms to `Playable`. It should have properties `title: String`, `artist: String`, and `duration: Int`.
//       Implement the `play()` method to print "Now playing [title] by [artist] (\(duration)s)".
//    c. Create a class `Movie` that conforms to `Playable`. It should have properties `title: String`, `director: String`, and `duration: Int`.
//       Implement the `play()` method to print "Now showing [title], directed by [director] (\(duration)s)".
//    d. Create an array `playlist` of type `[Playable]` containing instances of `Song` and `Movie`.
//    e. Iterate through the `playlist` and call `play()` on each item. Also, print the total duration of the playlist.


// 4. Extensions:
//    a. Extend the built-in `Int` type to add a computed property `isEven` (Bool) that returns `true` if the integer is even, `false` otherwise.
//    b. Extend `Int` to add a method `times(_ task: () -> Void)` that executes the given closure `self` number of times.
//       Example: `3.times { print("Hello") }` should print "Hello" three times.
//    c. Test your extensions.


// --- Part 2: Closures ---

// 5. Basic Closure & `map`:
//    Given an array of integers `numbers = [1, 2, 3, 4, 5]`:
//    a. Use the `map` function with a closure to create a new array `squaredNumbers` where each number is squared.
//    b. Use `map` with a closure to create a new array `stringifiedNumbers` where each number is converted to a string like "Number: X".
//    Print both new arrays.


// 6. `filter` and `reduce`:
//    Given the same `numbers` array:
//    a. Use the `filter` function with a closure to create a new array `evenNumbers` containing only the even numbers from the `numbers` array.
//    b. Use the `reduce` function with a closure to calculate the sum of all numbers in the `numbers` array.
//    Print the `evenNumbers` array and the sum.


// 7. Trailing Closures:
//    Write a function `performAsyncTask(then completionHandler: @escaping (String) -> Void)`
//    that simulates an asynchronous task (e.g., using `DispatchQueue.main.asyncAfter` or just calling the handler directly for simplicity in this exercise).
//    After the "task" is done, it should call the `completionHandler` with a success message string.
//    Call `performAsyncTask` using trailing closure syntax to print the success message.


// --- Part 3: Error Handling ---

// 8. Custom Error and Throwing Function:
//    a. Define an enum `OperationError` that conforms to the `Error` protocol.
//       It should have at least two cases: `divisionByZero` and `negativeInput(message: String)`.
//    b. Write a function `performCalculation(a: Double, b: Double, operation: String) throws -> Double`.
//       - If `operation` is "+", return `a + b`.
//       - If `operation` is "-", return `a - b`.
//       - If `operation` is "*", return `a * b`.
//       - If `operation` is "/", then if `b` is 0, throw `OperationError.divisionByZero`. Otherwise, return `a / b`.
//       - If `a` or `b` is negative and the operation is sensitive to it (e.g., for a made-up "sqrt_sum" operation),
//         throw `OperationError.negativeInput(message: "Cannot process negative numbers for this operation")`.
//         (For simplicity, let's say only "/" is sensitive to `b` being zero for this exercise. You can add more logic if you wish).
//       - For any other operation string, print a message and return 0 or throw another error.


// 9. Do-Catch and `try?`:
//    a. Call `performCalculation` several times within a `do-catch` block to demonstrate handling different errors:
//       - A successful division.
//       - Division by zero.
//       - (Optional if implemented) An operation with negative input that throws.
//       - An unknown operation.
//       In the `catch` blocks, print descriptive messages based on the error type.
//    b. Call `performCalculation` for a case that might throw an error, but use `try?` to get an optional result.
//       Print the result or a message if it was `nil`.

```
