// Swift for Python Developers - Example 03: Operators

// --- Basic Arithmetic Operators ---
// These are very similar to Python.
let a = 10
let b = 3

print("Arithmetic:")
print("\(a) + \(b) = \(a + b)") // Addition
print("\(a) - \(b) = \(a - b)") // Subtraction
print("\(a) * \(b) = \(a * b)") // Multiplication

// Division:
// - For integers, it's integer division (truncates)
print("\(a) / \(b) = \(a / b)") // Integer division: 10 / 3 = 3
// - For floating-point division, at least one operand must be a float/double
let c: Double = 10.0
let d: Double = 3.0
print("\(c) / \(d) = \(c / d)") // Floating-point division: 10.0 / 3.0 = 3.333...
print("\(Double(a)) / \(Double(b)) = \(Double(a) / Double(b))") // Explicit conversion

// Remainder Operator (Modulo)
// Works for integers and floating-point numbers.
print("\(a) % \(b) = \(a % b)") // Remainder: 10 % 3 = 1
print("\(c) % \(d) = \(c.truncatingRemainder(dividingBy: d))") // For doubles: 10.0 % 3.0 = 1.0
// Note: For floating point remainder, Swift's % operator is more like a C-style fmod.
// The `truncatingRemainder(dividingBy:)` method behaves like Python's % for floats.

// Unary Minus Operator
let negativeFive = -5
print("Negative five: \(negativeFive)")

// Unary Plus Operator (does nothing, but exists for symmetry)
let positiveThree = +3
print("Positive three: \(positiveThree)")


// --- Compound Assignment Operators ---
// Similar to Python (e.g., +=, -=, *=, /=)
var score = 100
score += 10 // score is now 110 (score = score + 10)
print("Score after += 10: \(score)")
score -= 20 // score is now 90
print("Score after -= 20: \(score)")
score *= 2  // score is now 180
print("Score after *= 2: \(score)")
score /= 3  // score is now 60
print("Score after /= 3: \(score)")
score %= 7  // score is now 4 (60 % 7 = 4)
print("Score after %= 7: \(score)")

// Swift does NOT have increment (++) or decrement (--) operators.
// Use `variable += 1` or `variable -= 1`.


// --- Comparison Operators ---
// Similar to Python. Result is a Bool.
print("\nComparison:")
print("1 == 1: \(1 == 1)")  // Equal to
print("2 != 1: \(2 != 1)")  // Not equal to
print("2 > 1: \(2 > 1)")   // Greater than
print("1 < 2: \(1 < 2)")   // Less than
print("1 >= 1: \(1 >= 1)")  // Greater than or equal to
print("2 <= 1: \(2 <= 1)")  // Less than or equal to

// Identity Operators (for class instances)
// `===` (identical to) and `!==` (not identical to) check if two object references
// refer to the exact same instance. Python uses `is` and `is not`.
class MyObject {
    var id: Int
    init(id: Int) { self.id = id }
}
let obj1 = MyObject(id: 1)
let obj2 = MyObject(id: 1)
let obj3 = obj1

print("obj1 === obj2: \(obj1 === obj2)") // false (different instances)
print("obj1 === obj3: \(obj1 === obj3)") // true (same instance)
print("obj1 !== obj2: \(obj1 !== obj2)") // true

// Tuples can be compared if their elements are comparable (lexicographical comparison)
print("(1, \"apple\") < (2, \"zebra\"): \((1, "apple") < (2, "zebra"))")   // true, because 1 < 2
print("(3, \"apple\") < (3, \"bird\"): \((3, "apple") < (3, "bird"))")     // true, because "apple" < "bird"
print("(4, \"zebra\") == (4, \"zebra\"): \((4, "zebra") == (4, "zebra"))") // true
// print((1, "apple") < (1, true)) // Error: Bool is not comparable with < or >


// --- Ternary Conditional Operator ---
// `question ? answer1 : answer2`
// Similar to Python's `answer1 if condition else answer2`
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is 40 + 50 = 90 if hasHeader is true
// rowHeight is 40 + 20 = 60 if hasHeader is false
print("Row height: \(rowHeight)")


// --- Nil-Coalescing Operator (`??`) ---
// `a ?? b` unwraps optional `a` if it contains a value, or returns `b` if `a` is `nil`.
// Similar to Python's `a or b` if `a` could be `None`, but safer for types where `0` or `False` are valid values.
let defaultColorName = "red"
var userDefinedColorName: String? // = nil
// userDefinedColorName = "blue" // Uncomment to see this value used

var colorNameToUse = userDefinedColorName ?? defaultColorName
print("Color to use: \(colorNameToUse)") // "red" if userDefinedColorName is nil, "blue" otherwise.

// Chaining nil-coalescing operators
var optionalNickname: String? = nil
var optionalFullName: String? = "John Appleseed"
var displayName = optionalNickname ?? optionalFullName ?? "Guest"
print("Display name: \(displayName)") // "John Appleseed"

optionalFullName = nil
displayName = optionalNickname ?? optionalFullName ?? "Guest"
print("Display name (both nil): \(displayName)") // "Guest"


// --- Range Operators ---
// Python uses `range()` function and slicing. Swift has dedicated operators.

// Closed Range Operator (`a...b`) -> includes both `a` and `b`
print("\nRanges:")
for index in 1...5 { // 1, 2, 3, 4, 5
    print(index, terminator: " ")
}
print()

// Half-Open Range Operator (`a..<b`) -> includes `a` up to, but not including, `b`
for index in 1..<5 { // 1, 2, 3, 4
    print(index, terminator: " ")
}
print()

// One-Sided Ranges (can be used for array slicing, etc.)
let names = ["Anna", "Alex", "Brian", "Jack", "Zoe"]
print("Names: \(names)")

let firstTwo = names[..<2] // From the beginning up to (not including) index 2: ["Anna", "Alex"]
print("First two: \(firstTwo)")

let fromBrianOn = names[2...] // From index 2 to the end: ["Brian", "Jack", "Zoe"]
print("From Brian on: \(fromBrianOn)")

let upToJack = names[...3] // From the beginning up to (and including) index 3: ["Anna", "Alex", "Brian", "Jack"]
print("Up to Jack: \(upToJack)")

// You can check if a range contains a value
let range = 1...10
print("Does 1...10 contain 5? \(range.contains(5))")   // true
print("Does 1...10 contain 11? \(range.contains(11))") // false

let partialRangeFrom = names[2...]
// print(partialRangeFrom.contains("Alex")) // Error: PartialRangeFrom does not have contains, need a concrete type
// Use on the original array with the range concept:
if let brianIndex = names.firstIndex(of: "Brian"), partialRangeFrom.startIndex <= brianIndex {
    print("Brian is in the partial range from index 2.")
}


// --- Logical Operators ---
// `!` (Logical NOT), `&&` (Logical AND), `||` (Logical OR)
// Similar to Python's `not`, `and`, `or`.
print("\nLogical:")
let allowedEntry = false
if !allowedEntry {
    print("Entry is not allowed.") // Prints
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED.") // Prints
}

let hasDoorKey = false
let knowsOverrideCode = true
if hasDoorKey || knowsOverrideCode {
    print("Welcome (using OR)!") // Prints
} else {
    print("ACCESS DENIED (using OR).")
}

// Combining Logical Operators (parentheses for clarity and precedence)
if (enteredDoorCode && passedRetinaScan) || knowsOverrideCode {
    print("Welcome (combined logic)!") // Prints
} else {
    print("ACCESS DENIED (combined logic).")
}


// --- Bitwise Operators (less common in typical app dev, but exist) ---
// `&` (AND), `|` (OR), `^` (XOR), `~` (NOT), `<<` (Left Shift), `>>` (Right Shift)
// Python has similar operators.
print("\nBitwise:")
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // 0b11110000
print("Initial: \(String(initialBits, radix: 2)), Inverted: \(String(invertedBits, radix: 2))")

let firstFourBits: UInt8  = 0b11110000
let lastFourBits: UInt8   = 0b00001111
let middleFourBits = firstFourBits & lastFourBits // 0b00000000
print("AND: \(String(middleFourBits, radix: 2))")

let someBits: UInt8 = 0b00010100
let moreBits: UInt8 = 0b00000101
let combinedbits = someBits | moreBits // 0b00010101
print("OR: \(String(combinedbits, radix: 2))")

let xorBits = someBits ^ moreBits // 0b00010001
print("XOR: \(String(xorBits, radix: 2))")

let shiftBits: UInt8 = 4 // 0b00000100
let leftShift = shiftBits << 1   // 0b00001000 (8)
let rightShift = shiftBits >> 2  // 0b00000001 (1)
print("Shift: \(shiftBits), Left: \(leftShift), Right: \(rightShift)")


// --- Overflow Operators (&+, &-, &*) ---
// By default, Swift traps on integer overflow (runtime error).
// If you want overflow behavior (wrapping), use overflow operators.
var potentialOverflow: UInt8 = UInt8.max // 255
// potentialOverflow = potentialOverflow + 1 // This would crash

potentialOverflow = potentialOverflow &+ 1 // Wraps to 0
print("Overflow add: \(potentialOverflow)")

potentialOverflow = UInt8.min // 0
// potentialOverflow = potentialOverflow - 1 // This would crash

potentialOverflow = potentialOverflow &- 1 // Wraps to 255
print("Overflow subtract: \(potentialOverflow)")

// There's also &* for multiplication. Division and remainder do not have overflow variants.


// --- Operator Precedence and Associativity ---
// Swift has standard operator precedence rules (e.g., * / before + -).
// Use parentheses `()` to clarify or override precedence.
let result = 2 + 3 * 4 // 2 + 12 = 14 (multiplication first)
print("2 + 3 * 4 = \(result)")
let resultWithParens = (2 + 3) * 4 // 5 * 4 = 20 (addition first due to parentheses)
print("(2 + 3) * 4 = \(resultWithParens)")
// Full list in Swift documentation.


// --- Custom Operators ---
// Swift allows you to define your own custom infix, prefix, postfix, and assignment operators.
// This is an advanced topic. Example:
prefix operator √ // Define a new prefix operator for square root

prefix func √ (number: Double) -> Double {
    return sqrt(number)
}
let sqrtValue = √25.0
print("Custom square root of 25: \(sqrtValue)")

// It's generally recommended to use custom operators sparingly to maintain code readability.
```
