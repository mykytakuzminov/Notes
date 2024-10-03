// MARK: - Dictionary
// Dictionary - коллекция неупорядоченных ассоциаций ключей и значений.

// MARK: - Инициализация словаря
var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

var emptyDict: [String: String] = [:]

// MARK: - Проверка словаря
print(responseMessages.isEmpty)
// false

print(responseMessages.count)
// 4

// MARK: - Доступ к ключам и значениям
print(responseMessages.keys)
// [500, 200, 404, 403]

print(responseMessages.values)
// ["File not found", "OK", "Access forbidden", "Internal server error"]

print(responseMessages.first ?? [])
// (key: 500, value: "Internal server error")

print(responseMessages.randomElement() ?? [])
// (key: 403, value: "Access forbidden")

// MARK: - Добавление ключей и значений
emptyDict.updateValue("Nick", forKey: "1")
print(emptyDict)
// ["1": "Nick"]

emptyDict["4"] = "Bob"

var anotherEmptyDict = ["1" : "John", "3" : "Mike"]
emptyDict.merge(anotherEmptyDict) { (current, _) in current }
print(emptyDict)
// ["1": "Nick", "3": "Mike", "4": "Bob"]

// MARK: - Удаление ключей и значений
emptyDict.removeValue(forKey: "1")
print(emptyDict)
// ["3": "Mike", "4": "Bob"]

emptyDict["3"] = nil
print(emptyDict)
// ["4": "Bob"]
