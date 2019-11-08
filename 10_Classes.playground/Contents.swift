import UIKit

/*
 Classes are similar to structs, but have 5 important differences (explain differences)
 1. Don't come with memberwise initializer (you have to create your own init)
 2. Class inheritance (you can create a class based on an existing class - i.e. subclass)
 3. When copying a class, both original and copy point to the same thing (reference?) vs struct, where original and copy are different things (value?)
 4. Classes have deinitializers (code that is run when instance of class is destroyed)
 5. A constant class with variable property allows you to change the property vs struct, where property can't be changed because the struct is constant
*/


//class Person {
//    var name: String
//    var birthYear: Int
//
//    init(name: String, birthYear: Int) {
//        self.name = name
//        self.birthYear = birthYear
//    }
//}
//
//let jason = Person(name: "Jason Mitchell", birthYear: 1776)


//class Dog {
//    var name: String
//    var breed: String
//
//    init(name: String, breed: String) {
//        self.name = name
//        self.breed = breed
//    }
//}
//
//let poppy = Dog(name: "Poppy", breed: "Poodle")
//
//
//class Poodle: Dog {
//    init(name: String) {
//        super.init(name: name, breed: "Poodle")
//    }
//}


// Can override methods (using `override` keyword)

class Dog {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}

let poppy = Poodle()
poppy.makeNoise()


// Making a class "final", no other classes can inherit from it
// Make a class final by putting final in front of class (i.e. `final class`


// Copying

class Singer {
    var name = "Kenny Chesney"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Garth Brooks"

print(singer.name)
// Prints "Garth Brooks" because changing singerCopy also changed singer
// If Singer were a struct, this would print "Kenny Chesney"


// Deinit

//class Person {
//    var name = "John Doe"
//
//    init() {
//        print("\(name) is alive!")
//    }
//
//    func printGreeting() {
//        print("Hello, I'm \(name)")
//    }
//
//    deinit {
//        // Do something
//        print("\(name) is no more!")
//    }
//}
//
//for _ in 1...3 {
//    let person = Person()
//    person.printGreeting()
//}


// Mutability

//class Singer {
//    var name = "Taylor Swift"
//}
//
//let taylor = Singer()
//taylor.name = "Ed Sheeran"
//print(taylor.name)

//// Make the property constant to stop this from happening, i.e. see below:
//
//class Singer {
//    let name = "Taylor Swift"
//}

class Person {
    var name = "John Doe"
}

let aPerson = Person()
aPerson.name = "Jason Mitchell"
