import GameplayKit

public class BulletEntity: GKEntity {
    private static let texture = SKTexture(imageNamed: "Bullet/Arrow.png")
    public init(path: [CGPoint]) {
        super.init()
        addComponent(VisualComponent(texture: BulletEntity.texture))
        addComponent(MovementComponent(path: path))
        addComponent(DamageComponent(damage: 100))
    }

    public required convenience init?(coder: NSCoder) {
        guard let path = coder.decodeObject(forKey: "path") as? [CGPoint] else {
            return nil
        }
        self.init(path: path)
    }
}

