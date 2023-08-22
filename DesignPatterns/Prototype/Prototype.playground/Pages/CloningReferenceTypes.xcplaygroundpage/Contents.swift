//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

class Contact: NSCopying {
    
    var firstName: String
    var lastName: String
    var address: Address
    
    init(firstName: String, lastName: String, address: Address) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Contact(firstName: self.firstName, lastName: self.lastName, address: Address(street: "", city: "", zip: ""))
    }
    
    func clone() -> Contact {
        guard let copy = self.copy() as? Contact else { return Contact(firstName: "", lastName: "", address: Address(street: "", city: "", zip: ""))}
        return copy
    }
}

class Address {
    var street: String
    var city: String
    var zip: String
    
    init(street: String, city: String, zip: String) {
        self.street = street
        self.city = city
        self.zip = zip
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

var john = Contact(firstName: "John", lastName: "Appleseed", address: Address(street: "", city: "", zip: ""))
var bob = john.clone()

dump("\(john), \(bob)")

bob.firstName = "Bob"
bob.lastName = "Burger"

dump("\(john), \(bob)")

