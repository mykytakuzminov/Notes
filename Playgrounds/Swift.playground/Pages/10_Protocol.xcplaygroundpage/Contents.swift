// MARK: - Protocol
// Protocol - это набор методов и свойств без реализации.

// MARK: - Создание протокола
// Протокол только на ссылочных типах данных с использованием AnyObject
protocol Moveable {
    func go()
}

protocol Driveable: Moveable {
    var carColor: String { get }
    var carSpeed: Int { get }
    func drive()
}

protocol Rideable: Moveable {
    var bikeColor: String { get }
    var bikeSpeed: Int { get }
    func ride()
}

// MARK: - Создание структуры и класса для протоколов
class Human {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Human: Rideable, Driveable {
    var carColor: String { "Black" }
    var carSpeed: Int { 120 }
    
    var bikeColor: String { "Green" }
    var bikeSpeed: Int { 30 }
    
    func go() {
        print("I'm a human and I can go!")
    }
    
    func ride() {
        print("I'm a human and I can ride a bike!")
    }
    
    func drive() {
        print("I'm a human and I can drive a car!")
    }
}

struct Animal {
    let name: String
}

extension Animal: Rideable {
    var bikeColor: String { "Red" }
    var bikeSpeed: Int { 20 }
    
    func go() {
        print("I'm animal and I can go!")
    }
    
    func ride() {
        print("I'm animal and I can ride a bike!")
    }
}

// MARK: - Создание екземпляров класса и структур
var person = Human(name: "John")
var animal = Animal(name: "Pippin")

print("I have a car. It's \(person.carColor)")
// "I have a car. It's Black"

print("I have a bike. It's \(animal.bikeColor)")
// "I have a bike. It's Red"

// MARK: - Создание массива с протоколом
var array: [Moveable] = []
array.append(contentsOf: [person as Moveable, animal as Moveable])

for creature in array {
    creature.go()
}
// "I'm a human and I can go!"
// "I'm animal and I can go!"

// MARK: - Использование is, as?
print(animal is Driveable)
// false

if let driveableAnimal = animal as? Driveable {
    print("This animal can drive a car.")
} else {
    print("This animal cannot drive.")
}
// "This animal cannot drive."
