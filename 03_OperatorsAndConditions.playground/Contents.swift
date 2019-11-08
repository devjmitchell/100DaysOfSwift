import UIKit

let firstNumber = 12
let secondNumber = 4

let added = firstNumber + secondNumber
let subtracted = firstNumber - secondNumber

let multiplied = firstNumber * secondNumber
let divided = firstNumber / secondNumber

// The remainder operator (sometimes called modulo) finds the remainder
let remainder = 13 % secondNumber

// % 2 == 0 is a common way to check for even numbers, but Swift 5 has a new way you can do this
let isEven = firstNumber % 2 == 0
// If firstNumber divided by 2 has a remainder of 0, that makes it even!


// Compound operators

var score = 95
score -= 5

// The above does the same thing as this:
var score2 = 95
score2 = score2 - 5

var quote = "Swift is "
quote += "awesome!"


// Comparison operators

firstNumber == secondNumber
firstNumber != secondNumber
firstNumber < secondNumber
firstNumber >= secondNumber


// Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}


// Combining operators

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("One of them is over 18")
}
