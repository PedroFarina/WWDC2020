import GameKit
import SpriteKit

public class BugEntity: GKEntity {
    private static let textures: [SKTexture] = {
        var texts: [SKTexture] = []
        for i in 1...4 {
            texts.append(SKTexture(imageNamed: "Bug/Bug0\(i).png"))
        }
        return texts
    }()

    init(path: [CGPoint]) {
        super.init()
        addComponent(VisualComponent(animatedFrames: BugEntity.textures))
        guard let visualNode = visualNode else {
            fatalError("Could not make visual node")
        }
        visualNode.setScale(0.1)
        addComponent(HealthComponent(health: 50))
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

