import UIKit


// Structs come with a default initializer that requires you to provide a value for each property when you create an instance of the struct (I showed using it in my last post)
// You can create your own initializer that will replace the default initializer

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "dev_jmitchell"


// Refer to struct's property with `self`, i.e. `self.name`
// Refer to parameter by using parameter name, i.e. `name`

struct Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


// Lazy properties allow you to only create a property with it is being accessed
// Don't show an example, just explain what it is and that you create a lazy variable with keyword `lazy`?


// Static properties - write that Paul Hudson has a great example of static property, but then explain that I've also used in things like custom colors

// Use like this: Colors.teal

struct Colors {
    static let teal = UIColor(red: 0/255, green: 128/255, blue: 128/255, alpha: 1.0)
}


// Paul's example of using a private variable -- Come up with my own? Or explain different types of access controls (if not talked about in later lesson)?

//struct Person {
//    private var id: String
//
//    init(id: String) {
//        self.id = id
//    }
//
//    func identify() -> String {
//        return "My social security number is \(id)"
//    }
//}
