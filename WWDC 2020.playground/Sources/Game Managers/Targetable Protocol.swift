import GameplayKit

public protocol Targetable: GKEntity {
    var identifier: String { get }
}
