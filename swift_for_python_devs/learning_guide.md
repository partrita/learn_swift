# Swift Learning Guide for Python Developers

This guide will walk you through the fundamentals of Swift, drawing comparisons to Python to help you leverage your existing knowledge.

## Table of Contents

1.  [Introduction](#introduction)
    *   [What is Swift?](#what-is-swift)
    *   [Why Swift?](#why-swift)
    *   [Swift vs. Python: Key Differences](#swift-vs-python-key-differences)
2.  [Getting Started](#getting-started)
    *   [Playgrounds](#playgrounds)
    *   [Basic Syntax](#basic-syntax)
3.  [Variables and Constants](#variables-and-constants)
    *   [Declaration](#declaration)
    *   [Type Inference](#type-inference)
    *   [Type Safety](#type-safety)
    *   [Naming Conventions](#naming-conventions)
4.  [Data Types](#data-types)
    *   [Basic Types (Int, Double, Float, Bool, String)](#basic-types)
    *   [Collection Types (Array, Dictionary, Set)](#collection-types)
    *   [Tuples](#tuples)
    *   [Optionals](#optionals)
5.  [Operators](#operators)
    *   [Arithmetic, Comparison, Logical](#arithmetic-comparison-logical)
    *   [Nil-Coalescing Operator](#nil-coalescing-operator)
    *   [Range Operators](#range-operators)
6.  [Control Flow](#control-flow)
    *   [Conditional Statements (if, else if, else, switch)](#conditional-statements)
    *   [Loops (for-in, while, repeat-while)](#loops)
    *   [Control Transfer Statements (continue, break, fallthrough, return, throw)](#control-transfer-statements)
7.  [Functions](#functions)
    *   [Defining and Calling Functions](#defining-and-calling-functions)
    *   [Parameters and Return Values](#parameters-and-return-values)
    *   [Argument Labels and Parameter Names](#argument-labels-and-parameter-names)
    *   [Functions as First-Class Citizens](#functions-as-first-class-citizens)
    *   [Closures](#closures)
8.  [Object-Oriented Programming (OOP)](#object-oriented-programming-oop)
    *   [Classes and Structures (structs)](#classes-and-structures-structs)
    *   [Properties (Stored and Computed)](#properties-stored-and-computed)
    *   [Methods (Instance and Type)](#methods-instance-and-type)
    *   [Initialization (Constructors)](#initialization-constructors)
    *   [Deinitialization (Destructors)](#deinitialization-destructors)
    *   [Inheritance](#inheritance)
    *   [Protocols (Interfaces)](#protocols-interfaces)
    *   [Extensions](#extensions)
9.  [Error Handling](#error-handling)
    *   [Representing and Throwing Errors](#representing-and-throwing-errors)
    *   [Handling Errors (do-catch, try?, try!)](#handling-errors-do-catch-try-try)
10. [Memory Management (ARC)](#memory-management-arc)
    *   [Automatic Reference Counting](#automatic-reference-counting)
11. [Where to Go From Here](#where-to-go-from-here)

---

## 1. Introduction

### What is Swift?
Swift is a powerful and intuitive programming language for macOS, iOS, watchOS, tvOS, and beyond. It's developed by Apple Inc. and the open-source community.

### Why Swift?
- **Safe:** Designed to eliminate entire classes of common programming errors.
- **Fast:** Performance comparable to C++.
- **Modern:** Features like optionals, generics, and closures make it expressive and enjoyable.
- **Interoperable:** Works seamlessly with Objective-C code.

### Swift vs. Python: Key Differences

| Feature          | Python                                     | Swift                                          |
|------------------|--------------------------------------------|------------------------------------------------|
| **Typing**       | Dynamically typed                          | Statically typed (with type inference)         |
| **Performance**  | Generally slower (interpreted)             | Generally faster (compiled)                    |
| **Error Handling** | Exceptions (try-except)                    | Error handling (do-catch, optionals)           |
| **Null Safety**  | `None` type, runtime errors if not handled | Optionals (`?`, `!`) for explicit null handling |
| **Syntax**       | Indentation-sensitive                      | Brace-based (`{}`)                             |
| **Compilation**  | Interpreted (mostly)                       | Compiled                                       |
| **Mobile Dev**   | Limited native support (Kivy, BeeWare)     | Primary language for iOS, macOS, etc.          |
| **Concurrency**  | GIL can be a bottleneck for true parallelism | Built-in support for concurrency (Grand Central Dispatch, async/await) |

## 2. Getting Started

### Playgrounds
Xcode Playgrounds provide an interactive environment to experiment with Swift code and see results immediately. This is similar to using a Python interpreter or Jupyter Notebook.

### Basic Syntax
- Statements are typically terminated by a newline. Semicolons (`;`) are optional unless you write multiple statements on a single line.
- Code blocks are enclosed in curly braces `{}`.
- Comments:
    - Single-line: `// This is a comment`
    - Multi-line: `/* This is a multi-line comment */`

**Python:**
```python
# This is a comment
name = "Alice"
if name == "Alice":
    print("Hello, Alice!") # Indentation matters
```

**Swift:**
```swift
// This is a comment
var name = "Alice" // Variable declaration
if name == "Alice" { // Braces for scope
    print("Hello, Alice!") // Semicolon optional
}
```

## 3. Variables and Constants

### Declaration
- **Constants** are declared with `let`. Their value cannot be changed after assignment. (Think of Python variables assigned once).
- **Variables** are declared with `var`. Their value can be changed.

**Python:**
```python
# Python doesn't have a strict concept of constants by language keyword
# Conventionally, uppercase names suggest constants
MAX_CONNECTIONS = 10
name = "Bob"
name = "Charlie"
```

**Swift:**
```swift
let maxConnections = 10 // Constant
// maxConnections = 5 // This would cause a compile-time error

var name = "Bob"     // Variable
name = "Charlie"
```

### Type Inference
Swift can often infer the type of a variable or constant from its initial value.

**Python:**
```python
age = 30 # type is int
pi = 3.14 # type is float
is_active = True # type is bool
message = "Hello" # type is str
```

**Swift:**
```swift
var age = 30          // Inferred as Int
let pi = 3.14         // Inferred as Double
var isActive = true   // Inferred as Bool
let message = "Hello" // Inferred as String
```

You can also explicitly declare the type using a colon (`:`).

**Swift:**
```swift
var score: Int = 100
let gravity: Double = 9.8
var welcomeMessage: String
welcomeMessage = "Hi there!"
```

### Type Safety
Swift is a type-safe language. This means the compiler checks types at compile time and flags type mismatches as errors. You cannot assign a value of one type to a variable of another type without explicit conversion.

**Python (Dynamic Typing):**
```python
x = 10
x = "Python" # Allowed, x's type changes
```

**Swift (Static Typing):**
```swift
var x: Int = 10
// x = "Swift" // Compile-time error: Cannot assign value of type 'String' to type 'Int'
```

### Naming Conventions
- **Camel Case:** Swift uses camel case for variable, constant, function, and method names (e.g., `myVariableName`, `calculateArea`).
- **Upper Camel Case (Pascal Case):** For type names like classes, structures, enums, and protocols (e.g., `MyClass`, `String`, `Int`).

This is similar to Python's PEP 8, which recommends `snake_case` for variables and functions, and `CapWords` (PascalCase) for classes.

## 4. Data Types

### Basic Types

| Swift Type | Python Equivalent | Description                     | Example (Swift)                 |
|------------|-------------------|---------------------------------|---------------------------------|
| `Int`      | `int`             | Whole numbers                   | `let age: Int = 25`             |
| `Double`   | `float`           | 64-bit floating-point numbers   | `let pi: Double = 3.14159`      |
| `Float`    | `float`           | 32-bit floating-point numbers   | `let price: Float = 19.99`      |
| `Bool`     | `bool`            | `true` or `false`               | `let isValid: Bool = true`      |
| `String`   | `str`             | Sequence of characters          | `let greeting: String = "Hello"`|
| `Character`| (single char str) | Single character                | `let initial: Character = "J"`  |


**String Interpolation:**
Similar to Python's f-strings.

**Python:**
```python
name = "World"
greeting = f"Hello, {name}!"
```

**Swift:**
```swift
let name = "World"
let greeting = "Hello, \(name)!" // "Hello, World!"
```

### Collection Types

#### Array
Ordered collections of values of the same type.

**Python (List):**
```python
numbers = [1, 2, 3, 4, 5]
names = ["Alice", "Bob", "Charlie"]
mixed = [1, "hello", True] # Python lists can hold mixed types
```

**Swift (Array):**
```swift
var numbers: [Int] = [1, 2, 3, 4, 5]
var names = ["Alice", "Bob", "Charlie"] // Inferred as [String]
// var mixed = [1, "hello", true] // Error: Heterogeneous collection literal could only be inferred to '[Any]'

// Empty array
var emptyIntArray: [Int] = []
var anotherEmptyArray = [String]()
```
- Accessing elements: `numbers[0]` (both languages)
- Adding elements: `numbers.append(6)` (Swift) vs `numbers.append(6)` (Python)
- Length/Count: `numbers.count` (Swift) vs `len(numbers)` (Python)

#### Dictionary
Unordered collections of key-value pairs. Keys must be of the same type, and values must be of the same type.

**Python (dict):**
```python
person = {
    "name": "Alice",
    "age": 30,
    "city": "New York"
}
scores = {"math": 90, "science": 85}
```

**Swift (Dictionary):**
```swift
var person: [String: Any] = [ // Using Any for mixed value types, usually try to be more specific
    "name": "Alice",
    "age": 30,
    "city": "New York"
]
var scores: [String: Int] = ["math": 90, "science": 85]

// Empty dictionary
var emptyDict: [String: Int] = [:]
var anotherEmptyDict = [String: String]()
```
- Accessing values: `person["name"]` (both). In Swift, this returns an optional.
- Adding/Updating: `scores["english"] = 92` (both)
- Removing: `scores.removeValue(forKey: "math")` (Swift) vs `del scores["math"]` or `scores.pop("math")` (Python)

#### Set
Unordered collections of unique values of the same type.

**Python (set):**
```python
unique_numbers = {1, 2, 3, 2, 1} # {1, 2, 3}
```

**Swift (Set):**
```swift
var uniqueNumbers: Set<Int> = [1, 2, 3, 2, 1] // Becomes {1, 2, 3}
var vowels: Set<Character> = ["a", "e", "i", "o", "u"]

// Empty set
var emptySet = Set<String>()
```
- Set operations (union, intersection, etc.) are available in both.

### Tuples
A fixed-size, ordered collection of values that can be of different types.

**Python:**
```python
point = (10, 20)
http_status = (404, "Not Found")
x, y = point
code, message = http_status
```

**Swift:**
```swift
let point = (10, 20)
let httpStatus = (404, "Not Found")

// Accessing elements
let x = point.0       // 10
let y = point.1       // 20

let code = httpStatus.0 // 404
let message = httpStatus.1 // "Not Found"

// Naming tuple elements
let namedPoint = (x: 10, y: 20)
print(namedPoint.x) // 10

// Decomposing a tuple
let (statusCode, statusMessage) = httpStatus
print("Status code: \(statusCode)")
```
Tuples in Swift are more powerful, allowing named elements for clarity.

### Optionals
Swift introduces the concept of "optionals" to handle the absence of a value. An optional variable can either hold a value or be `nil` (similar to Python's `None`). This is a core feature for writing safe code by making you explicitly consider the possibility of missing values.

**Python:**
```python
def find_user(user_id):
    if user_id == 1:
        return {"name": "Alice"}
    else:
        return None # Indicates no user found

user = find_user(2)
if user is not None:
    print(user["name"])
else:
    print("User not found.")
```

**Swift:**
```swift
var name: String? // This String variable can hold a String or nil
name = "John Doe"
name = nil

// Optional String - can be a String or nil
var optionalName: String? = "Jane Doe"
// var optionalName: String? = nil

// Forced Unwrapping (use with caution!)
// If optionalName were nil, this would crash.
// let unwrappedName = optionalName!
// print("Hello, \(unwrappedName)")

// Optional Binding (safer way to unwrap)
if let unwrappedName = optionalName {
    print("Hello, \(unwrappedName)") // Only executes if optionalName has a value
} else {
    print("Name is nil.")
}

// Optional Chaining
struct User { var profile: Profile? }
struct Profile { var name: String? }
let user: User? = User(profile: Profile(name: "Alice"))

if let userName = user?.profile?.name { // Safely access nested optionals
    print("User's name is \(userName)")
} else {
    print("Could not retrieve user's name.")
}

// Nil-Coalescing Operator (covered later)
let currentName = optionalName ?? "Guest" // If optionalName is nil, use "Guest"
print("Current user: \(currentName)")
```
Understanding optionals is crucial in Swift.

## 5. Operators

### Arithmetic, Comparison, Logical
These are very similar to Python.

- **Arithmetic:** `+`, `-`, `*`, `/`, `%` (remainder)
- **Comparison:** `==`, `!=`, `>`, `<`, `>=`, `<=`
- **Logical:** `&&` (logical AND), `||` (logical OR), `!` (logical NOT)

**Python:**
```python
a = 10
b = 3
print(a / b)  # 3.333... (float division)
print(a // b) # 3 (integer division)
print(a % b)  # 1

True and False # False
not True # False
```

**Swift:**
```swift
let a = 10
let b = 3
// print(a / b) // Error if a and b are Int. Division of Ints results in Int.
print(Double(a) / Double(b)) // 3.333... (must convert to Double for float division)
print(a / b) // 3 (integer division)
print(a % b) // 1

true && false // false
!true // false
```
**Note on Division:** In Swift, `Int / Int` results in an `Int` (truncating). For floating-point division, at least one operand must be a floating-point type.

### Nil-Coalescing Operator (`??`)
Provides a default value for an optional if it's `nil`.

**Python (often done with `or` or an `if` statement):**
```python
name = None
username = name or "Guest" # "Guest"

def get_setting(key, default_value):
    # ... fetch setting ...
    if setting_value is None:
        return default_value
    return setting_value
```

**Swift:**
```swift
let defaultColorName = "red"
var userDefinedColorName: String? // Is nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// colorNameToUse is "red" because userDefinedColorName is nil

userDefinedColorName = "blue"
colorNameToUse = userDefinedColorName ?? defaultColorName
// colorNameToUse is "blue"
```
Syntax: `a ?? b` is equivalent to `a != nil ? a! : b`.

### Range Operators
- **Closed Range Operator (`a...b`):** Includes values from `a` through `b`. `1...5` represents 1, 2, 3, 4, 5.
- **Half-Open Range Operator (`a..<b`):** Includes values from `a` up to, but not including, `b`. `1..<5` represents 1, 2, 3, 4.
- **One-Sided Ranges:** `a...`, `...a`, `..<a`.

**Python (`range()`):**
```python
for i in range(1, 6): # 1, 2, 3, 4, 5 (similar to 1...5)
    print(i)

for i in range(5): # 0, 1, 2, 3, 4 (similar to 0..<5)
    print(i)

my_list = [10, 20, 30, 40, 50]
my_list[1:3] # [20, 30] (slicing, similar to half-open)
```

**Swift:**
```swift
for index in 1...5 {
    print(index) // 1, 2, 3, 4, 5
}

for index in 1..<5 {
    print(index) // 1, 2, 3, 4
}

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names[0...2] { // "Anna", "Alex", "Brian"
    print(name)
}
for name in names[..<2] { // "Anna", "Alex"
    print(name)
}
for name in names[2...] { // "Brian", "Jack"
    print(name)
}
```

## 6. Control Flow

### Conditional Statements

#### `if`, `else if`, `else`
Syntax is similar, but Swift requires curly braces `{}` even for single statements and parentheses around conditions are optional but often used for clarity.

**Python:**
```python
temperature = 25
if temperature > 30:
    print("It's hot!")
elif temperature > 20:
    print("It's warm.")
else:
    print("It's cool.")
```

**Swift:**
```swift
let temperature = 25
if temperature > 30 {
    print("It's hot!")
} else if temperature > 20 {
    print("It's warm.")
} else {
    print("It's cool.")
}
```

#### `switch`
Swift's `switch` statement is very powerful and flexible compared to Python's lack of a direct `switch` (though Python 3.10+ has `match-case`).
- `switch` statements in Swift must be exhaustive (cover all possible values) or include a `default` case.
- They don't "fall through" by default (no `break` needed typically). `fallthrough` keyword can be used for C-style fall-through.
- Can match against various patterns, including ranges, tuples, and value bindings.

**Python (using `if-elif-else` or `match-case` in 3.10+):**
```python
# Using if-elif-else
value = "a"
if value == "a":
    print("It's A")
elif value == "b":
    print("It's B")
else:
    print("Something else")

# Python 3.10+ match-case
# match value:
#     case "a":
#         print("It's A")
#     case "b":
#         print("It's B")
#     case _:
#         print("Something else")
```

**Swift:**
```swift
let value = "a"
switch value {
case "a":
    print("It's A")
case "b", "c": // Compound case
    print("It's B or C")
default:
    print("Something else")
}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).") // "There are dozens of moons orbiting Saturn."

// Matching tuples and value binding
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0): // Value binding with wildcard
    print("\(somePoint) is on the x-axis")
case (0, let y): // Value binding 'y'
    print("\(somePoint) is on the y-axis at \(y)")
case (-2...2, -2...2):
    print("\(somePoint) is inside the 2x2 box")
default:
    print("\(somePoint) is outside of the box")
}
```

### Loops

#### `for-in` Loop
Iterates over a sequence (array, range, string, etc.).

**Python:**
```python
numbers = [1, 2, 3]
for num in numbers:
    print(num)

for char in "hello":
    print(char)
```

**Swift:**
```swift
let numbers = [1, 2, 3]
for num in numbers {
    print(num)
}

for char in "hello" {
    print(char)
}

// Iterating over a dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// If you don't need the value from the sequence:
for _ in 1...3 { // Use underscore if loop variable is not needed
    print("Looping")
}
```

#### `while` Loop
Executes a set of statements as long as a condition is true.

**Python:**
```python
count = 0
while count < 5:
    print(count)
    count += 1
```

**Swift:**
```swift
var count = 0
while count < 5 {
    print(count)
    count += 1 // Swift does not have ++ or -- operators
}
```

#### `repeat-while` Loop
Similar to a `do-while` loop in other languages. The loop body is executed at least once before the condition is checked.

**Python (emulated with `while True` and `break`):**
```python
# No direct repeat-while, often emulated:
# count = 0
# while True:
#     print(count)
#     count += 1
#     if not (count < 5):
#         break
```

**Swift:**
```swift
var i = 0
repeat {
    print("Current value of i is \(i)")
    i += 1
} while i < 5
// This loop will print for i = 0, 1, 2, 3, 4
```

### Control Transfer Statements
- **`continue`**: Skips the current iteration of a loop and proceeds to the next. (Same in Python)
- **`break`**: Exits a loop or `switch` statement immediately. (Same in Python)
- **`fallthrough`**: In a `switch` statement, causes execution to continue into the next case block (C-style behavior).
- **`return`**: Exits a function, optionally providing a return value. (Same in Python)
- **`throw`**: Used for error handling (covered later).

**Swift Example with `fallthrough`:**
```swift
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough // Intentionally fall into default
default:
    description += " an integer."
}
print(description) // "The number 5 is a prime number, and also an integer."
```

## 7. Functions

### Defining and Calling Functions

**Python:**
```python
def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")
print(message)
```

**Swift:**
```swift
func greet(name: String) -> String { // Parameter type and return type are explicit
    return "Hello, \(name)!"
}

let message = greet(name: "Alice") // Argument label 'name' is used when calling
print(message)
```
- Swift functions use `func` keyword.
- Parameter types and return types **must** be specified.
- `->` indicates the return type. If a function doesn't return a value, you can use `-> Void` or omit it.

### Parameters and Return Values

**Multiple Parameters:**
**Python:**
```python
def add(a, b):
    return a + b
```
**Swift:**
```swift
func add(a: Int, b: Int) -> Int {
    return a + b
}
let sum = add(a: 5, b: 3)
```

**No Parameters:**
**Python:**
```python
def say_hello():
    print("Hello!")
```
**Swift:**
```swift
func sayHello() { // or func sayHello() -> Void {
    print("Hello!")
}
sayHello()
```

**Returning Tuples (Multiple Values):**
**Python:**
```python
def get_coordinates():
    return 10, 20 # Returns a tuple

x, y = get_coordinates()
```
**Swift:**
```swift
func getCoordinates() -> (Int, Int) {
    return (10, 20)
}
let coordinates = getCoordinates()
print("x: \(coordinates.0), y: \(coordinates.1)")

func getNamedCoordinates() -> (x: Int, y: Int) {
    return (x: 10, y: 20)
}
let namedCoords = getNamedCoordinates()
print("x: \(namedCoords.x), y: \(namedCoords.y)")
```

### Argument Labels and Parameter Names
By default, Swift uses parameter names as argument labels when you call a function.

```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName refers to the first parameter value
    // and secondParameterName refers to the second parameter value
}
// When calling, use the parameter names as labels:
// someFunction(firstParameterName: 1, secondParameterName: 2)
```

**Specifying Different Argument Labels:**
You can provide an external argument label different from the internal parameter name. Use `_` for no argument label.

```swift
func greet(person name: String, from hometown: String) -> String {
    // 'name' and 'hometown' are used inside the function
    return "Hello \(name)! Glad you could visit from \(hometown)."
}
// Called as:
print(greet(person: "Bill", from: "Cupertino"))
// 'person' and 'from' are the argument labels.

func subtract(_ a: Int, by b: Int) -> Int { // No label for the first parameter
    return a - b
}
let result = subtract(10, by: 3) // Call: subtract(10, by: 3)
```
This is different from Python's keyword arguments, where the label is always the parameter name.

**Default Parameter Values:**
Similar to Python.

**Python:**
```python
def power(base, exponent=2):
    return base ** exponent
```
**Swift:**
```swift
func power(base: Int, exponent: Int = 2) -> Int {
    var result = 1
    for _ in 0..<exponent {
        result *= base
    }
    return result
}
power(base: 3) // 9
power(base: 3, exponent: 3) // 27
```

**Variadic Parameters (like `*args` in Python):**
Accept zero or more values of a specified type.

**Python:**
```python
def average(*numbers):
    if not numbers:
        return 0
    return sum(numbers) / len(numbers)
```
**Swift:**
```swift
func average(_ numbers: Double...) -> Double { // numbers is [Double] inside
    if numbers.isEmpty {
        return 0.0
    }
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
average(1.0, 2.0, 3.0) // 2.0
average()              // 0.0
```

**In-Out Parameters (Modifying parameters directly, like pass-by-reference):**
Function parameters are constants by default. If you want a function to modify a parameter's value, and you want those changes to persist after the function call ends, define that parameter as an in-out parameter.
Place an ampersand (`&`) directly before a variable’s name when you pass it as an argument to an in-out parameter.

**Python (objects are passed by reference, mutable types can be changed):**
```python
def modify_list(my_list):
    my_list.append(4)

items = [1, 2, 3]
modify_list(items) # items is now [1, 2, 3, 4]
```

**Swift:**
```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt) // Pass by reference using &
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"
```

### Functions as First-Class Citizens
Like Python, functions in Swift are first-class types. You can assign them to variables/constants, pass them as arguments to other functions, and return them from functions.

**Swift:**
```swift
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts // mathFunction is of type (Int, Int) -> Int
print("Result: \(mathFunction(2, 3))") // Result: 5

func printMathResult(_ mathFunc: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Calculation result: \(mathFunc(a, b))")
}
printMathResult(addTwoInts, 10, 5) // "Calculation result: 15"

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int { // Returns a function
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
```

### Closures
Closures are self-contained blocks of functionality that can be passed around and used in your code. They are similar to Python's `lambda` functions but much more powerful and versatile, akin to blocks in Ruby or anonymous functions in JavaScript.

**Python Lambda:**
```python
numbers = [1, 2, 3, 4]
squared = list(map(lambda x: x * x, numbers)) # [1, 4, 9, 16]
```

**Swift Closures:**
Closures can capture and store references to any constants and variables from the context in which they are defined (closing over them).

General form:
```swift
{ (parameters) -> return_type in
    // statements
}
```

Example with `sorted(by:)` method:
```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// Using a defined function for sorting
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward) // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

// Using a closure expression
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Inferring Type From Context (Swift can infer types of parameters and return value)
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// Implicit Returns from Single-Expression Closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

// Shorthand Argument Names ($0, $1, $2, etc.)
reversedNames = names.sorted(by: { $0 > $1 })

// Operator Methods (if an operator function matches the required types)
reversedNames = names.sorted(by: >) // Simplest form for this case
```

**Trailing Closures:**
If a closure expression is the last argument to a function, you can write it as a *trailing closure* after the function call's parentheses. If it's the *only* argument, you can omit the parentheses entirely.

```swift
// func someFunctionThatTakesAClosure(closure: () -> Void) { /* ... */ }

// Calling with trailing closure:
// someFunctionThatTakesAClosure() {
//     // closure's body goes here
// }
// or
// someFunctionThatTakesAClosure {
//     // closure's body
// }

let numbers = [1, 2, 3, 4]
let squaredNumbers = numbers.map { number in // trailing closure
    number * number
}
print(squaredNumbers) // [1, 4, 9, 16]

let mappedNumbers = numbers.map { number -> String in // trailing closure with explicit return type
    return "Number: \(number)"
}
print(mappedNumbers) // ["Number: 1", "Number: 2", "Number: 3", "Number: 4"]
```

Closures are extensively used in Swift, especially for callbacks, asynchronous operations, and functional programming patterns.

## 8. Object-Oriented Programming (OOP)

### Classes and Structures (`struct`s)
Both classes and structs can define properties and methods.

**Key Differences:**
- **Classes are reference types:** When you assign a class instance or pass it to a function, you are working with a reference to the same existing instance. Changes made through one reference are visible through others. (Similar to how most objects work in Python).
- **Structs are value types:** When you assign a struct instance or pass it to a function, a copy of the instance is made. Changes to one copy do not affect others. (Similar to basic types like `int`, `str` in Python, or when you explicitly copy a list `new_list = old_list[:]`).

- **Inheritance:** Classes support inheritance; structs do not.
- **Deinitializers (`deinit`):** Classes can have deinitializers; structs cannot.
- **Reference Counting:** Reference counting applies only to instances of classes.

**When to use Structs?**
- Small, simple data structures.
- When you want value semantics (copies are independent).
- If they don't need to inherit from another type.
- Examples: Point, Size, Rectangle, complex numbers.

**Python (Classes):**
```python
class Dog:
    def __init__(self, name, breed): # Constructor
        self.name = name
        self.breed = breed
        self.tricks = []

    def bark(self):
        return "Woof!"

    def learn_trick(self, trick_name):
        self.tricks.append(trick_name)

my_dog = Dog("Buddy", "Golden Retriever")
print(my_dog.name)
print(my_dog.bark())
my_dog.learn_trick("sit")

another_dog_ref = my_dog # Both reference the same object
another_dog_ref.learn_trick("fetch")
print(my_dog.tricks) # ['sit', 'fetch']
```

**Swift (Class Example):**
```swift
class Dog {
    var name: String
    var breed: String
    var tricks: [String] = [] // Initialize with default empty array

    // Initializer (constructor)
    init(name: String, breed: String) {
        self.name = name // 'self' is similar to Python's self
        self.breed = breed
    }

    func bark() -> String {
        return "Woof!"
    }

    func learnTrick(_ trickName: String) {
        tricks.append(trickName)
    }
}

let myDog = Dog(name: "Buddy", breed: "Golden Retriever")
print(myDog.name)
print(myDog.bark())
myDog.learnTrick("sit")

let anotherDogRef = myDog // Both reference the same Dog instance
anotherDogRef.learnTrick("fetch")
print(myDog.tricks) // ["sit", "fetch"]
```

**Swift (Struct Example):**
```swift
struct Point {
    var x: Double
    var y: Double

    func distance(to otherPoint: Point) -> Double {
        let dx = otherPoint.x - self.x
        let dy = otherPoint.y - self.y
        return (dx*dx + dy*dy).squareRoot() // Assuming Double has squareRoot() extension
    }
}

var p1 = Point(x: 0, y: 0) // Structs get a memberwise initializer by default if you don't define custom ones
var p2 = p1 // p2 is a COPY of p1

p2.x = 10
print(p1.x) // 0.0 (p1 is unchanged)
print(p2.x) // 10.0

let p3 = Point(x:3, y:4)
// p3.x = 5 // Error: p3 is a let constant, its properties cannot be changed if it's a struct
```
If an instance of a struct is assigned to a `let` constant, its properties cannot be changed, even if they are variable properties. This is because structs are value types. For classes (reference types), you can change variable properties of a `let` constant instance.

### Properties

Properties associate values with a particular class, structure, or enumeration.

#### Stored Properties
Store constant (`let`) or variable (`var`) values as part of an instance.

```swift
struct FixedLengthRange {
    var firstValue: Int
    let length: Int // Stored property
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// The range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// The range now represents integer values 6, 7, and 8
// rangeOfThreeItems.length = 4 // Error: length is a constant stored property
```

**Lazy Stored Properties:**
A property whose initial value is not calculated until the first time it is used. Declare with `lazy var`. Must be a `var`. Useful for properties whose initial value is computationally expensive or depends on external factors not available at initialization.

```swift
class DataImporter {
    /* DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize. */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
    init() {
        print("DataImporter initialized")
    }
}

class DataManager {
    lazy var importer = DataImporter() // importer is not created until accessed
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}

let manager = DataManager() // DataImporter instance for importer has not yet been created
manager.data.append("Some data")
manager.data.append("Some more data")
// The DataImporter instance for the importer property has still not been created

print(manager.importer.filename) // Now the importer instance is created
// Prints "DataImporter initialized"
// Prints "data.txt"
```

#### Computed Properties
Do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

**Python (using `@property` decorator):**
```python
class Square:
    def __init__(self, side_length):
        self.side_length = side_length

    @property
    def area(self): # Getter
        return self.side_length ** 2

    @area.setter
    def area(self, new_area):
        self.side_length = new_area ** 0.5

s = Square(5)
print(s.area) # 25
s.area = 36
print(s.side_length) # 6.0
```

**Swift:**
```swift
struct PointStruct { // Changed from Point to avoid conflict
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = PointStruct()
    var size = Size()
    var center: PointStruct { // Computed property 'center'
        get { // Getter
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return PointStruct(x: centerX, y: centerY)
        }
        set(newCenter) { // Setter (optional)
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
        // If setter is not defined, it's a read-only computed property
        // Shorthand setter: if new value is not named, it defaults to 'newValue'
        // set {
        //    origin.x = newValue.x - (size.width / 2)
        //    origin.y = newValue.y - (size.height / 2)
        // }
    }
}

var square = Rect(origin: PointStruct(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// square.origin is now at (0.0, 0.0)
print("square.center is at (\(initialSquareCenter.x), \(initialSquareCenter.y))")
// square.center is at (5.0, 5.0)

square.center = PointStruct(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// square.origin is now at (10.0, 10.0)
```

**Property Observers (`willSet`, `didSet`):**
Respond to changes in a property's value. Called every time a property's value is set, even if the new value is the same as the current value.
- `willSet` is called just before the value is stored. The new value is passed as a constant (default name `newValue`).
- `didSet` is called immediately after the new value is stored. The old value is passed as a constant (default name `oldValue`).

```swift
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
```

### Methods

Functions associated with a particular type.

#### Instance Methods
Methods called on an instance of a class, struct, or enum. (`self` refers to the current instance).

```swift
class Counter {
    var count = 0
    func increment() {
        self.count += 1 // self is optional if no ambiguity
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment() // count is 1
counter.increment(by: 5) // count is 6
counter.reset() // count is 0
```

**Modifying Value Types from within Instance Methods (`mutating`):**
Structs and enums are value types. By default, properties of a value type cannot be modified from within its instance methods. To allow modification, prefix the method with the `mutating` keyword.

```swift
struct PointValueType { // Renamed to avoid conflict
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        // self.x += deltaX // Can modify properties because method is mutating
        // self.y += deltaY
        self = PointValueType(x: self.x + deltaX, y: self.y + deltaY) // Or assign a new struct to self
    }
}
var somePointVal = PointValueType(x: 1.0, y: 1.0)
somePointVal.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePointVal.x), \(somePointVal.y))")
// Prints "The point is now at (3.0, 4.0)"

// let fixedPoint = PointValueType(x: 3.0, y: 3.0)
// fixedPoint.moveBy(x: 2.0, y: 3.0) // This will report an error, cannot call mutating method on immutable value
```

#### Type Methods (Static Methods)
Called on the type itself, not an instance. Use the `static` keyword. For classes, you can use `class` to allow subclasses to override the superclass's implementation.

**Python (using `@staticmethod` or `@classmethod`):**
```python
class MathHelper:
    @staticmethod
    def add(x, y):
        return x + y

    @classmethod
    def description(cls):
        return f"This is a helper class: {cls.__name__}"

MathHelper.add(5,3) # 8
MathHelper.description()
```

**Swift:**
```swift
struct LevelTracker {
    static var highestUnlockedLevel = 1 // Stored type property
    static func unlock(_ level: Int) { // Type method
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func isUnlocked(_ level: Int) -> Bool { // Type method
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1 // Stored instance property

    // This instance method can check if the current level is unlocked
    // by querying the type property
    func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

// Usage:
LevelTracker.unlock(2)
LevelTracker.unlock(5)
print(LevelTracker.highestUnlockedLevel) // 5

var playerLevel = LevelTracker() // Instance
print(playerLevel.currentLevel) // 1
if playerLevel.advance(to: 3) {
    print("Advanced to level 3")
} else {
    print("Level 3 is locked")
}

class SomeClass {
    static func someTypeMethod() {
        print("Static type method in class")
    }
    class func overridableTypeMethod() { // 'class' allows overriding
        print("Class type method - can be overridden")
    }
}
```

### Initialization (Constructors)
Initializers (`init`) are special methods for creating new instances. Their job is to ensure all stored properties have an initial value.

**Python (`__init__`):**
```python
class Color:
    def __init__(self, red, green, blue):
        self.red = red
        self.green = green
        self.blue = blue
```

**Swift:**
```swift
struct Color {
    let red, green, blue: Double
    // Initializer
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    // Another initializer
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let gray = Color(white: 0.5) // Calls init(white:)
```

**Default Initializers:**
- If a struct provides no custom initializers, it gets a *memberwise initializer* automatically (if all properties have default values or are optionals, it also gets a default `init()`).
  `struct Size { var width = 0.0, height = 0.0 }`
  `let s = Size(width: 10, height: 20)` OR `let s = Size()`
- If a class provides default values for all properties and has no custom initializers, it gets a default `init()`.

**Designated and Convenience Initializers (for classes):**
- **Designated initializers** are the primary initializers. They fully initialize all properties introduced by that class and call an appropriate superclass initializer. A class must have at least one.
- **Convenience initializers** are secondary, supporting initializers. They must call another initializer from the same class (eventually calling a designated initializer).
  Marked with `convenience` keyword.

```swift
class Food {
    var name: String
    // Designated initializer
    init(name: String) {
        self.name = name
    }
    // Convenience initializer (must call a designated init from the same class)
    convenience init() {
        self.init(name: "[Unnamed]") // Calls init(name:)
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    // Designated initializer for RecipeIngredient
    init(name: String, quantity: Int) {
        self.quantity = quantity // Initialize subclass property first
        super.init(name: name)   // Then call superclass's designated initializer
    }
    // Convenience initializer overriding superclass's convenience init
    // It must call a designated init from THIS class (RecipeIngredient)
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient() // Calls convenience init() -> convenience init(name:) -> designated init(name:quantity:)
print(oneMysteryItem.name) // "[Unnamed]"
print(oneMysteryItem.quantity) // 1

let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.name) // "Bacon"
print(oneBacon.quantity) // 1

let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name) // "Eggs"
print(sixEggs.quantity) // 6
```

**Failable Initializers (`init?`, `init!`):**
Initializers that can fail (return `nil`).

```swift
struct Animal {
    let species: String
    init?(species: String) { // Failable initializer
        if species.isEmpty { return nil } // Initialization fails
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe") // someCreature is Animal?
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "") // anonymousCreature is nil
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
```

### Deinitialization (Destructors)
A deinitializer (`deinit`) is called immediately before a class instance is deallocated. Only for classes.

**Python (`__del__` - less deterministic):**
```python
class MyFileHandler:
    def __init__(self, filename):
        self.file = open(filename, 'w')
        print("File opened.")
    def __del__(self):
        if self.file:
            self.file.close()
            print("File closed.") # Called when object is garbage collected

# handler = MyFileHandler("test.txt")
# handler = None # May trigger __del__
```

**Swift (`deinit`):**
```swift
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(_ numberOfCoinsToVend: Int) -> Int {
        let numberOfCoinsActuallyVended = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsActuallyVended
        return numberOfCoinsActuallyVended
    }
    static func receiveCoins(_ coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(_ coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit { // Deinitializer
        Bank.receiveCoins(coinsInPurse) // Return coins to the bank
        print("Player deinitialized, returned \(coinsInPurse) coins to bank.")
    }
}

var playerOne: Player? = Player(coins: 100)
print("PlayerOne has \(playerOne!.coinsInPurse) coins") // PlayerOne has 100 coins
print("Bank has \(Bank.coinsInBank) coins") // Bank has 9900 coins

playerOne!.winCoins(2000)
print("PlayerOne now has \(playerOne!.coinsInPurse) coins") // PlayerOne now has 2100 coins
print("Bank has \(Bank.coinsInBank) coins") // Bank has 7900 coins

playerOne = nil // Deallocates the Player instance, deinit is called
// Prints "Player deinitialized, returned 2100 coins to bank."
print("Bank now has \(Bank.coinsInBank) coins") // Bank now has 10000 coins
```

### Inheritance
A class can inherit methods, properties, and other characteristics from another class (superclass). The inheriting class is the subclass.

**Python:**
```python
class Vehicle:
    def __init__(self, current_speed=0):
        self.current_speed = current_speed

    def make_noise(self):
        print("Generic vehicle noise")

class Bicycle(Vehicle): # Bicycle inherits from Vehicle
    def __init__(self, has_basket=False):
        super().__init__() # Call superclass init
        self.has_basket = has_basket

    def make_noise(self): # Override
        print("Ring ring!")

bike = Bicycle(has_basket=True)
bike.make_noise() # Ring ring!
print(bike.current_speed) # 0
```

**Swift:**
```swift
class Vehicle {
    var currentSpeed = 0.0
    var description: String { // Computed property
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // Do nothing - an arbitrary vehicle doesn't necessarily make a noise
        print("Generic vehicle noise (from superclass)")
    }
}

class Bicycle: Vehicle { // Bicycle inherits from Vehicle
    var hasBasket = false
    // Subclasses don't automatically inherit superclass initializers by default
    // (unless certain conditions are met for safety)
    // They must provide their own or rely on inherited ones if safe.

    // If a subclass initializer doesn't call a superclass designated initializer,
    // Swift calls super.init() implicitly for you if the superclass has a no-argument init.
    // Here, Vehicle has no custom init, so it has a default init().
    // Bicycle will get a default init() if it doesn't define one.

    override func makeNoise() { // 'override' keyword is required
        print("Ring ring!")
    }
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)") // Bicycle: traveling at 15.0 miles per hour
bicycle.makeNoise() // Ring ring!

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 12.0
print("Tandem: \(tandem.description)") // Tandem: traveling at 12.0 miles per hour
tandem.makeNoise() // Ring ring! (inherited from Bicycle)

// Preventing Overrides: `final`
// `final var`, `final func`, `final class subscript`, `final class`
// final class Car { ... } // Car cannot be subclassed
// class MyCar: Car {} // Error
```
- Use `override` keyword to override a superclass method, property, or subscript.
- Access superclass members using `super.` (e.g., `super.init()`, `super.someMethod()`).

### Protocols (Interfaces)
A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. Classes, structs, or enums can then *conform* to the protocol. This is similar to interfaces in Java/C# or Abstract Base Classes (ABCs) in Python.

**Python (using `abc` module):**
```python
from abc import ABC, abstractmethod

class Drawable(ABC):
    @abstractmethod
    def draw(self):
        pass

class Circle(Drawable):
    def draw(self):
        print("Drawing a circle")

# d = Drawable() # Error: Cannot instantiate abstract class
c = Circle()
c.draw()
```

**Swift:**
```swift
protocol FullyNamed {
    var fullName: String { get } // A gettable property requirement
    // For a settable property: { get set }
    func describe() // Method requirement
}

struct Person: FullyNamed { // Person conforms to FullyNamed
    var firstName: String
    var lastName: String

    var fullName: String { // Implementation of the required property
        return "\(firstName) \(lastName)"
    }
    func describe() { // Implementation of the required method
        print("This person's name is \(fullName).")
    }
}

struct Pet: FullyNamed {
    var name: String
    var species: String

    var fullName: String {
        return "\(name) the \(species)"
    }
    func describe() {
        print("This pet is \(fullName).")
    }
}

let john = Person(firstName: "John", lastName: "Appleseed")
john.describe() // This person's name is John Appleseed.
print(john.fullName) // John Appleseed

let fluffy = Pet(name: "Fluffy", species: "Cat")
fluffy.describe() // This pet is Fluffy the Cat.

// Using protocol as a type
var someone: FullyNamed
someone = john
print(someone.fullName)
someone = fluffy
print(someone.fullName)

// Protocol requirements can include type properties and type methods (static)
protocol Togglable {
    mutating func toggle() // 'mutating' if it modifies the instance (for value types)
    static var description: String { get }
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
    static var description: String {
        return "A switch that can be toggled."
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle() // lightSwitch is now .on
print(OnOffSwitch.description) // A switch that can be toggled.
```
Protocols are fundamental to Swift's design, enabling polymorphism and code reuse (Protocol-Oriented Programming).

### Extensions
Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes adding computed properties, methods, initializers, subscript, and conforming to protocols.
They are similar to Python's ability to monkey-patch classes, but more structured and type-safe.

```swift
// Extend built-in Double type
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }

    func squared() -> Double {
        return self * self
    }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters") // One inch is 0.0254 meters
let threeFeet = 3.0.ft
print("Three feet is \(threeFeet) meters") // Three feet is 0.914399970739201 meters

let fiveSquared = 5.0.squared() // 25.0

// Conforming to a protocol via an extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Game {
    var score = 0
    var name: String
}

extension Game: TextRepresentable { // Make Game conform to TextRepresentable
    var textualDescription: String {
        return "Game: \(name), Score: \(score)"
    }
}
let myGame = Game(score: 100, name: "Space Invaders")
print(myGame.textualDescription) // Game: Space Invaders, Score: 100
```

## 9. Error Handling

Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime. This is different from optionals, which handle the absence of a value. Error handling deals with unexpected outcomes of operations.

Python uses `try-except-finally` blocks for exceptions.

### Representing and Throwing Errors
In Swift, errors are represented by values of types that conform to the `Error` protocol (an empty protocol). Enumerations are often well-suited for modeling a group of related error conditions.

```swift
enum VendingMachineError: Error { // Conforms to Error protocol
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// Throwing an error
// throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

### Handling Errors
When a function throws an error, it changes the flow of your program.

#### Propagating Errors Using `throws`
A function indicates it can throw an error by including `throws` keyword in its declaration.
If you call a function that `throws`, you must either handle the error (with `do-catch`, `try?`, or `try!`) or propagate it by marking your current function with `throws` as well.

```swift
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws { // This function can throw
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}
```

#### Handling Errors Using `do-catch`
A `do-catch` statement runs a block of code. If an error is thrown within the `do` clause, it is matched against the `catch` clauses to determine which one can handle the error.

```swift
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice", // This will cause an error
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName) // 'try' keyword is needed
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 100

// Example 1: Catching specific errors
func attemptToBuySnack(person: String) {
    do {
        try buyFavoriteSnack(person: person, vendingMachine: vendingMachine)
        print("Successfully bought snack for \(person).")
    } catch VendingMachineError.invalidSelection {
        print("Invalid Selection for \(person).")
    } catch VendingMachineError.outOfStock {
        print("Out of Stock for \(person).")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("Insufficient funds for \(person). Please insert an additional \(coinsNeeded) coins.")
    } catch { // Generic catch block (error is implicitly available as 'error')
        print("Unexpected error for \(person): \(error).")
    }
}

attemptToBuySnack(person: "Alice") // Successfully bought snack for Alice. (Assuming Chips price <= 100)
// (After buying chips, let's say coinsDeposited is now 90)
attemptToBuySnack(person: "Bob")   // Invalid Selection for Bob. (Licorice not in inventory)
attemptToBuySnack(person: "Eve")   // Successfully bought snack for Eve. (Pretzels price <= 90)

// Example 2: Propagating the error
// func someFunctionThatCallsThrowingFunction() throws {
//     try vendingMachine.vend(itemNamed: "Candy Bar")
// }
```

#### Converting Errors to Optional Values (`try?`)
Use `try?` to handle an error by converting it to an optional value. If an error is thrown while evaluating the `try?` expression, the value of the expression is `nil`.

```swift
// func someThrowingFunction() throws -> Int { /* ... */ }

let x = try? someThrowingFunction() // x is Int?
// If someThrowingFunction throws, x will be nil. Otherwise, x is the returned Int.

// Example with vend:
func fetchData() -> Data? { // Example function that might return data or nil
    if let data = try? Data(contentsOf: URL(string: "http://example.com/data.txt")!) {
        return data
    } else {
        print("Could not fetch data.")
        return nil
    }
}
```

#### Disabling Error Propagation (`try!`)
Use `try!` when you are certain that a throwing function or method won’t actually throw an error at runtime. If an error *is* thrown, you’ll get a runtime error (crash). Use with extreme caution.

```swift
// let photo = try! loadImage(atPath: "./Resources/JohnAppleseed.jpg")
// This assumes loadImage will never fail for that path.
```

#### Specifying Cleanup Actions (`defer`)
A `defer` statement executes a block of code just before execution leaves the current scope (e.g., function returns, error thrown, loop breaks). Useful for resource cleanup. `defer` statements are executed in reverse order of their appearance.

**Python (using `finally`):**
```python
# file = None
# try:
#     file = open("myfile.txt", "r")
#     # process file
# finally:
#     if file:
#         file.close()
#         print("File closed in finally.")
```

**Swift:**
```swift
func processFile(filename: String) throws {
    let file = open(filename, O_RDONLY) // C-style file open
    if file == -1 {
        // throw FileError.couldNotOpen
        print("Could not open file.")
        return
    }
    defer { // Executed when scope is exited (return or error)
        close(file)
        print("File closed in defer.")
    }

    // Work with the file...
    // If an error is thrown here, or function returns, defer block still runs.
    print("Processing file...")
    // Simulate work, maybe throw an error
    // if someCondition { throw FileError.readFailed }
}

// try processFile(filename: "example.txt")
```

## 10. Memory Management (ARC)

Swift uses Automatic Reference Counting (ARC) to manage memory for class instances. ARC automatically frees up the memory used by class instances when those instances are no longer needed.
- You generally don't need to think about memory management yourself.
- ARC works by keeping track of how many properties, constants, and variables are currently referring to each class instance. It will not deallocate an instance as long as at least one active reference to that instance still exists.
- **Strong Reference Cycles:** ARC can sometimes lead to situations where two class instances hold strong references to each other, preventing them from ever being deallocated (a memory leak). Swift provides `weak` and `unowned` references to resolve these cycles.
    - **`weak` references:** A weak reference does not keep a strong hold on the instance it refers to, so it doesn’t stop ARC from deallocating the referenced instance. The reference becomes `nil` when the instance is deallocated. Thus, weak references must be optional types.
    - **`unowned` references:** Like a weak reference, an unowned reference does not keep a strong hold. However, an unowned reference is used when the other instance has the same lifetime or a longer lifetime. It's assumed to always have a value. Accessing an unowned reference after its instance has been deallocated will trigger a runtime error.

**Python (Garbage Collection):**
Python uses a combination of reference counting and a cyclic garbage collector to manage memory. You typically don't manage memory manually.

**Swift (ARC Example - Strong Reference Cycle):**
```swift
class PersonARC {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentARC? // Optional, can be nil
    deinit { print("\(name) is being deinitialized (Person)") }
}

class ApartmentARC {
    let unit: String
    init(unit: String) { self.unit = unit }
    // weak var tenant: PersonARC? // To break cycle: use weak
    var tenant: PersonARC? // Strong reference by default
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var johnArc: PersonARC?
var unit4A: ApartmentARC?

johnArc = PersonARC(name: "John Appleseed")
unit4A = ApartmentARC(unit: "4A")

// Create a strong reference cycle:
johnArc!.apartment = unit4A
unit4A!.tenant = johnArc // If tenant is not weak, this creates a cycle

// Set both to nil. If there's a cycle, deinit won't be called.
johnArc = nil
unit4A = nil
// If 'tenant' in ApartmentARC is 'var tenant: PersonARC?', no deinit messages print.
// If 'tenant' is 'weak var tenant: PersonARC?', deinit messages will print.
```
To break the cycle above, `tenant` in `ApartmentARC` should be declared as `weak var tenant: PersonARC?`.

## 11. Where to Go From Here

- **Apple's Swift Documentation:** The official "The Swift Programming Language" book is an excellent and comprehensive resource.
- **SwiftUI / UIKit:** For building user interfaces on Apple platforms.
- **Server-Side Swift:** Frameworks like Vapor or Kitura.
- **Concurrency:** `async/await`, actors.
- **Generics:** Writing flexible, reusable functions and types.
- **Package Management:** Swift Package Manager (SPM).

This guide provides a starting point. The best way to learn is by writing code, experimenting, and building projects! Good luck!
---
