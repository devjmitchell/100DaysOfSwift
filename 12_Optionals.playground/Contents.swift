//: Playground - noun: a place where people can play

import UIKit


// if let

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}


var age: Int?

if let age = age {
    // Do something if not nil
} else {
    // Do something else if nil
}


// guard let

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    
    print("Hello, \(unwrapped)!")
}

func testing() {
    let optionalURL = URL(string: "https://devjm.com")
    guard let url = optionalURL else { return }
}
testing()

// Force unwrapping

let str = "5"
let num = Int(str)!

let url = URL(string: "https://devjm.com")!


// Implicitly unwrapping optionals

//let age: Int! = nil


// Nil coalescing

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"


// Optional chaining

let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()


// Optional try


// Failable initializers


// Typecasting
