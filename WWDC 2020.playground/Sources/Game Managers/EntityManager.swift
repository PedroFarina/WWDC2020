import SpriteKit
import GameplayKit

public class EntityManager {
    private init() {
    }
    public class func shared() -> EntityManager {
        return _shared
    }
    private static var _shared: EntityManager = {
        let manager = EntityManager()
        return manager
    }()

    public private(set) var scene: SKScene = {
        if let scene = GameScene(fileNamed: "GameScene.sks") {
            return scene
        } else {
            return GameScene()
        }
    }()

    private var entities: Set<GKEntity> = []
    public func addEntityAt(_ entity: GKEntity, _ pos: CGPoint) {
        if let target = entity as? Targetable {
            let id = type(of: target).identifier
            if var targetEntities = targetables[id] {
                targetEntities.insert(target)
            } else {
                targetables[id] = [target]
            }
        }
        if let visualNode = entity.visualNode {
            visualNode.position = pos
            scene.addChild(visualNode)
        }
        entities.insert(entity)
    }

    public func removeEntity(_ entity: GKEntity) {
        if let target = entity as? Targetable {
            if var targetEntities = targetables[type(of: target).identifier] {
                targetEntities.remove(target)
            }
        }
        if let visualNode = entity.visualNode {
            visualNode.removeFromParent()
        }
        entities.remove(entity)
    }

    public func removeAll() {
        let copy = entities
        for entity in copy {
            entity.removeFromManager()
        }
    }

    private var targetables: [String: Set<GKEntity>] = [:]
    public func getTargets(for identifiers: [String]) -> Set<GKEntity> {
        var targets: Set<GKEntity> = Set<GKEntity>()
        for identifier in identifiers {
            guard let targetsToAppend = targetables[identifier] else { continue }
            targets = targets.union(targetsToAppend)
        }
        return targets
    }
}
