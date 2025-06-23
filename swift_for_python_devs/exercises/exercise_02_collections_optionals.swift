// Exercise 02: Collections and Optionals

// 1. Arrays:
//    a. Create an array `favoriteFruits` of type `String` and initialize it with three of your favorite fruits.
//    b. Print the second fruit in the array.
//    c. Add another fruit to the end of the array.
//    d. Insert a fruit at the beginning of the array.
//    e. Print the total number of fruits in the array.
//    f. Remove the fruit at index 2.
//    g. Print the updated array.


// 2. Dictionaries:
//    a. Create a dictionary `capitals` where keys are `String` (country names) and values are `String` (capital cities).
//       Initialize it with at least three country-capital pairs.
//    b. Print the capital of one of the countries using its key. Handle the case where the key might not exist using optional binding or the nil-coalescing operator.
//    c. Add a new country and its capital to the dictionary.
//    d. Update the capital of one of the existing countries.
//    e. Remove a country from the dictionary.
//    f. Iterate through the dictionary and print each country and its capital in the format: "The capital of [Country] is [Capital]."


// 3. Sets:
//    a. Create two sets of integers, `setA` and `setB`, with some overlapping and some unique numbers.
//       `setA` = {1, 2, 3, 4, 5}
//       `setB` = {4, 5, 6, 7, 8}
//    b. Create a new set `unionSet` containing all elements from both `setA` and `setB`. Print it (sorted for consistent output).
//    c. Create a new set `intersectionSet` containing only elements common to both `setA` and `setB`. Print it (sorted).
//    d. Create a new set `differenceSet` containing elements in `setA` but not in `setB`. Print it (sorted).
//    e. Check if `setA` is a superset of `{1, 2}`. Print the result.


// 4. Optionals:
//    a. Declare an optional integer `optionalAge` and do not initialize it.
//    b. Use optional binding (`if let`) to check if `optionalAge` has a value.
//       If it does, print "Age is [value]". If not, print "Age is not specified."
//    c. Assign a value (e.g., 25) to `optionalAge`.
//    d. Use forced unwrapping (`!`) to print the value of `optionalAge`. (Ensure it has a value before doing this for the sake of the exercise, but acknowledge the risk).
//    e. Declare another optional integer `anotherOptionalAge` and initialize it with a value.
//    f. Use the nil-coalescing operator (`??`) to provide a default value of 0 if `anotherOptionalAge` is `nil`, and print the result.
//       Then set `anotherOptionalAge` to `nil` and print the result again using nil-coalescing.

// 5. Optional Chaining:
//    Define a simple struct `User` with an optional property `address` of type `Address?`.
//    Define another struct `Address` with an optional property `streetName` of type `String?`.
//    a. Create a `User` instance.
//    b. Try to print the `streetName` using optional chaining. If it's `nil` at any point, it should not crash.
//       Print a message like "Street name: [name]" or "Street name not available."
//    c. Create another `User` instance, this time also creating an `Address` instance for it, but leave `streetName` as `nil`. Print the street name.
//    d. Create a third `User` instance, providing an `Address` and a `streetName`. Print the street name.

```
