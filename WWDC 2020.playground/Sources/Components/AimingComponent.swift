import GameplayKit

public class AimingComponent: GKComponent {
    public private(set) var target: GKEntity?
    let radius: CGFloat
    let center: () -> CGPoint
    private let targets: [String]

    public init(radius: CGFloat, targets: [String], center: @escaping () -> CGPoint) {
        self.radius = radius
        self.center = center
        self.targets = targets
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        guard let center = coder.decodeObject(forKey: "center") as? () -> CGPoint,
            let radius = coder.decodeObject(forKey: "radius") as? CGFloat,
            let targets = coder.decodeObject(forKey: "targets") as? [String] else {
                return nil
        }
        self.init(radius: radius, targets: targets, center: center)
    }

    public override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        target = nil
        for entity in EntityManager.shared().getTargets(for: targets) {
            guard let node = entity.visualNode else {
                continue
            }
            let dif = center().differenceTo(node.position)
            if dif <= radius {
                self.target = entity
                return
            }
        }
    }
}
