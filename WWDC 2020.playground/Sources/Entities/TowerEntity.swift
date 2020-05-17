import SpriteKit
import GameplayKit

public class TowerEntity: GKEntity {
    private static let goodTexture = SKTexture(imageNamed: "Towers/Tower.png")

    public override init() {
        super.init()

        addComponent(VisualComponent(texture: TowerEntity.goodTexture))
        guard let visualNode = visualNode else {
            fatalError("Could not make visual node")
        }

        let visualPoint: () -> CGPoint = {
            return visualNode.position
        }
        visualNode.setScale(0.3)
        addComponent(AimingComponent(radius: 220, targets: [BugEntity.identifier], center: visualPoint))
        addComponent(ShootingComponent(origin: visualPoint))
    }

    public required convenience init?(coder: NSCoder) {
        self.init()
    }
}

