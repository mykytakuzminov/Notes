// MARK: - Set
// Set - коллекция уникальных и неупорядоченных элементов.

// MARK: - Инициализация пустого сэта
var ingredients: Set<String> = []
var colors = Set<String>()
var numbers: Set = [5, 9, 3, 5, 1]

// MARK: - Добавление элементов
ingredients.insert("Cocoa beans")
ingredients.insert("Sugar")
ingredients.insert("Cocoa butter")
ingredients.insert("Salt")

colors.insert("Black")
colors.insert("White")
colors.insert("Red")

// MARK: - Доступ к элементам сэта
print(ingredients.first ?? "")
// "Cocoa beans"

print(ingredients.randomElement() ?? "")
// "Salt"

// MARK: - Проверка сэта
print(colors.isEmpty)
// false

print(colors.count)
// 3

// MARK: - Удаление элементов сэта
colors.remove("Black")
print(colors)
// ["White", "Red"]

ingredients.removeFirst()
print(ingredients)
// ["Sugar", "Cocoa beans", "Salt"]

colors.removeAll()
print(colors)
// []

// MARK: - Объединение сэтов
var firstSet: Set = [1, 3, 5, 7]
var secondSet: Set = [2, 4, 6, 8]
var thirdSet: Set = [1, 4, 5, 8]

print(firstSet.union(secondSet))
// [8, 1, 7, 6, 2, 5, 3, 4]

print(thirdSet.intersection(firstSet))
// [1, 5]

print(thirdSet.symmetricDifference(secondSet))
// [1, 5, 6, 2]

print(thirdSet.subtracting(secondSet))
// [5, 1]

// MARK: - Сравнение сэтов
var fourthSet: Set = [1, 2, 3]
var fifthSet: Set = [1, 2, 3, 4, 5, 6]
var sixthSet: Set = [4, 5, 6, 7]

print(fourthSet.isSubset(of: fifthSet))
// true

print(fourthSet.isStrictSubset(of: fifthSet))
// true

print(fifthSet.isSubset(of: sixthSet))
// false

print(fifthSet.isStrictSuperset(of: fourthSet))
// true

print(fourthSet.isDisjoint(with: sixthSet))
// true
