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

    public private(set) var scene: GameScene = {
        if let scene = GameScene(fileNamed: "GameScene.sks") {
            return scene
        } else {
            return GameScene()
        }
    }()
    lazy public private(set) var walkablePath: [CGPoint] = {
        var path: [CGPoint] = []
        for coordinate in SKTileMapNode.coordinatesForWalkableTiles() {
            let p = scene.map.centerOfTile(atColumn: coordinate.0, row: coordinate.1)
            path.append(p)
        }
        return path
    }()

    public var noMoreBugs: Bool = false

    public private(set) var entities: Set<GKEntity> = []
    public func addEntityAt(_ entity: GKEntity, _ pos: CGPoint) {
        if let target = entity as? Targetable {
            let id = type(of: target).identifier
            if var targetEntities = targetables[id] {
                targetEntities.insert(target)
                targetables[id] = targetEntities
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
                targetEntities.remove(entity)
                if type(of: target).identifier == BugEntity.identifier &&
                    noMoreBugs && targetEntities.isEmpty {
                    EndGameEntity(text: "Yey! You defended the code.").addToManager()
                    scene.isPaused = true
                }
                targetables[type(of: target).identifier] = targetEntities
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
