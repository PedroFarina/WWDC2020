import GameplayKit

public class ShootingComponent: GKComponent {
    let origin: () -> CGPoint
    let rateOfFire: TimeInterval = 0.6
    var timeTillNextAttack:TimeInterval = 0

    init(origin: @escaping () -> CGPoint) {
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
        guard let entity = entity,
            let target = entity.target,
            timeTillNextAttack < 0 else {
                return
        }

        timeTillNextAttack = rateOfFire

        //Make a bullet entity and fire it
    }
}
