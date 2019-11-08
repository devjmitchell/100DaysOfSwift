import UIKit

//struct Sport {
//    var name: String
//}
//
//var tennis = Sport(name: "Tennis")
//print(tennis.name)
//
//tennis.name = "Lawn tennis"
//
//
//struct Sport {
//    var name: String
//}
//
//struct Sport {
//    var name: String
//    var isOlympicSport: Bool
//
//    var olympicStatus: String {
//        if isOlympicSport {
//            return "\(name) is an Olympic sport"
//        } else {
//            return "\(name) is not an Olympic sport"
//        }
//    }
//}
//
//let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
//print(chessBoxing.olympicStatus)
//
//
//struct Progress {
//    var task: String
//    var amount: Int
//}
//
//var progress = Progress(task: "Loading data", amount: 0)
//progress.amount = 30
//progress.amount = 80
//progress.amount = 100
//
//struct Progress {
//    var task: String
//    var amount: Int {
//        didSet {
//            print("\(task) is now \(amount)% complete")
//        }
//    }
//}
//
//
//struct City {
//    var population: Int
//
//    func collectTaxes() -> Int {
//        return population * 1000
//    }
//}
//
//let london = City(population: 9_000_000)
//london.collectTaxes()






struct Person {
    var firstName: String
    var lastName: String
    var jobTitle: String
}

var jason = Person(firstName: "Jason", lastName: "Mitchell", jobTitle: "iOS Developer")

print(jason.jobTitle)
// Prints "iOS Developer"


struct Person {
    var firstName: String
    var lastName: String
    var jobTitle: String

    func describe() {
        print("First Name: \(firstName) -- Last Name: \(lastName) -- Job Title: \(jobTitle)")
    }
}

var jason = Person(firstName: "Jason", lastName: "Mitchell", jobTitle: "iOS Developer")

jason.describe()


struct Person {
    var firstName: String
    var lastName: String
    var jobTitle: String {
        didSet {
            print("\(firstName) has a new job title of \(jobTitle) - congrats!")
        }
    }

    func describe() {
        print("First Name: \(firstName) -- Last Name: \(lastName) -- Job Title: \(jobTitle)")
    }
}

var jason = Person(firstName: "Jason", lastName: "Mitchell", jobTitle: "iOS Developer")

jason.jobTitle = "CEO"
// Prints "Jason has a new job title of CEO - congrats!"

/*
 Points to cover in blog post?
 
 - Explain what a structure, or struct, is
 
 - Create a basic struct
 - Create instance of struct
 - Access property, like this: jason.jobTitle
 
 - Add a method (a function within a struct)
 - Call method
 
 - Add property observer (didSet)
 - Demonstrate property observer
 
 - Show what you can do with strings and arrays (since they're structs)
*/


let myString = "Coding is awesome!"

print(myString.count)
// Prints "18"

print(myString.uppercased())
// Prints "CODING IS AWESOME!"


var shoppingList = ["eggs", "apples", "steak"]

shoppingList.append("milk")
// Appends "milk" to the end of shoppingList

print(shoppingList.sorted())
// Prints ["apples", "eggs", "milk", "steak"]
