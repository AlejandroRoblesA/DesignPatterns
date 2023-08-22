//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class Contact: NSCopying {
    
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Contact(firstName: self.firstName, lastName: self.lastName)
    }
    
    func clone() -> Contact {
        guard let copy = self.copy() as? Contact else { return Contact(firstName: "", lastName: "")}
        return copy
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
var bob = john.clone()

dump("\(john), \(bob)")

bob.firstName = "Bob"
bob.lastName = "Burger"

dump("\(john), \(bob)")

