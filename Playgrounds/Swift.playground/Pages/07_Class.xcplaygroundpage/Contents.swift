// MARK: - Class
// Класс создаёт новый тип данных, который является ссылочным типом.

// MARK: - Инициализация класса
class Person {
    
    // MARK: Свойство типа
    // Можно вызывать на самом типе
    static let species: String = "Homo sapiens"
    
    // MARK: Ленивые свойства
    // Ленивые свойства не могут быть константами
    // Появится в памяти только после обращения к свойству
    lazy var profileImage: String = "ProfileImage"
    
    // MARK: Хранимые свойства класса
    var name: String
    var surname: String
    var age: Int
    
    // MARK: Вычесляемые свойства класса
    var isAdult: Bool {
        age >= 18 ? true : false
    }
    
    var fullName: String {
        
        // MARK: get
        // Выполняется при получении нового значения
        get {
            name + " " + surname
            
        // MARK: set
        // Выполняется при присванивании нового значения
        } set {
            let splitted = newValue.split(separator: " ")
            name = String(splitted.first ?? "")
            surname = String(splitted.last ?? "")
        }
    }
    
    // MARK: Наблюдатели за свойствами
    // Наблюдатели за свойствами не вызываються при инициализации
    // Вызываются при передачи в функцию с inout параметром
    var passportID: String {
        
        // MARK: didSet
        // Выполняется после установки нового значения
        didSet {
            print("Old passport ID was: \(oldValue)")
            print("New passport ID is: \(passportID)")
        }
    }
    
    // MARK: - Инициализаторы класса
    // Классы не имеют инициализатор по умолчанию
    init(name: String, surname: String, age: Int, passportID: String) {
        self.name = name
        self.surname = surname
        self.age = age
        self.passportID = passportID
    }
    
    // MARK: Методы типа
    // Можно вызывать на самом типе
    static func speak() {
        print("I'm a person!")
    }
    
    // MARK: Методы класса
    func change(name: String) {
        self.name = name
    }
    
    func change(surname: String) {
        self.surname = surname
    }
}

// MARK: - Создание объекта
let person = Person(name: "John", surname: "Smith", age: 25, passportID: "197843")

// MARK: - Доступ к свойствам и методам объекта класса
print(person.name + " " + person.surname)
// "John Smith"

print(person.fullName)
// "John Smith"

person.fullName = "Jane Doe"

print(person.name)
// "Jane"

print(person.surname)
// "Doe"

print("Person is adult: \(person.isAdult), because age is \(person.age)")
// "Person is adult: true, because age is 25"

person.passportID = "576349"
// "Old passport ID was: 197843"
// "New passport ID is: 576349"

print(Person.species)
// "Homo sapiens"

Person.speak()
// "I'm a person!"
