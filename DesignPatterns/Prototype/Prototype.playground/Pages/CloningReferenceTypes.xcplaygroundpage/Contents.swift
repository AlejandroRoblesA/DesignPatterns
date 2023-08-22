//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class Contact {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

protocol CustomStringConvertible {
    var description: String { get }
}

extension Contact: CustomStringConvertible {
    var description: String {
       return "Contact(firstName: \"\(firstName)\", lastName: \"\(lastName)\")"
    }
}

var john = Contact(firstName: "John", lastName: "Appleseed")
var bob = john

dump("\(john), \(bob)")

bob.firstName = "Bob"
bob.lastName = "Burger"

dump("\(john), \(bob)")

