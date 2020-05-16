import CoreGraphics

extension CGPoint {
    public func differenceTo(_ point: CGPoint) -> CGFloat {
        return hypot(self.x - point.x, self.y - point.y)
    }
}
