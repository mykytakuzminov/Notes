// MARK: - Enum
// Enum - это собственный тип данных, который имеет фиксированный набор связанных значений.

// MARK: - Инициализация перечесления
// Перечисления не могут иметь хранимые свойства
// Протокол CaseIterable позволяет получить коллекцию всех случаев перечисления
// Сырые значения типа String
enum Season: String, CaseIterable {
    case spring = "Spring🌸"
    case summer = "Summer🌞"
    case winter = "Winter❄️"
    case autumn = "Autumn🍂"
    
    // MARK: Вычесляемые свойства
    var color: String {
        switch self {
        case .winter:
            "White"
        case .spring:
            "Green"
        case .summer:
            "Yellow"
        case .autumn:
            "Orange"
        }
    }
    
    // MARK: Методы пересления
    mutating func next() {
        switch self {
        case .spring:
            self = .summer
        case .summer:
            self = .winter
        case .winter:
            self = .autumn
        case .autumn:
            self = .spring
        }
    }
}

// MARK: - Инициализация объекта перечисления
var season: Season = .autumn

// MARK: - Использование enum в switch
switch season {
case .spring:
    print("Spring")
case .summer:
    print("Summer")
case .winter:
    print("Winter")
case .autumn:
    print("Autumn")
}
// "Autumn"

// MARK: - Использование метода перечисления
season.next()
print(season)
// "spring"

// MARK: - Использование CaseIterable протокола
for season in Season.allCases {
    print(season)
}
// "spring"
// "summer"
// "winter"
// "autumn"

// MARK: - Итерирование по всем сырым значениям перечисления
for season in Season.allCases {
    print(season.rawValue)
}
// "Spring🌸"
// "Summer🌞"
// "Winter❄️"
// "Autumn🍂"

// MARK: - Доступ к перечислению через сырое значение
let summer = Season(rawValue: "Summer🌞")
print(summer ?? "")
// "summer"

// MARK: - Использование if-case
if case .summer = season {
    print("It's summer!")
} else {
    print("It's not summer!")
}
// "It's not summer!"

// MARK: - Получение цвета из свойства перечисления
for season in Season.allCases {
    print("\(season.rawValue) : \(season.color)")
}
// "Spring🌸 : Green"
// "Summer🌞 : Yellow"
// "Winter❄️ : White"
// "Autumn🍂 : Orange"
