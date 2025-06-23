// Solution for Exercise 03: Control Flow and Functions

// --- Control Flow ---

// 1. If-Else:
print("--- 1. If-Else ---")
func checkTemperature(celsius: Double) {
    if celsius < 0 {
        print("\(celsius)°C: It's freezing!")
    } else if celsius >= 0 && celsius < 15 { // celsius < 15 is enough if previous condition was false
        print("\(celsius)°C: It's cold.")
    } else if celsius >= 15 && celsius < 25 { // celsius < 25 is enough
        print("\(celsius)°C: It's pleasant.")
    } else { // celsius >= 25
        print("\(celsius)°C: It's warm!")
    }
}
checkTemperature(celsius: -5.0)
checkTemperature(celsius: 10.0)
checkTemperature(celsius: 20.0)
checkTemperature(celsius: 30.0)


// 2. Switch Statement:
print("\n--- 2. Switch Statement ---")
func getSeason(month: String) -> String {
    switch month.lowercased() { // Use lowercased for case-insensitivity
    case "december", "january", "february":
        return "Winter"
    case "march", "april", "may":
        return "Spring"
    case "june", "july", "august":
        return "Summer"
    case "september", "october", "november":
        return "Autumn" // or "Fall"
    default:
        return "Invalid month"
    }
}
print("Season for January: \(getSeason(month: "January"))")
print("Season for June: \(getSeason(month: "June"))")
print("Season for October: \(getSeason(month: "OCTOBER"))") // Test case-insensitivity
print("Season for Swiftember: \(getSeason(month: "Swiftember"))")


// 3. For-In Loop:
print("\n--- 3. For-In Loop ---")
//    a. Create an array of your favorite numbers (at least 5 integers).
let favoriteNumbers = [7, 42, 13, 21, 8]
print("a. Favorite numbers: \(favoriteNumbers)")

//    b. Use a for-in loop to iterate through the array and print each number squared (number * number).
print("b. Squared numbers:")
for number in favoriteNumbers {
    print("   \(number) squared is \(number * number)")
}

//    c. Given a dictionary `studentScores = ["Alice": 88, "Bob": 92, "Charlie": 75, "David": 95]`,
//       use a for-in loop to print each student's name and their score.
let studentScores = ["Alice": 88, "Bob": 92, "Charlie": 75, "David": 95]
print("c. Student scores:")
for (student, score) in studentScores {
    print("   \(student) scored \(score)")
}


// 4. While Loop:
print("\n--- 4. While Loop ---")
func countdown(from start: Int) {
    var current = start
    while current > 0 {
        print(current)
        current -= 1
    }
    print("Blast off!")
}
countdown(from: 3)


// 5. Guard Statement:
print("\n--- 5. Guard Statement ---")
func processOrder(item: String?, quantity: Int?) {
    guard let itemName = item, !itemName.isEmpty else { // Also check if item name is not empty
        print("Order failed: Item name missing or empty.")
        return
    }
    guard let itemQuantity = quantity, itemQuantity > 0 else {
        print("Order failed: Invalid quantity for \(itemName).")
        return
    }
    print("Processing order: \(itemQuantity) of \(itemName).")
}
processOrder(item: "Apples", quantity: 5)
processOrder(item: nil, quantity: 3)
processOrder(item: "", quantity: 3) // Test empty item name
processOrder(item: "Bananas", quantity: nil)
processOrder(item: "Oranges", quantity: 0)
processOrder(item: "Pears", quantity: -2)


// --- Functions ---

// 6. Basic Function:
print("\n--- 6. Basic Function ---")
func calculateArea(width: Double, height: Double) -> Double {
    return width * height
}
let area = calculateArea(width: 10.5, height: 4.0)
print("Area of 10.5x4.0 rectangle: \(area)")


// 7. Argument Labels and Parameter Names:
print("\n--- 7. Argument Labels ---")
func greet(person name: String, nicelyFrom city: String) {
    // `name` and `city` are internal parameter names
    // `person` and `nicelyFrom` are external argument labels
    print("Hello \(name)! Greetings from \(city).")
}
greet(person: "Alice", nicelyFrom: "London")


// 8. Omitting Argument Labels:
print("\n--- 8. Omitting Argument Labels ---")
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
let sumOfTwo = add(5, 3)
print("Sum of 5 and 3 (omitted labels): \(sumOfTwo)")


// 9. Default Parameter Values:
print("\n--- 9. Default Parameter Values ---")
func sendMessage(_ message: String, to recipient: String = "Support") {
    print("Sending '\(message)' to \(recipient)")
}
sendMessage("System critical error!") // Uses default recipient "Support"
sendMessage("Need help with my account", to: "Billing") // Specifies recipient


// 10. Variadic Parameters:
print("\n--- 10. Variadic Parameters ---")
func findMax(_ numbers: Int...) -> Int? {
    if numbers.isEmpty {
        return nil
    }
    var currentMax = numbers[0] // Or Int.min
    for number in numbers {
        if number > currentMax {
            currentMax = number
        }
    }
    return currentMax
}
print("Max of 1, 5, 2, 8, 3: \(findMax(1, 5, 2, 8, 3) ?? -1)")
print("Max of 10: \(findMax(10) ?? -1)")
print("Max of no numbers: \(findMax() ?? -1)") // -1 here means nil was returned


// 11. In-Out Parameters:
print("\n--- 11. In-Out Parameters ---")
func squareInPlace(_ number: inout Int) {
    number = number * number
}
var myValue = 5
print("Original value: \(myValue)")
squareInPlace(&myValue) // Pass with &
print("Value after squareInPlace: \(myValue)")


// 12. Function Types & Higher-Order Functions:
print("\n--- 12. Function Types & Higher-Order Functions ---")
//     a. Define a function type `StringOperation` that represents a function taking two Strings and returning a String.
typealias StringOperation = (String, String) -> String

//     b. Write two functions that match this type:
//        - `concatenateStrings(_ s1: String, _ s2: String) -> String`
//        - `compareAndReturnLonger(_ s1: String, _ s2: String) -> String`
func concatenateStrings(_ s1: String, _ s2: String) -> String {
    return s1 + s2
}
func compareAndReturnLonger(_ s1: String, _ s2: String) -> String {
    return s1.count >= s2.count ? s1 : s2
}

//     c. Write a higher-order function `processStrings(s1: String, s2: String, using operation: StringOperation) -> String`
//        that takes two strings and a `StringOperation` function, and returns the result of applying the operation.
func processStrings(s1: String, s2: String, using operation: StringOperation) -> String {
    return operation(s1, s2)
}

//     d. Test `processStrings` with both of your operation functions.
let string1 = "Hello"
let string2 = "Worlddd"

let concatenated = processStrings(s1: string1, s2: string2, using: concatenateStrings)
print("Concatenated: \(concatenated)")

let longerString = processStrings(s1: string1, s2: string2, using: compareAndReturnLonger)
print("Longer string: \(longerString)")
```
