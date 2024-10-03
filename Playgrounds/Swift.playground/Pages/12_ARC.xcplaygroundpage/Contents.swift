// MARK: - ARC
// Heap - куча.
// Stack - стэк.

// В стэке храняться Value типы.
// В куче хрнаяться Reference типы.

// Strong ссылка удерживает объект в памяти.
// Weak ссылка не удерживает объект в памяти, после удаления становится nil.
// Unowned ссылка не удерживает объект в памяти, после удаления продолжает ссылаться.

// MARK: - Первый пример
class Person {
    var name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Pet {
    var name: String
    weak var owner: Person?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

// Создание циклической ссылки
var john: Person? = Person(name: "John")
var fluffy: Pet? = Pet(name: "Fluffy")

john?.pet = fluffy
fluffy?.owner = john

// Освобождение памяти
john = nil
fluffy = nil
// "John is being deinitialized"
// "Fluffy is being deinitialized"

// MARK: - Второй пример
class ViewController {
    var name: String
    var buttonAction: (() -> Void)?
    
    init(name: String) {
        self.name = name
        buttonAction = { [weak self] in
            print("Button pressed in \(self?.name ?? "")")
        }
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

// Создание объекта ViewController
var viewController: ViewController? = ViewController(name: "MainViewController")

// Симуляция освобождения объекта
viewController = nil
// "MainViewController is being deinitialized"

// MARK: - Третий пример
class Developer {
    var name: String
    weak var currentProject: Project?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Developer \(name) is being initialized")
    }
}

class Project {
    var title: String
    var task: (() -> Void)?
    
    var manager: Manager?
    
    init(title: String) {
        self.title = title
    }
    
    deinit {
        print("Developer \(title) is being initialized")
    }
}

class Manager {
    var name: String
    var developer: Developer?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Manager \(name) is being initialized")
    }
}

// Создание объектов и ссылок
var developer: Developer? = Developer(name: "Alice")
var project: Project? = Project(title: "App Development")
var manager: Manager? = Manager(name: "Bob")

developer?.currentProject = project
project?.manager = manager
manager?.developer = developer

project?.task = { [weak project, manager, developer] in
    print("Working on \(project!.title) with manager \(manager!.name) and developer \(developer!.name)")
}

// Освобождение объектов
developer = nil
project = nil
manager = nil
// "Developer App Development is being initialized"
// "Manager Bob is being initialized"
// "Developer Alice is being initialized"
