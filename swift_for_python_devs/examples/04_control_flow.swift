// Swift for Python Developers - Example 04: Control Flow

// --- Conditional Statements ---

// If Statement
// Parentheses around the condition are optional. Braces `{}` are required.
print("--- If Statements ---")
let temperatureInFahrenheit = 75
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// Python:
// if temperature_in_fahrenheit <= 32:
//     print("It's very cold.")
// elif temperature_in_fahrenheit >= 86:
//     print("It's really warm.")
// else:
//     print("It's not that cold.")

// Guard Statement
// Provides an early exit if a condition is not met.
// Useful for checking prerequisites. Variables/constants assigned in a guard's
// condition (e.g., with optional binding) are available for the rest of the scope.
print("\n--- Guard Statement ---")
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        print("No name provided.")
        return // Must exit the current scope (function, loop, etc.)
    }

    print("Hello, \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "Alice", "location": "Wonderland"])
greet(person: ["name": "Bob"])
greet(person: [:])


// Switch Statement
// Very powerful in Swift. Must be exhaustive (cover all possible values or have a `default` case).
// No implicit fallthrough (unlike C-like languages). Use `fallthrough` keyword if needed.
print("\n--- Switch Statement ---")
let someCharacter: Character = "z"
switch someCharacter {
case "a", "A": // Compound case
    print("The first letter of the alphabet")
case "z", "Z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// Python (3.10+ has match-case, otherwise if-elif-else)
// match some_character:
//     case "a" | "A":
//         print("The first letter")
//     case "z" | "Z":
//         print("The last letter")
//     case _:
//         print("Some other character")

// Interval Matching (Ranges)
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5: // Half-open range
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default: // Must be exhaustive
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

// Tuple Matching
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0): // Wildcard: matches any value for the first element
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2): // Range matching in tuple elements
    print("\(somePoint) is inside the 2x2 box")
default:
    print("\(somePoint) is outside of the box")
}

// Value Bindings in Switch Cases
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0): // Bind the value of the first element to 'x'
    print("On the x-axis with an x value of \(x)")
case (0, let y): // Bind the value of the second element to 'y'
    print("On the y-axis with a y value of \(y)")
case let (x, y) where x == y: // 'where' clause for additional conditions
    print("At (\(x), \(y)) on the line x == y")
case let (x, y): // Binds both values
    print("Somewhere else at (\(x), \(y))")
}

// Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough // Intentionally falls into the default case
default:
    description += " an integer."
}
print(description)


// --- Loops ---

// For-In Loop
// Iterates over sequences like arrays, ranges, strings, dictionaries.
print("\n--- For-In Loops ---")
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// Python:
// for name in names:
//     print(f"Hello, {name}!")

// Iterating over a Dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs.")
}

// Iterating over a Range
for index in 1...5 { // Closed range (1 to 5 inclusive)
    print("\(index) times 5 is \(index * 5)")
}

// If you don't need the value from the sequence, use an underscore `_`
let base = 3
let power = 4
var answer = 1
for _ in 1...power { // We don't need the loop counter value itself
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// `stride(from:to:by:)` and `stride(from:through:by:)` for more control
print("Stride from 0 to 10 (exclusive) by 2:")
for num in stride(from: 0, to: 10, by: 2) { // 0, 2, 4, 6, 8
    print(num, terminator: " ")
}
print()

print("Stride from 0 through 10 (inclusive) by 2:")
for num in stride(from: 0, through: 10, by: 2) { // 0, 2, 4, 6, 8, 10
    print(num, terminator: " ")
}
print()


// While Loop
// Condition is evaluated *before* each iteration.
print("\n--- While Loops ---")
var i = 0
while i < 5 {
    print("Current i (while): \(i)")
    i += 1
}
// Python:
// i = 0
// while i < 5:
//     print(f"Current i (while): {i}")
//     i += 1

// Repeat-While Loop
// Condition is evaluated *after* each iteration. Loop body always executes at least once.
// (Similar to `do-while` in other languages)
print("\n--- Repeat-While Loops ---")
var j = 0
repeat {
    print("Current j (repeat-while): \(j)")
    j += 1
} while j < 5

var k = 5 // Condition (k < 5) is initially false
repeat {
    print("Current k (repeat-while, executes once): \(k)") // This will print once
    k += 1
} while k < 5


// --- Control Transfer Statements ---
// `continue`, `break`, `fallthrough` (seen in switch), `return` (from functions), `throw` (for errors)

print("\n--- Control Transfer ---")
// Continue: stop current iteration, start next one
print("Continue example:")
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue // Skip vowels and spaces
    }
    puzzleOutput.append(character)
}
print("Puzzle output: \(puzzleOutput)") // "grtmndsthnklk"

// Break: exit loop or switch statement immediately
print("\nBreak example:")
let numberToFind = 7
var found = false
for row in 0..<5 {
    for col in 0..<5 {
        let currentValue = row * 5 + col
        if currentValue == numberToFind {
            print("Found \(numberToFind) at (\(row), \(col))")
            found = true
            break // Exits the inner for-in loop (col)
        }
    }
    if found {
        break // Exits the outer for-in loop (row)
    }
}

// Labeled Statements (to specify which loop/switch `break` or `continue` applies to)
print("\nLabeled break example:")
gameLoop: while true { // Label the outer loop
    let diceRoll = Int.random(in: 1...6)
    print("Rolled a \(diceRoll)")
    switch diceRoll {
    case 6:
        print("You win! Rolled a 6.")
        break gameLoop // Break out of the 'gameLoop' (the while loop)
    case 1:
        print("Rolled a 1. Bad luck, try again next turn.")
        // Implicitly continues to next iteration of while loop
    default:
        print("Keep trying...")
        // Implicitly continues to next iteration of while loop
    }
    // Simulate some delay or condition to eventually end the loop if not broken
    if Int.random(in: 1...10) == 10 { // Failsafe break
        print("Failsafe break from gameLoop.")
        break gameLoop
    }
}

// `return` is used to exit a function, covered in functions example.
// `throw` is used for error handling, covered in error handling example.

// Availability Checking (API availability)
// Ensures code only runs on appropriate OS versions.
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and macOS 10.12 APIs on macOS
    print("Running on a newer OS version that supports specific APIs.")
} else {
    // Fall back to earlier iOS and macOS APIs
    print("Running on an older OS version. Using fallback APIs.")
}
// The `*` is required and indicates that on any other platform,
// the body of the if executes on the minimum deployment target specified by your project.
```
