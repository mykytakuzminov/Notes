// MARK: - PropertyWrapper
// PropertyWrapper - это обёртка для свойств, которая добавляет логику хранения.

// MARK: - Создание своих PropertyWrappers
@propertyWrapper
struct Trimmed {
    private var text = ""
    
    var wrappedValue: String {
        get { return text }
        set { text = trim(newValue)}
    }
    
    private func trim(_ text: String) -> String {
        var trimmedString = text
        
        while let first = trimmedString.first, first.isWhitespace {
            trimmedString.removeFirst()
        }
        
        while let last = trimmedString.last, last.isWhitespace {
            trimmedString.removeLast()
        }
        
        return trimmedString
    }
}

@propertyWrapper
struct Clamped {
    private var minValue: Int
    private var maxValue: Int
    private var number: Int = 0
    
    var wrappedValue: Int {
        get { return number }
        set { number = clamp(newValue) }
    }
    
    init(minValue: Int, maxValue: Int) {
        self.minValue = minValue
        self.maxValue = maxValue
    }
    
    private func clamp(_ number: Int) -> Int {
        var clampedNumber: Int
        
        clampedNumber = min(number, maxValue)
        clampedNumber = max(minValue, clampedNumber)
        
        return clampedNumber
    }
}

@propertyWrapper
struct Logged {
    private var string: String
    
    var logs: [String] = []
    
    var wrappedValue: String {
        get { string }
        set { logs.append(newValue); string = newValue }
    }
    
    var projectedValue: [String] {
        return logs
    }
    
    init(wrappedValue: String) {
        self.string = wrappedValue
        logs.append(wrappedValue)
    }
}
// MARK: - Проверка обёрток свойств
struct TrimmedString {
    
    @Trimmed var text: String
    
}

struct ClampedInt {
    
    @Clamped(minValue: 16, maxValue: 64) var number: Int
}

struct LoggedString {
    
    @Logged(wrappedValue: "Hello!") var text: String
}

var trimmedText = TrimmedString()
trimmedText.text = "  Hello, World!   "
print(trimmedText.text)
// "Hello, World!"

var clampedInt = ClampedInt()
clampedInt.number = 100
print(clampedInt.number)
// 64

var loggedString = LoggedString()
loggedString.text = "My name is Nick"
loggedString.text = "I am 18 years old"
loggedString.text = "How is it going?"
for log in loggedString.$text {
    print(log)
}
// "Hello!"
// "My name is Nick"
// "I am 18 years old"
// "How is it going?"
