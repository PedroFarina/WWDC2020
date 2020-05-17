import SpriteKit
import GameplayKit

public class TowerEntity: GKEntity {
    private static let goodTexture = SKTexture(imageNamed: "Towers/Tower.png")
    private static let badTexture = SKTexture(imageNamed: "Towers/Bad Tower.png")
    private static var selectedTexture = goodTexture

    public override init() {
        super.init()

        addComponent(VisualComponent(texture: TowerEntity.selectedTexture))
        guard let visualNode = visualNode else {
            fatalError("Could not make visual node")
        }

        let visualPoint: () -> CGPoint = {
            return visualNode.position
        }
        visualNode.setScale(0.25)
        addComponent(AimingComponent(radius: 220, targets: [BugEntity.identifier], center: visualPoint))
        addComponent(ShootingComponent(origin: visualPoint))
    }

    public func redrawWithBadTexture() {
        TowerEntity.selectedTexture = TowerEntity.badTexture
        if let visualNode = visualNode as? SKSpriteNode {
            visualNode.texture = TowerEntity.badTexture
        }
    }

    public required convenience init?(coder: NSCoder) {
        self.init()
    }
}

