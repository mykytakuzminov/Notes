// MARK: - Extension
// Extension - это дополнение новой функциональности для типов данных.

// MARK: - Создание дополнения
extension Double {
    
    // MARK: Вычисляемые свойства дополнения
    var km: Double { self / 1_000.0 }
    var m: Double { self }
    var cm: Double { self * 100.0 }
    var mm: Double { self * 1_000.0 }
}

extension Int {
    
    // MARK: Перечисления дополнения
    enum Kind: String {
        case positive, zero, negative
    }
    
    var kind: Kind {
        switch self {
        case 0: return .zero
        case let x where x > 0: return .positive
        default: return .negative
        }
    }
    
    // MARK: Методы дополнения
    mutating func square() -> Int {
        return self * self
    }
}

let distance: Double = 100
var number: Int = 5

// MARK: - Использование дополнения на тип Double и Int
print("\(distance.km)km, \(distance.m)m, \(distance.cm)cm, \(distance.mm)mm")
// "0.1km, 100.0m, 10000.0cm, 100000.0mm"

print("Square of 5 is \(number.square())")
// "Square of 5 is 25"

print("\(number) is a \(number.kind) number")
// "5 is a positive number"
