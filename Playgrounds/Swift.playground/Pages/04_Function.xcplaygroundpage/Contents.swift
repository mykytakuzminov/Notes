// MARK: - Function
// Function - это блок кода, который предназначен для выполнения определённой задачи. Она имеет своё имя, параметры и возвращаемый результат.

// MARK: - Создание функции
func greetingWithoutName() {
    print("Hello!")
}

greetingWithoutName()
// "Hello!"

// MARK: - Функция с одним параметром
func greetingWithName(name: String) {
    print("Hello, \(name)!")
}

greetingWithName(name: "Nick")
// "Hello, Nick!"

// MARK: - Функция с двумя параметрами
func customGreetingWithName(greeting: String, name: String) {
    print("\(greeting), \(name)!")
}

customGreetingWithName(greeting: "Hi", name: "Mike")
// "Hi, Mike!"

// MARK: - Функция с параметром по умолчанию
func customGreeting(greeting: String = "Hello") {
    print("\(greeting)!")
}

customGreeting()
// "Hello!"

customGreeting(greeting: "Hi")
// "Hi!"

// MARK: - Возвращение результата с функции
func addSomeNumbers(firstNumber: Int, secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}

print(addSomeNumbers(firstNumber: 2, secondNumber: 6))
// 8

// MARK: - Неявное возвращение результата с функции
func subtractSomeNumbers(firstNumber: Int, secondNumber: Int) -> Int {
    firstNumber - secondNumber
}

print(subtractSomeNumbers(firstNumber: 5, secondNumber: 1))
// 4

// MARK: - Изменение значения переменной извне
var string = "Hello, everyone!"

func makeStringUppercased( string: inout String) {
    string = string.uppercased()
}

makeStringUppercased(string: &string)

print(string)
// "HELLO, EVERYONE!"

// MARK: - Передача функции как параметр
func makeCalculation(action: (Int, Int) -> (Int), firstNumber: Int, secondNumber: Int) -> Int {
    action(firstNumber, secondNumber)
}

print(makeCalculation(action: addSomeNumbers, firstNumber: 3, secondNumber: 6))
// 9

print(makeCalculation(action: subtractSomeNumbers, firstNumber: 6, secondNumber: 3))
// 3

// MARK: - Возвращение функции как результат
func chooseAction(bool: Bool) -> (Int, Int) -> Int {
    if bool {
        return addSomeNumbers
    } else {
        return subtractSomeNumbers
    }
}

var action: (Int, Int) -> Int = chooseAction(bool: true)
// addSomeNumbers
