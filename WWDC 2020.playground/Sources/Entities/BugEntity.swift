import GameKit
import SpriteKit

public class BugEntity: GKEntity, Targetable {
    public static let identifier: String = "Bug"

    private static let textures: [SKTexture] = {
        var texts: [SKTexture] = []
        for i in 1...4 {
            texts.append(SKTexture(imageNamed: "Bug/Bug0\(i).png"))
        }
        return texts
    }()

    public init(path: [CGPoint]) {
        super.init()
        addComponent(VisualComponent(animatedFrames: BugEntity.textures))
        guard let visualNode = visualNode else {
            fatalError("Could not make visual node")
        }
        visualNode.zPosition = 2
        visualNode.setScale(0.5)
        let healthComponent = HealthComponent(health: 50) { (health) in
            if health <= 0, let value = self.moneyValue {
                //Add money to player
            }
        }
        addComponent(healthComponent)
        addComponent(MovementComponent(path: path))
        addComponent(MoneyComponent(initialValue: 10))
    }

    public required convenience init?(coder: NSCoder) {
        guard let path = coder.decodeObject(forKey: "path") as? [CGPoint] else {
            return nil
        }
        self.init(path: path)
    }
}

