// MARK: - Array
// Array - коллекция неуникальных и упорядоченных элементов.

// MARK: - Инициализация пустого массива
var oddNumbers = [Int]()
var streets = Array<String>()
var numbers: [Double] = []

// MARK: - Добавление элементом
oddNumbers.append(1)

print(oddNumbers)
// [1]

oddNumbers.append(contentsOf: [3, 5, 7, 9])

print(oddNumbers)
// [1, 3, 5, 7, 9]

streets.append(contentsOf: ["Albemarle", "Brandywine", "Chesapeake"])
numbers.append(contentsOf: [1.1, 4.3, 2.7, 9.8, 1.2, 3.4, 7.5, 3.3, 8.5])

// MARK: - Доступ к элементам массива
print(oddNumbers.randomElement() ?? 1)
// 3

print(streets.first ?? "Error")
// "Albemarle"

print(numbers.last ?? 0.0)
// 8.5

// MARK: - Проверка массива
print(oddNumbers.isEmpty)
// false

print(streets.count)
// 3

// MARK: - Удаление элементом из массива
print(oddNumbers.remove(at: 3))
// 7
// [1, 3, 5, 9]

print(oddNumbers.removeFirst())
// 1
// [3, 5, 9]

oddNumbers.removeFirst(2)
print(oddNumbers)
// [9]

print(numbers.removeLast())
// 8.5
// [1.1, 4.3, 2.7, 9.8, 1.2, 3.4, 7.5, 3.3]

numbers.removeLast(2)
print(numbers)
// [1.1, 4.3, 2.7, 9.8, 1.2, 3.4]

numbers.removeSubrange(1...2)
print(numbers)
// [1.1, 9.8, 1.2, 3.4]

streets.removeAll()
print(streets)
// []

// MARK: - Нахождение элемента в массиве
print(numbers.contains(2.7))
// false

print(numbers.contains(where: { $0 > 3.0 }))
// true

print(oddNumbers.allSatisfy({ $0 % 2 != 0 }))
// true

print(numbers.first(where: { $0 > 1.5} ) ?? 1.5)
// 9.8

print(numbers.firstIndex(of: 1.2) ?? 0)
// 2

print(numbers.last(where: { $0 > 1.5} ) ?? 1.5)
// 3.4

print(numbers.lastIndex(of: 1.2) ?? 0)
// 2

print(numbers.max() ?? 10)
// 9.8

print(numbers.min() ?? 0)
// 1.1

// MARK: - Выбор элементов массива
print(numbers.prefix(3))
// [1.1, 9.8, 1.2]

print(numbers.suffix(3))
// [9.8, 1.2, 3.4]

// MARK: - Трансформация массива
var stringNumbers = numbers.map { String($0) }
print(stringNumbers)
// ["1.1", "9.8", "1.2", "3.4"]

stringNumbers.append(contentsOf: ["Hi!", "Hello!"])
// ["1.1", "9.8", "1.2", "3.4", "Hi!", "Hello!"]

var doubleNumbers = stringNumbers.compactMap({ Double($0) })
// ["1.1", "9.8", "1.2", "3.4"]

var sum = doubleNumbers.reduce(0) { $0 + $1 }
// 15.5

// MARK: - Переупорядочивание массива
print(doubleNumbers.sorted())
// [1.1, 1.2, 3.4, 9.8]

print(doubleNumbers.sorted(by: { $0 > $1 }))
// [9.8, 3.4, 1.2, 1.1]

doubleNumbers.reverse()
print(doubleNumbers)
// [3.4, 1.2, 9.8, 1.1]

doubleNumbers.shuffle()
print(doubleNumbers)
// [1.1, 3.4, 9.8, 1.2]
