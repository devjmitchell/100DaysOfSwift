import UIKit


// Functions allow you to group a section of code, so you can "call" it later
// Create a function with keyword "func"
// The code that this function runs is wrapped inside {}
func sayHello() {
    print("Hello!")
}

// "Call" a function using it's name followed by ()
sayHello()


// You can accept parameters
//func square(number: Int) {
//    print(number * number)
//}
//
//square(number: 3)


func square(number: Int) -> Int {
    return number * number
}

let squaredNumber = square(number: 3)
print(squaredNumber)


// The external name (parameter label) can be different if you'd like
// This allows it to read more clearly when calling it, but still sound right inside the function
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Jason")


// There are many more things you can do with functions, but this was some of the basics
// See Paul Hudson's #100DaysOfSwift for more!
