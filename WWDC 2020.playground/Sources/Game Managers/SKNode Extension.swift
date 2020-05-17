import SpriteKit


public extension SKNode {
    func rotateToFaceNode(_ targetPosition: CGPoint, source: CGPoint) {
        let angle = atan2(targetPosition.y - source.y, targetPosition.x - source.x) - CGFloat(Double.pi/2)
        self.run(SKAction.rotate(toAngle: angle, duration: 0))
    }
}

