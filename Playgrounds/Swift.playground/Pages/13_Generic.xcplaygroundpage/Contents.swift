// MARK: - Generic
// Generic - обобщённый тип данных.

// MARK: - Generics в функциях
func swapTwoValues<T>(_ first: inout T, _ second: inout T) {
    let temp = first
    first = second
    second = temp
}

var a: Int = 5
var b: Int = 3
swapTwoValues(&a, &b)
print(a, b)
// 3, 5

// MARK: - Generics в собственных типах данных
struct Stack<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
}

var stack = Stack<Int>()
stack.push(4)
stack.push(1)
stack.push(9)
print(stack.items)
// [4, 1, 9]

print(stack.pop() ?? 0)
print(stack.items)
// 9
//[4, 1]

// MARK: - Generics в дополнениях
extension Stack {
    var top: T? {
        !items.isEmpty ? items.last : nil
    }
}

extension Stack where Element: Equatable {
    func isTop(_ element: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == element
    }
}

print(stack.top ?? 0)
// 1

print(stack.isTop(7))
// false

// MARK: - Generics в протоколах
protocol Container {
    associatedtype Element
    mutating func append(_ element: Element)
    var count: Int { get }
    subscript(i: Int) -> Element { get }
}

extension Stack: Container {
    var count: Int {
        items.count
    }
    
    mutating func append(_ element: T) {
        self.push(element)
    }
    
    subscript(i: Int) -> T {
        items[i]
    }
}

stack.append(8)
print(stack.count)
// 3

print(stack[2])
//8

// MARK: - Ограничение типов
func findIndex<T: Equatable>(of value: T, in array: [T]) -> Int? {
    for (index, element) in array.enumerated() {
        if element == value {
            return index
        }
    }
    return nil
}

print(findIndex(of: 3, in: [1, 2, 3, 4, 5]) ?? 0)
// 2

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Element == C2.Element, C1.Element: Equatable {
    
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stack1 = Stack<Int>()
stack1.append(4)
stack1.append(1)
stack1.append(8)

let bool = allItemsMatch(stack, stack1)

print(bool ? "Items matched" : "Items didn't match")
// "Items matched"
