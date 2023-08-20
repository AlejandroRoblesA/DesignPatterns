import UIKit

struct Contact {
    var firstName: String
    var lastName: String
}

var john = Contact(firstName: "John", lastName: "Appleseed")
var bob = john

print("\(john), \n\(bob)")

bob.firstName = "Bob"
bob.lastName = "Burger"

print("\(john), \n\(bob)")
