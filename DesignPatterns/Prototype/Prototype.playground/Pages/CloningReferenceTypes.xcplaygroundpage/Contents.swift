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
        return Contact(firstName: self.firstName, lastName: self.lastName, address: self.address)
    }
    
    func clone() -> Contact {
        return Contact(firstName: self.firstName, lastName: self.lastName, address: self.address.copy() as! Address)
    }
}

class Address: NSCopying {
    var street: String
    var city: String
    var zip: String
    
    init(street: String, city: String, zip: String) {
        self.street = street
        self.city = city
        self.zip = zip
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return Address(street: self.street, city: self.city, zip: self.city)
    }
}

protocol CustomStringConvertible {
    var description: String { get }
}

extension Contact: CustomStringConvertible {
    var description: String {
       return "Contact(firstName: \"\(firstName)\", lastName: \"\(lastName)\"), address: \"\(address)\")"
    }
}

extension Address: CustomStringConvertible {
    var description: String {
        return "Street: \"\(street)\", City: \"\(city)\", zip: \"\(zip)\""
    }
}

var john = Contact(firstName: "John", lastName: "Appleseed", address: Address(street: "1, Infinite Loop",
                                                                              city: "Cupertino",
                                                                              zip: "95014"))
var bob = john.clone()

dump("\(john), \(bob)")

bob.firstName = "Bob"
bob.lastName = "Burger"
bob.address.city = "Los Angeles"
bob.address.street = "2700, N Vermont Ave"
bob.address.zip = "90027"

dump("\(john), \(bob)")

