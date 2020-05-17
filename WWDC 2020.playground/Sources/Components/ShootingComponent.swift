import GameplayKit

public class ShootingComponent: GKComponent {
    let origin: () -> CGPoint
    let rateOfFire: TimeInterval = 1
    var timeTillNextAttack:TimeInterval = 0

    public init(origin: @escaping () -> CGPoint) {
        self.origin = origin
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        guard let origin = coder.decodeObject(forKey: "origin") as? () -> CGPoint else {
                return nil
        }
        self.init(origin: origin)
    }

    public override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)

        timeTillNextAttack -= seconds
        guard let target = entity?.target,
            let node = target.visualNode,
            timeTillNextAttack < 0 else {
                return
        }

        timeTillNextAttack = rateOfFire

        //Make a bullet entity and fire it
        let bullet = BulletEntity(path: [origin(), node.position])
        bullet.visualNode?.rotateToFaceNode(node.position, source: origin())
        bullet.addToSceneAt(origin())
    }
}
