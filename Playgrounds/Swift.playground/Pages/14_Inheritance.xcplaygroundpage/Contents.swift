// MARK: - Inheritance
// Inheritance - это способность унаследования функциональности.

// MARK: - Создание родительского класса
class Animal {
    let name: String
    var age: Int
    var weight: Double
    
    init(name: String, age: Int, weight: Double) {
        self.name = name
        self.age = age
        self.weight = weight
    }
    
    func eat() {
        print("\(self.name) is eating")
    }
    
    func sleep() {
        print("\(self.name) is sleeping")
    }
}

// MARK: - Создание дочерних классов
class Mammal: Animal {
    let isWarmBlooded = true
    var hasFur: Bool
    
    init(name: String, age: Int, weight: Double, hasFur: Bool) {
        self.hasFur = hasFur
        super.init(name: name, age: age, weight: weight)
    }
    
    func giveBirth() {
        print("\(self.name) is giving birth")
    }
}

class Bird: Animal {
    var canFly: Bool
    
    init(name: String, age: Int, weight: Double, canFly: Bool) {
        self.canFly = canFly
        super.init(name: name, age: age, weight: weight)
    }
    
    func fly() {
        print("\(self.name) is flying")
    }
    
    func layEggs() {
        print("\(self.name) is laying eggs")
    }
}

final class Dog: Mammal {
    
    func bark() {
        print("\(self.name) is barking")
    }
}

final class Cat: Mammal {
    
    func meow() {
        print("\(self.name) is meowing")
    }
}

final class Parrot: Bird {
    
    func say() {
        print("\(self.name) is saying")
    }
    
    override func fly() {
        super.fly()
        print("Yoo-hoo")
    }
}

final class Chicken: Bird {
    
    override var canFly: Bool {
        get {
            false
        }
        set {
            super.canFly = false
        }
    }
    
    override func fly() {
        print("\(self.name) can't fly")
    }
}

// MARK: - Создание объектов классов
var dog: Dog = Dog(name: "Rex", age: 4, weight: 100, hasFur: true)
var cat: Cat = Cat(name: "Mia", age: 1, weight: 10, hasFur: false)
var parrot: Parrot = Parrot(name: "Tweety", age: 2, weight: 100, canFly: true)
var chicken: Chicken = Chicken(name: "Cluck", age: 2, weight: 10, canFly: false)

var animals: [Animal] = [dog, cat, parrot, chicken]

for animal in animals {
    print("\(animal.name) is \(animal.age) years old")
}
// "Rex is 4 years old"
// "Mia is 1 years old"
// "Tweety is 2 years old"
// "Cluck is 2 years old"

dog.bark()
cat.meow()
parrot.say()
// "Rex is barking"
// "Mia is meowing"
// "Tweety is saying"

parrot.fly()
chicken.fly()
// "Tweety is flying"
// "Yoo-hoo"
// "Cluck can't fly"

chicken.canFly = true
print(chicken.canFly)
// false
