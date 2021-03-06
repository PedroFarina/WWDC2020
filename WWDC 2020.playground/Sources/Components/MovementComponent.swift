import GameplayKit
import SpriteKit

public class MovementComponent: GKComponent {

    private let speed: Double
    private var canMove: Bool = true
    public private(set) var path: [CGPoint]

    public init(path: [CGPoint], speed: Double = 3) {
        self.path = path
        self.speed = speed
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        guard let path = coder.decodeObject(forKey: "path") as? [CGPoint] else {
            return nil
        }
        self.init(path: path)
    }

    var movingRight: Bool = true
    public override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        if canMove {
            if let nextPoint = path.first, let visualNode = entity?.visualNode {
                canMove = false
                let duration = 1 / speed
                if nextPoint.x < visualNode.position.x {
                    if movingRight {
                        visualNode.xScale = -visualNode.xScale
                    }
                    movingRight = false
                } else {
                    if !movingRight {
                        visualNode.xScale = -visualNode.xScale
                    }
                    movingRight = true
                }
                let moveAction = SKAction.move(to: nextPoint, duration: duration)
                visualNode.run(moveAction) {
                    self.canMove = true
                }
                path.removeFirst()
            } else if path.isEmpty {
                canMove = false
                if let target = entity?.target {
                    entity?.dealDamageTo(target)
                }
                entity?.removeFromManager()
            }
        }
    }
}


