import GameplayKit

public class MoneyComponent: GKComponent {

    public private(set) var currentValue: Float {
        didSet {
            currencyWatcher?(currentValue)
        }
    }

    private var currencyWatcher: ((Float) -> Void)?

    public init(initialValue: Float) {
        self.currentValue = initialValue
        super.init()
    }

    public init(initialValue: Float, currencyWatcher: @escaping (Float) -> Void) {
        self.currentValue = initialValue
        self.currencyWatcher = currencyWatcher
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        let inititalValue = coder.decodeFloat(forKey: "initialValue")
        self.init(initialValue: inititalValue)
    }

    public func spend(_ value: Float) -> Bool {
        if currentValue >= value {
            currentValue -= value
            return true
        }
        return false
    }
    public func earn(_ value: Float) {
        currentValue += value
    }
}
