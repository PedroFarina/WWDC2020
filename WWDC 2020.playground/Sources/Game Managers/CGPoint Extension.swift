import CoreGraphics

public extension CGPoint {
    func differenceTo(_ point: CGPoint) -> CGFloat {
        return hypot(self.x - point.x, self.y - point.y)
    }
}
