import GameplayKit

public class HealthComponent: GKComponent {
    var health: Float

    private var healthWatcher: ((Float) -> Void)?

    public init(health: Float) {
        self.health = health
        super.init()
    }

    init(health: Float, healthWatcher: @escaping (Float) -> Void) {
        self.health = health
        self.healthWatcher = healthWatcher
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        let health = coder.decodeFloat(forKey: "health")
        self.init(health: health)
    }

    public func takeDamageFrom(_ component: DamageComponent) {
        health -= component.damage
        if health <= 0, let entity = entity{
            entity.removeFromManager()
        }
        healthWatcher?(health)
    }
}
