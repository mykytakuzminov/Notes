// MARK: - Polymorphism
// Polymorphism - способность использования разных типов данных.

// MARK: - Полиморфизм через наследование
class Animal {
    func makeSound() {
        print("Animal makes a sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Dog barks")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Cat meows")
    }
}

func printAnimalSound(animal: Animal) {
    animal.makeSound()
}

let dog = Dog()
let cat = Cat()

printAnimalSound(animal: dog)
printAnimalSound(animal: cat)
// "Dog barks"
// "Cat meows"

// MARK: - Полиморфизм через протоколы
protocol SoundMaking {
    func makeSound()
}

class DogProtocol: SoundMaking {
    func makeSound() {
        print("Dog barks")
    }
}

class CatProtocol: SoundMaking {
    func makeSound() {
        print("Cat meows")
    }
}

func printSoundMaking(animal: SoundMaking) {
    animal.makeSound()
}

let dogProtocol = DogProtocol()
let catProtocol = CatProtocol()

printSoundMaking(animal: dogProtocol)
printSoundMaking(animal: catProtocol)
// "Dog barks"
// "Cat meows"

// MARK: - Полиморфизм через Any и AnyObject
func printAnyValue(value: Any) {
    if let stringValue = value as? String {
        print("Это строка: \(stringValue)")
    } else if let intValue = value as? Int {
        print("Это целое число: \(intValue)")
    } else if let doubleValue = value as? Double {
        print("Это дробное число: \(doubleValue)")
    } else {
        print("Неизвестный тип")
    }
}

printAnyValue(value: "Hello, World!")
printAnyValue(value: 42)
printAnyValue(value: 3.14)
// "Это строка: Hello, World!"
// "Это целое число: 42"
// "Это дробное число: 3.14"

var animals: [AnyObject] = []

let dogAnyObject = DogProtocol()
let catAnyObject = CatProtocol()

animals.append(dogAnyObject)
animals.append(catAnyObject)

for animal in animals {
    if let soundMakingAnimal = animal as? SoundMaking {
        soundMakingAnimal.makeSound()
    }
}
// "Dog barks"
// "Cat meows"
