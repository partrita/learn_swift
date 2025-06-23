// Solution for Exercise 02: Collections and Optionals

// 1. Arrays:
print("--- 1. Arrays ---")
//    a. Create an array `favoriteFruits` of type `String` and initialize it with three of your favorite fruits.
var favoriteFruits: [String] = ["Apple", "Banana", "Mango"]
print("a. Initial fruits: \(favoriteFruits)")

//    b. Print the second fruit in the array.
if favoriteFruits.count > 1 {
    print("b. Second fruit: \(favoriteFruits[1])")
} else {
    print("b. Array doesn't have a second fruit.")
}

//    c. Add another fruit to the end of the array.
favoriteFruits.append("Strawberry")
print("c. After append: \(favoriteFruits)")

//    d. Insert a fruit at the beginning of the array.
favoriteFruits.insert("Orange", at: 0)
print("d. After insert at start: \(favoriteFruits)")

//    e. Print the total number of fruits in the array.
print("e. Total number of fruits: \(favoriteFruits.count)")

//    f. Remove the fruit at index 2.
if favoriteFruits.count > 2 {
    let removedFruit = favoriteFruits.remove(at: 2) // Orange, Apple, Banana, Mango, Strawberry -> Removes Banana
    print("f. Removed fruit at index 2 ('\(removedFruit)'): \(favoriteFruits)")
} else {
    print("f. Not enough elements to remove at index 2.")
}


//    g. Print the updated array.
print("g. Updated array: \(favoriteFruits)")


// 2. Dictionaries:
print("\n--- 2. Dictionaries ---")
//    a. Create a dictionary `capitals` where keys are `String` (country names) and values are `String` (capital cities).
//       Initialize it with at least three country-capital pairs.
var capitals: [String: String] = [
    "France": "Paris",
    "Japan": "Tokyo",
    "Canada": "Ottawa"
]
print("a. Initial capitals: \(capitals)")

//    b. Print the capital of one of the countries using its key. Handle the case where the key might not exist using optional binding or the nil-coalescing operator.
let country = "Japan"
if let capital = capitals[country] {
    print("b. Capital of \(country) (optional binding): \(capital)")
} else {
    print("b. Capital of \(country) not found.")
}
// Alternative with nil-coalescing
let capitalOfGermany = capitals["Germany"] ?? "Not Found"
print("b. Capital of Germany (nil-coalescing): \(capitalOfGermany)")


//    c. Add a new country and its capital to the dictionary.
capitals["Brazil"] = "Brasilia"
print("c. After adding Brazil: \(capitals)")

//    d. Update the capital of one of the existing countries.
capitals["Canada"] = "New Ottawa (Updated)" // Or capitals.updateValue("New Ottawa (Updated)", forKey: "Canada")
print("d. After updating Canada: \(capitals)")

//    e. Remove a country from the dictionary.
let removedCapital = capitals.removeValue(forKey: "France")
print("e. Removed France (capital was \(removedCapital ?? "N/A")). Current: \(capitals)")

//    f. Iterate through the dictionary and print each country and its capital in the format: "The capital of [Country] is [Capital]."
print("f. Dictionary iteration:")
for (country, capital) in capitals {
    print("   The capital of \(country) is \(capital).")
}


// 3. Sets:
print("\n--- 3. Sets ---")
//    a. Create two sets of integers, `setA` and `setB`, with some overlapping and some unique numbers.
//       `setA` = {1, 2, 3, 4, 5}
//       `setB` = {4, 5, 6, 7, 8}
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [4, 5, 6, 7, 8]
print("a. Set A: \(setA.sorted()), Set B: \(setB.sorted())")

//    b. Create a new set `unionSet` containing all elements from both `setA` and `setB`. Print it (sorted for consistent output).
let unionSet = setA.union(setB)
print("b. Union: \(unionSet.sorted())")

//    c. Create a new set `intersectionSet` containing only elements common to both `setA` and `setB`. Print it (sorted).
let intersectionSet = setA.intersection(setB)
print("c. Intersection: \(intersectionSet.sorted())")

//    d. Create a new set `differenceSet` containing elements in `setA` but not in `setB`. Print it (sorted).
let differenceSet = setA.subtracting(setB) // Elements in A not in B
print("d. Difference (A - B): \(differenceSet.sorted())")

//    e. Check if `setA` is a superset of `{1, 2}`. Print the result.
let subsetToCheck: Set<Int> = [1, 2]
let isSuperset = setA.isSuperset(of: subsetToCheck)
print("e. Is Set A a superset of {1, 2}? \(isSuperset)")


// 4. Optionals:
print("\n--- 4. Optionals ---")
//    a. Declare an optional integer `optionalAge` and do not initialize it.
var optionalAge: Int?
// print(optionalAge) // Will print "nil"

//    b. Use optional binding (`if let`) to check if `optionalAge` has a value.
//       If it does, print "Age is [value]". If not, print "Age is not specified."
if let age = optionalAge {
    print("b. Age is \(age)")
} else {
    print("b. Age is not specified.")
}

//    c. Assign a value (e.g., 25) to `optionalAge`.
optionalAge = 25
print("c. Assigned 25 to optionalAge.")

//    d. Use forced unwrapping (`!`) to print the value of `optionalAge`. (Ensure it has a value before doing this for the sake of the exercise, but acknowledge the risk).
//    Acknowledging risk: Forced unwrapping will crash if optionalAge is nil.
if optionalAge != nil {
    print("d. Age (forced unwrapped): \(optionalAge!)")
} else {
    print("d. Cannot force unwrap, optionalAge is nil (this part ideally shouldn't be reached in this specific flow).")
}


//    e. Declare another optional integer `anotherOptionalAge` and initialize it with a value.
var anotherOptionalAge: Int? = 30

//    f. Use the nil-coalescing operator (`??`) to provide a default value of 0 if `anotherOptionalAge` is `nil`, and print the result.
//       Then set `anotherOptionalAge` to `nil` and print the result again using nil-coalescing.
print("f. Another optional age (with value): \(anotherOptionalAge ?? 0)")
anotherOptionalAge = nil
print("f. Another optional age (set to nil): \(anotherOptionalAge ?? 0)")


// 5. Optional Chaining:
print("\n--- 5. Optional Chaining ---")
//    Define a simple struct `User` with an optional property `address` of type `Address?`.
//    Define another struct `Address` with an optional property `streetName` of type `String?`.
struct Address {
    var streetName: String?
}
struct User {
    var name: String
    var address: Address?
}

//    a. Create a `User` instance.
let user1 = User(name: "User One", address: nil)

//    b. Try to print the `streetName` using optional chaining. If it's `nil` at any point, it should not crash.
//       Print a message like "Street name: [name]" or "Street name not available."
if let street = user1.address?.streetName {
    print("b. User1 Street name: \(street)")
} else {
    print("b. User1 Street name not available.")
}

//    c. Create another `User` instance, this time also creating an `Address` instance for it, but leave `streetName` as `nil`. Print the street name.
let user2 = User(name: "User Two", address: Address(streetName: nil))
if let street = user2.address?.streetName {
    print("c. User2 Street name: \(street)")
} else {
    print("c. User2 Street name not available (address exists, but streetName is nil).")
}

//    d. Create a third `User` instance, providing an `Address` and a `streetName`. Print the street name.
let user3 = User(name: "User Three", address: Address(streetName: "123 Main St"))
if let street = user3.address?.streetName {
    print("d. User3 Street name: \(street)")
} else {
    print("d. User3 Street name not available (this shouldn't happen).")
}
// Or more directly with nil-coalescing for display:
let user3Street = user3.address?.streetName ?? "Street not specified"
print("d. User3 Street (direct with ??): \(user3Street)")
```
