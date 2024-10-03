// MARK: - Closure
// Closure - тоже самое, что и функция, но с скоращённым синтаксисом

// MARK: - Создание кложура
let addSomeNumbers: (Int, Int) -> Int = { (firstNumber, secondNumber) in
    return firstNumber + secondNumber
}

print(addSomeNumbers(5, 2))
// 7

// MARK: - Сокращённый синтаксис
let subtractSomeNumbers: (Int, Int) -> Int = { $0 - $1 }

print(subtractSomeNumbers(5, 2))
// 3

// MARK: - Trailing notation
func doActionWithNumbers(_ firstNumber: Int, _ secondNumber: Int, action: (Int, Int) -> Int) -> Int {
    action(firstNumber, secondNumber)
}

print(doActionWithNumbers(4, 4) { $0 + $1 })
// 8

// MARK: - Autoclosure
func greeting(bool: Bool, action: @autoclosure () -> ()) {
    if bool {
        action()
    } else {
        print("Hi, User!")
    }
}

greeting(bool: true, action: print("Hi, Nick!"))
// "Hi, Nick!"

greeting(bool: false, action: print("Hi, Nick"))
// "Hi, User!"

// MARK: - Захват значений кложуром
var count = 1

let increaseNumber = { [count] in
    print(count)
}

increaseNumber()
// 1

count += 1
print(count)
// 2

increaseNumber()
// 1

