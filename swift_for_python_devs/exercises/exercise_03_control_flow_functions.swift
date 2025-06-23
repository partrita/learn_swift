// Exercise 03: Control Flow and Functions

// --- Control Flow ---

// 1. If-Else:
//    Write a function `checkTemperature(celsius: Double)` that takes a temperature in Celsius.
//    - If the temperature is below 0, print "It's freezing!".
//    - If it's between 0 and 15 (inclusive of 0, exclusive of 15), print "It's cold.".
//    - If it's between 15 and 25 (inclusive of 15, exclusive of 25), print "It's pleasant.".
//    - If it's 25 or above, print "It's warm!".
//    Test your function with various temperatures.


// 2. Switch Statement:
//    Write a function `getSeason(month: String)` that takes a month (e.g., "January", "February", etc.).
//    Use a switch statement to return the season:
//    - "December", "January", "February": "Winter"
//    - "March", "April", "May": "Spring"
//    - "June", "July", "August": "Summer"
//    - "September", "October", "November": "Autumn" (or "Fall")
//    - Default: "Invalid month"
//    The function should return a String. Test it.


// 3. For-In Loop:
//    a. Create an array of your favorite numbers (at least 5 integers).
//    b. Use a for-in loop to iterate through the array and print each number squared (number * number).
//    c. Given a dictionary `studentScores = ["Alice": 88, "Bob": 92, "Charlie": 75, "David": 95]`,
//       use a for-in loop to print each student's name and their score.


// 4. While Loop:
//    Write a function `countdown(from start: Int)` that prints numbers from `start` down to 1, followed by "Blast off!".
//    Use a while loop. Example: countdown(from: 3) should print:
//    3
//    2
//    1
//    Blast off!


// 5. Guard Statement:
//    Write a function `processOrder(item: String?, quantity: Int?)` that takes an optional item name and an optional quantity.
//    Use `guard` statements to check:
//    - If `item` is `nil`, print "Order failed: Item name missing." and return.
//    - If `quantity` is `nil` or less than 1, print "Order failed: Invalid quantity for [item name]." and return.
//    If both are valid, print "Processing order: [quantity] of [item name]."
//    Test with different inputs (valid, missing item, invalid quantity).


// --- Functions ---

// 6. Basic Function:
//    Write a function `calculateArea(width: Double, height: Double) -> Double` that returns the area of a rectangle.
//    Test it.


// 7. Argument Labels and Parameter Names:
//    Write a function `greet(person name: String, nicelyFrom city: String)`
//    that prints a greeting like: "Hello [name]! Greetings from [city]."
//    The call should look like: `greet(person: "Alice", nicelyFrom: "London")`.
//    Test it.


// 8. Omitting Argument Labels:
//    Write a function `add(_ a: Int, _ b: Int) -> Int` that adds two integers.
//    The call should look like: `add(5, 3)`.
//    Test it.


// 9. Default Parameter Values:
//    Write a function `sendMessage(_ message: String, to recipient: String = "Support")`
//    that prints "Sending '[message]' to [recipient]".
//    Test it by calling it:
//    - With only a message (it should go to "Support").
//    - With both a message and a specific recipient.


// 10. Variadic Parameters:
//     Write a function `findMax(_ numbers: Int...) -> Int?` that takes a variable number of integers
//     and returns the maximum number. If no numbers are provided, it should return `nil`.
//     Test it with several numbers, a single number, and no numbers.


// 11. In-Out Parameters:
//     Write a function `squareInPlace(_ number: inout Int)` that squares the number passed to it
//     and modifies the original variable.
//     Declare an integer variable, pass it to the function, and print its value before and after the call.


// 12. Function Types & Higher-Order Functions:
//     a. Define a function type `StringOperation` that represents a function taking two Strings and returning a String.
//     b. Write two functions that match this type:
//        - `concatenateStrings(_ s1: String, _ s2: String) -> String`
//        - `compareAndReturnLonger(_ s1: String, _ s2: String) -> String`
//     c. Write a higher-order function `processStrings(s1: String, s2: String, using operation: StringOperation) -> String`
//        that takes two strings and a `StringOperation` function, and returns the result of applying the operation.
//     d. Test `processStrings` with both of your operation functions.

```
