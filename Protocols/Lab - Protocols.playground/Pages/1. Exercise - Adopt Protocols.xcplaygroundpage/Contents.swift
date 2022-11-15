/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
import Foundation

class Human: CustomStringConvertible, Equatable, Comparable, Codable {
    let name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "\(name) is \(age) years old."
    }
    
    static func == (person1: Human, person2: Human) -> Bool {
        return person1.name == person2.name && person1.age == person2.age
    }
    
    static func < (person1: Human, person2: Human) -> Bool {
        return person1.age < person2.age
    }
}

let oneDude = Human(name: "Joe", age: 59)
let anotherDude = Human(name: "Jake", age: 54)

//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
print(oneDude)
print(anotherDude)

//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
if oneDude == anotherDude {
    print("They are Equal")
} else if oneDude != anotherDude {
    print("They are not equal")
}

//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
let peoplesAge = [oneDude, anotherDude]
let sortedPeople = peoplesAge.sorted(by: < )

for person in sortedPeople {
    print(person)
}

//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
let jsonEncoder = JSONEncoder()

if let jsonData = try? jsonEncoder.encode(peoplesAge),
   let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

/*:
 page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
