// Swift for Python Developers - Example 11: Memory Management (ARC)

// Swift uses Automatic Reference Counting (ARC) to manage memory for class instances.
// ARC automatically frees up the memory used by class instances when those instances are no longer needed.
// You generally don't need to think about memory management yourself.
// ARC applies only to instances of classes, not to structures or enumerations (which are value types).

// Python uses a combination of reference counting and a cyclic garbage collector.

print("--- Basic ARC in Action ---")
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized (Person).")
    }
    deinit {
        print("\(name) is being deinitialized (Person).")
    }
}

// Create three references to Person instances
var reference1: Person?
var reference2: Person?
var reference3: Person?

// Create a new Person instance and assign it to reference1
reference1 = Person(name: "John Appleseed")
// Prints: John Appleseed is being initialized (Person).
// There is now one strong reference to this Person instance.

// Assign the same instance to reference2 and reference3
reference2 = reference1
reference3 = reference1
// There are now three strong references to this Person instance.

// Break two of these strong references by setting them to nil
reference1 = nil
reference2 = nil
// There is still one strong reference (reference3), so the Person instance is not deallocated yet.
print("reference1 and reference2 are nil. reference3 still holds a reference.")

// Break the final strong reference
reference3 = nil
// Prints: John Appleseed is being deinitialized (Person).
// Now there are no more strong references, so ARC deallocates the Person instance.


// --- Strong Reference Cycles Between Class Instances ---
// If two class instances hold a strong reference to each other, such that each instance
// keeps the other one alive, it creates a strong reference cycle.
// This means their reference counts will never drop to zero, and ARC won't deallocate them,
// leading to a memory leak.

print("\n--- Strong Reference Cycle Example ---")
class Resident {
    let name: String
    var apartment: Apartment? // Optional, can be nil. Strong reference by default.

    init(name: String) {
        self.name = name
        print("Resident \(name) initialized.")
    }
    deinit {
        print("Resident \(name) deinitialized.")
    }
}

class Apartment {
    let unit: String
    // To break the cycle, this should be `weak var tenant: Resident?`
    var tenant: Resident? // Strong reference by default

    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) initialized.")
    }
    deinit {
        print("Apartment \(unit) deinitialized.")
    }
}

var bob: Resident?
var unit4A: Apartment?

bob = Resident(name: "Bob")         // bob has 1 strong ref
unit4A = Apartment(unit: "4A")    // unit4A has 1 strong ref

// Create the cycle:
bob!.apartment = unit4A   // Apartment instance now has 2 strong refs (unit4A and bob.apartment)
unit4A!.tenant = bob      // Resident instance now has 2 strong refs (bob and unit4A.tenant)

print("bob and unit4A are linked, creating a cycle.")

// Try to break the external references
bob = nil    // bob's strong ref to Resident instance is gone. Resident instance still has 1 ref (from unit4A.tenant)
unit4A = nil // unit4A's strong ref to Apartment instance is gone. Apartment instance still has 1 ref (from (original bob).apartment)

// DEINIT MESSAGES WILL NOT BE PRINTED HERE because of the cycle.
// The Resident and Apartment instances still hold strong references to each other.
// Memory leak!

// --- Resolving Strong Reference Cycles ---
// Swift provides two ways to resolve strong reference cycles:
// 1. Weak References (`weak`)
// 2. Unowned References (`unowned`)

// --- Weak References ---
// A weak reference does not keep a strong hold on the instance it refers to.
// It doesn't stop ARC from deallocating the referenced instance.
// ARC automatically sets a weak reference to `nil` when the instance it refers to is deallocated.
// Because of this, weak references must be declared as optional types (`var` and `?`).
// Use weak references when the other instance has a shorter lifetime or can be nil.

print("\n--- Weak Reference Example (Resolving Cycle) ---")
class PersonWithWeakApartment {
    let name: String
    var apartment: ApartmentWithWeakTenant? // Strong reference to apartment

    init(name: String) {
        self.name = name
        print("PersonWithWeakApartment \(name) initialized.")
    }
    deinit {
        print("PersonWithWeakApartment \(name) deinitialized.")
    }
}

class ApartmentWithWeakTenant {
    let unit: String
    weak var tenant: PersonWithWeakApartment? // WEAK reference to tenant

    init(unit: String) {
        self.unit = unit
        print("ApartmentWithWeakTenant \(unit) initialized.")
    }
    deinit {
        print("ApartmentWithWeakTenant \(unit) deinitialized.")
    }
}

var alice: PersonWithWeakApartment?
var unit1B: ApartmentWithWeakTenant?

alice = PersonWithWeakApartment(name: "Alice")
unit1B = ApartmentWithWeakTenant(unit: "1B")

// Link them:
alice!.apartment = unit1B // Alice has strong ref to unit1B
unit1B!.tenant = alice    // unit1B has WEAK ref to Alice

print("Alice and unit1B are linked (using weak for tenant).")

alice = nil
// Alice instance is deallocated because unit1B's weak ref doesn't keep it alive.
// Output: PersonWithWeakApartment Alice deinitialized.
// When Alice is deallocated, its strong reference to unit1B is also broken.

unit1B = nil
// unit1B instance is deallocated because its only strong reference (from original `unit1B` var) is broken.
// Output: ApartmentWithWeakTenant 1B deinitialized.
// Cycle is broken!


// --- Unowned References ---
// Like a weak reference, an unowned reference does not keep a strong hold on the instance it refers to.
// Unlike a weak reference, an unowned reference is used when the other instance has the
// same lifetime or a longer lifetime.
// An unowned reference is assumed to always have a value. ARC never sets an unowned reference's value to `nil`.
// Therefore, unowned references are defined using non-optional types.
// IMPORTANT: If you try to access an unowned reference after the instance it refers to has been
// deallocated, you will trigger a runtime error (crash).
// Use unowned when you are sure the reference will not be nil once it's set.

print("\n--- Unowned Reference Example ---")
// Scenario: A Customer and a CreditCard. A credit card always belongs to a customer.
// A customer might not have a credit card, but a card *must* have a customer.
// The customer "owns" the card. The card cannot outlive the customer.

class Customer {
    let name: String
    var card: CreditCard? // Optional, customer might not have a card. Strong ref to card.

    init(name: String) {
        self.name = name
        print("Customer \(name) initialized.")
    }
    deinit {
        print("Customer \(name) deinitialized.")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer // UNOWNED reference to customer (non-optional)
                                   // Assumes card will not exist without a customer.

    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer // Customer instance is passed in, expected to exist.
        print("CreditCard #\(number) for \(customer.name) initialized.")
    }
    deinit {
        print("CreditCard #\(number) deinitialized.")
    }
}

var david: Customer?
david = Customer(name: "David") // David initialized.

// Create a card for David.
// The card's initializer takes a Customer instance.
// The card will hold an unowned reference to this customer.
david!.card = CreditCard(number: 1234_5678_9012_3456, customer: david!)
// CreditCard #1234567890123456 for David initialized.
// David has a strong ref to card. Card has an unowned ref to David.

// If David is deallocated, his card should also be deallocated.
david = nil
// Output:
// Customer David deinitialized.
// CreditCard #1234567890123456 deinitialized.
// Cycle broken. If `customer` in CreditCard was strong, this would be a leak.
// If `customer` was weak, it would also work but would need to be optional and checked.
// Unowned is appropriate here because a CreditCard instance is not valid without a Customer.


// --- Unowned Optional References ---
// It's possible to mark an optional reference to a class as unowned.
// `unowned var/let propertyName: MyClass?`
// This is useful if you need an unowned reference that can sometimes be nil.
// Example: A school department might have a course it offers. A course belongs to one department.
// The department is unowned by the course. But a course might not always be assigned to a department yet.
class Department {
    let name: String
    var courses: [Course] = []
    init(name: String) { self.name = name; print("Department \(name) created.") }
    deinit { print("Department \(name) deallocated.") }
    func add(_ course: Course) {
        courses.append(course)
    }
}

class Course {
    let title: String
    unowned var department: Department? // Unowned optional: might be nil, but if not, it's unowned.
    init(title: String) { self.title = title; print("Course \(title) created.") }
    deinit { print("Course \(title) deallocated.") }
}

var compSci: Department? = Department(name: "Computer Science")
var math: Department? = Department(name: "Mathematics")

var introToProgramming: Course? = Course(title: "Intro to Programming")
introToProgramming!.department = compSci // Course has unowned ref to compSci
compSci!.add(introToProgramming!)       // compSci has strong ref to course

var calculus: Course? = Course(title: "Calculus I")
calculus!.department = math
math!.add(calculus!)

print("Deallocating Computer Science department...")
compSci = nil // Department and its courses (if only referenced by dept) should deallocate.
// Output:
// Department Computer Science deallocated.
// Course Intro to Programming deallocated. (because its only strong ref was from compSci.courses)

// If we now try to access introToProgramming!.department, it would crash if department was not optional.
// Since it's `unowned var department: Department?`, accessing `introToProgramming!.department`
// after `compSci` is deallocated will still crash if `introToProgramming` itself hasn't been nilled out,
// because the unowned reference points to deallocated memory.
// The optionality of `unowned optional` primarily means the property itself can be nil,
// not that ARC makes it nil when the object is deallocated (like `weak`).
// So, ensure `introToProgramming` is also nilled out or its `department` is nilled out before `compSci` deallocates
// if you plan to access `introToProgramming` later.
introToProgramming = nil // Or handle its `department` property carefully.

print("Deallocating Math department...")
math = nil
calculus = nil


// --- Strong Reference Cycles for Closures ---
// A strong reference cycle can also occur if you assign a closure to a property of a class instance,
// and the body of that closure captures the instance (e.g., by referring to `self` or a property of `self`).
// The closure "keeps the instance alive", and the instance "keeps the closure alive".

print("\n--- Strong Reference Cycle with Closure ---")
class HTMLElement {
    let name: String
    let text: String?

    // `asHTML` is a closure property.
    // If this closure captures `self` strongly, it can create a cycle.
    lazy var asHTML: () -> String = {
        // To break the cycle, use a capture list: `[weak self]` or `[unowned self]`
        // [weak self] in // Add this line to make `self` weak inside the closure
        // guard let self = self else { return "<!-- deallocated element -->" } // Check for nil if weak

        // [unowned self] in // Use if `self` is guaranteed to exist for the lifetime of the closure

        // Original problematic code (strong capture of self):
        if let text = self.text { // `self.text` captures `self` strongly
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        print("HTMLElement \(name) initialized.")
    }
    deinit {
        print("HTMLElement \(name) deinitialized.")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello, world")
print(paragraph!.asHTML()) // Accessing asHTML initializes the lazy property (closure)

// If no capture list is used in `asHTML` closure:
paragraph = nil
// DEINIT for HTMLElement "p" WILL NOT BE CALLED HERE.
// The paragraph instance holds a strong reference to the closure (asHTML).
// The closure holds a strong reference to the paragraph instance (self). Cycle!

// To fix this, use a capture list in the closure: `[weak self]` or `[unowned self]`.
// If `[weak self] in` and `guard let self = self else ...` are added to the closure:
// When `paragraph` is set to `nil`, the HTMLElement instance will be deinitialized.
// Output: HTMLElement p deinitialized.

// If using `[unowned self] in`:
// This assumes `self` will always exist when the closure is called.
// If `paragraph` was set to `nil` and then somehow `asHTML` was called (e.g., if stored elsewhere),
// it would crash. `unowned` is suitable if the closure cannot outlive the instance.

// See the `learning_guide.md` for a version of HTMLElement with the fix.
// For this example file, the cycle is intentionally left to demonstrate the problem.
// If you run this in a playground, "HTMLElement p deinitialized." will not print for the above `paragraph = nil`.
```
