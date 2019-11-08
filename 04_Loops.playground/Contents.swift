import UIKit

//let count = 1...10
//
////for number in count {
////    if number % 100 == 0 {
////        print(number, terminator: " ")
////    }
////}
//
//for number in count {
//    print("\(number): Hello, Julia!... Isn't coding fun?!")
//}

//let jason = "Jason"
//let wendy = "Wendy"
//let julia = "Julia"
//let austin = "Austin"
//let brynn = "Brynn"
//
//let familyMembers = [jason, wendy, julia, austin, brynn]


//let family = ["Jason", "Wendy", "Julia", "Austin", "Brynn"]
//
//for person in family {
//    print("\(person) is in our family")
//}


//print("Players gonna")
//
//for _ in 1...5 {
//    print("play!")
//}


//var number = 1
//
//while number <= 20 {
//    print(number)
//    number += 1
//}
//
//print("Ready or not, here I come!")


//var number = 100
//
//while number > 15 {
//    print(number)
//    number -= 8
//}


//var number = 1
//
//while false {
//    print(number)
//    number += 1
//}


//let coffee = "coffee"
//var isAlive = true
//
//
//func code(with drink: String) {
//    print("Let's code!... with \(drink)!!!")
//}
//
//
//while isAlive {
//    code(with: coffee)
//    break
//}


// Create a range of numbers from 1 to 10
let numbers = 1...100
// ... includes the 10, but ..< would exclude it

for num in numbers {
    print(num)
}


// This works with arrays, too
let gospel = ["Matthew", "Mark", "Luke", "John"]

for name in gospel {
    print("\(name) wrote one of the gospels.")
}


//var number = 1
//
//while number <= 20 {
//    print(number)
//    number += 1
//}
//
//print("Ready or not, here I come!")


var lives = 3

while lives > 0 {
    print("You have \(lives) remaining.")
    lives -= 1
}

print("Game over!")


// Be careful with while loops not to create an infinite loop
// Give a way to break out of the loop

while false {
    print("Going and...")
}
// This will never end!
