import UIKit

//let name = "Taylor"
//
//for letter in name {
//    print("Give me a \(letter)")
//}
//
//
//// Can't do this
////print(name[3])
//
//
//let letter = name[name.index(name.startIndex, offsetBy: 3)]
//
//
//// Could make this extension to let you subscript, but it's not good to do this
//extension String {
//    subscript(i: Int) -> String {
//        return String(self[index(startIndex, offsetBy: i)])
//    }
//}
//
//let letter2 = name[3]


//let password = "12345"
//password.hasPrefix("123")
//password.hasSuffix("456")
//
//extension String {
//    func deletingPrefix(_ prefix: String) -> String {
//        guard self.hasPrefix(prefix) else { return self }
//        return String(self.dropFirst(prefix.count))
//    }
//
//    func deletingSuffix(_ suffix: String) -> String {
//        guard self.hasSuffix(suffix) else { return self }
//        return String(self.dropLast(suffix.count))
//    }
//}
//
//password.deletingPrefix("123")


//let weather = "It's going to rain"
//print(weather.capitalized)
//
//extension String {
//    var capitalizedFirst: String {
//        guard let firstLetter = self.first else { return "" }
//        return firstLetter.uppercased() + self.dropFirst()
//    }
//}
//
//let myString = "here is a string"
//print(myString.capitalizedFirst)


//let input = "Swift is like Objective-C without the C"
//input.contains("Swift")
//
//let languages = ["Python", "Ruby", "Swift"]
//languages.contains("Swift")
//
////// Can do this, but it's not "elegant"... and Swift has a better, built-in solution
////extension String {
////    func containsAny(of array: [String]) -> Bool {
////        for item in array {
////            if self.contains(item) {
////                return true
////            }
////        }
////
////        return false
////    }
////}
////
////input.containsAny(of: languages)
//
//// Better solution
//languages.contains(where: input.contains)


//let string = "This is a test string"
//
////let attributes: [NSAttributedString.Key: Any] = [
////    .foregroundColor: UIColor.white,
////    .backgroundColor: UIColor.red,
////    .font: UIFont.boldSystemFont(ofSize: 36)
////]
////
////let attributedString = NSAttributedString(string: string, attributes: attributes)
//
//let attributedString = NSMutableAttributedString(string: string)
//
//attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
//attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 5, length: 2))
//attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 8, length: 1))
//attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 10, length: 4))
//attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 15, length: 6))
//
//// Some of the things that can be used in attributed strings
////NSAttributedString.Key.underlineStyle
////NSAttributedString.Key.strikethroughStyle
////NSAttributedString.Key.paragraphStyle
////NSMutableParagraphStyle
////NSAttributedString.Key.link



// Challenges

extension String {
    // Challenge 1
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) {
            return self
        } else {
            return prefix + self
        }
    }
    
    // Challenge 2
    var isNumeric: Bool {
        return Double(self) != nil
    }
    
    // Challenge 3
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
}

// Testing challenge 1
"pet".withPrefix("car")
"code".withPrefix("co")

// Testing challenge 2
"123".isNumeric
"123.456".isNumeric
"test".isNumeric

// Testing challenge 3
let string1 = "this\nis\na\ntest"
string1.lines
let string2 = """
this is
another
test
"""
string2.lines
