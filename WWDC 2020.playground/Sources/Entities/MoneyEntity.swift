import GameplayKit

public class MoneyEntity: GKEntity {
    var damaged = false
    public override init() {
        super.init()
        addComponent(VisualComponent(text: "100"))
        guard let visualNode = visualNode as? SKLabelNode else {
            fatalError("Could not make visual node")
        }

        let moneyComponent = MoneyComponent(initialValue: 100) { (money) in
            visualNode.text = String(format: "%.0f", money)
        }
        addComponent(moneyComponent)
    }

    public required convenience init?(coder: NSCoder) {
        self.init()
    }
}

