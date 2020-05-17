
import GameplayKit

public class DamageComponent: GKComponent {

    public let damage: Float

    public init(damage: Float) {
        self.damage = damage
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        let damage = coder.decodeFloat(forKey: "damage")
        self.init(damage: damage)
    }
}
