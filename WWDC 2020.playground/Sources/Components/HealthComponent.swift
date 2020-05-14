import GameplayKit

public class HealthComponent: GKComponent {
    var health: Float

    public init(health: Float) {
        self.health = health
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        let health = coder.decodeFloat(forKey: "health")
        self.init(health: health)
    }

    public func takeDamageFrom(_ component: DamageComponent) {
        health -= component.damage
    }
}
