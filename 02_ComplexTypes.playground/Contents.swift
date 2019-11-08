import UIKit

let swift = "Swift"
let objc = "Objective-C"
let python = "Python"
let js = "JavaScript"

// Array
let languages = [swift, objc, python, js]
languages[0]
// This reads "Swift", since we start counting at 0 in Swift
// Be careful, Swift will crash if you try to read an item that doesn't exist


// Set
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])
// This still only include "red", "green", and "blue"... not necessarily in that order


// Tuple
var name = (first: "Jason", last: "Mitchell")
name.0
name.first


//let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
//let set = Set(["aardvark", "astronaut", "azalea"])
//let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
//
//
//// Dictionary
//let heights = [
//    "Taylor Swift": 1.78,
//    "Ed Sheeran": 1.73
//]
//
//heights["Taylor Swift"]
//
//
//let favoriteIceCream = [
//    "Paul": "Chocolate",
//    "Sophie": "Vanilla"
//]
//
//favoriteIceCream["Paul"]
//favoriteIceCream["Charlotte"]
//favoriteIceCream["Charlotte", default: "Unknown"]


var favoriteBeerStyle = [
    "John": "IPA",
    "Joe": "Lager"
]

favoriteBeerStyle["John"]
favoriteBeerStyle["Jason"]
favoriteBeerStyle["Jason", default: "Unknown"]
// If the key "Jason" doesn't exist, "Unknown" will be returned

favoriteBeerStyle["Jason"] = "A cold one"


//var teams = [String: String]()
//teams["Paul"] = "Red"
//
//
//
//var results = [Int]()
//
//var words = Set<String>()
//var numbers = Set<Int>()
//
//var scores = Dictionary<String, Int>()
//var results1 = Array<Int>()



let result = "failure"
let result2 = "failed"
let result3 = "fail"


enum Result {
    case success
    case failure
}

let result4 = Result.failure


//enum Activity {
//    case bored
//    case running
//    case talking
//    case singing
//}


//enum Activity {
//    case bored
//    case running(destination: String)
//    case talking(topic: String)
//    case singing(volume: Int)
//}
//
//
//let talking = Activity.talking(topic: "football")
//
//
////enum Planet: Int {
////    case mercury
////    case venus
////    case earth
////    case mars
////}
////
////let earth = Planet(rawValue: 2)
//
//
//enum Planet: Int {
//    case mercury = 1
//    case venus
//    case earth
//    case mars
//}
//
//let earth = Planet(rawValue: 3)
