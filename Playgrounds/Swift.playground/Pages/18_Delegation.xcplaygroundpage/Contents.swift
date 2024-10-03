// MARK: - Delegation
// Delegation - способ делегировать задачи другому типу данных.

// MARK: - Создание делегата
protocol CounterDelegate: AnyObject {
    func increament() -> Void
}

class Counter: CounterDelegate {
    private(set) var count: Int = 0 {
        didSet { print("Counter value: \(count)") }
    }
    
    func increament() {
        count += 1
    }
}

class Control {
    var delegate: CounterDelegate?
    
    func buttonClicked() {
        delegate?.increament()
    }
}

// MARK: - Создание объектов
let counter = Counter()
let control = Control()

control.delegate = counter
control.buttonClicked()
control.buttonClicked()
// "Counter value: 1"
// "Counter value: 2"
