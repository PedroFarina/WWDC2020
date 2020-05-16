import GameplayKit

public protocol Targetable: GKEntity {
    static var identifier: String { get }
}
