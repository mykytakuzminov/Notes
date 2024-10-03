// MARK: - Incapsulation
// Incapsulation - cпособность скрытия частей кода.

// Open класс, который можно наследовать и переопределять в других модулях
open class OpenClass {
    open func openMethod() {
        print("Open method in OpenClass")
    }
}

// Public класс, который также можно наследовать, но не переопределять в других модулях
public class PublicClass: OpenClass {
    public func publicMethod() {
        print("Public method in PublicClass")
    }
    
    public override func openMethod() {
        print("Overridden openMethod in PublicClass")
    }
}

// Internal класс, доступный только внутри модуля
class InternalClass: PublicClass {
    func internalMethod() {
        print("Internal method in InternalClass")
    }
}

// Fileprivate класс, доступный только в пределах этого файла
fileprivate class FilePrivateClass {
    fileprivate func filePrivateMethod() {
        print("FilePrivate method in FilePrivateClass")
    }
}

// Private класс, доступный только внутри определённого класса
class PrivateClass {
    private func privateMethod() {
        print("Private method in PrivateClass")
    }
    
    func callPrivateMethod() {
        privateMethod()
    }
}

// MARK: - Создание экземпляров классов и демонстрация работы методов
let publicInstance = PublicClass()
publicInstance.openMethod()
publicInstance.publicMethod()
// "Overridden openMethod in PublicClass"
// "Public method in PublicClass"

let internalInstance = InternalClass()
internalInstance.internalMethod()
// "Internal method in InternalClass"

fileprivate let filePrivateInstance = FilePrivateClass()
filePrivateInstance.filePrivateMethod()
// "FilePrivate method in FilePrivateClass"

let privateInstance = PrivateClass()
privateInstance.callPrivateMethod()
// "Private method in PrivateClass"
