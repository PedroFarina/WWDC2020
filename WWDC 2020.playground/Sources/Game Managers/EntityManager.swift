import SpriteKit
import GameplayKit

public class EntityManager {
    private init() {
        //scene = GameScene(fileNamed: "GameScene.sks") ?? GameScene()
    }
    public static var shared: EntityManager = {
        let manager = EntityManager()
        return manager
    }()

//    public private(set) var scene: SKScene

    public func addToScene(_ entity: GKEntity) {

    }
}
