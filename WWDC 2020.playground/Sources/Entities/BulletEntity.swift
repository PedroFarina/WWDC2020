import GameplayKit

public class BulletEntity: GKEntity {
    private static let texture = SKTexture(imageNamed: "Bullet/Arrow.png")
    public init(path: [CGPoint]) {
        super.init()
        addComponent(VisualComponent(texture: BulletEntity.texture))
        guard let visualNode = visualNode else {
            fatalError("Could not make visual node")
        }
        visualNode.setScale(0.4)
        let visualPoint: () -> CGPoint = {
            return visualNode.position
        }
        addComponent(AimingComponent(radius: 50, targets: [BugEntity.identifier], center:visualPoint))

        addComponent(MovementComponent(path: path, speed: 20))
        addComponent(DamageComponent(damage: 50))
    }

    public required convenience init?(coder: NSCoder) {
        guard let path = coder.decodeObject(forKey: "path") as? [CGPoint] else {
            return nil
        }
        self.init(path: path)
    }
}

