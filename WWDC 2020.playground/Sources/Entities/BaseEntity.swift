import GameplayKit

public class BaseEntity: GKEntity, Targetable {
    public static let identifier = "Base"
    
    var damaged = false
    public override init() {
        super.init()
        addComponent(VisualComponent(text: "Code Organization"))
        guard let visualNode = visualNode as? SKLabelNode else {
            fatalError("Could not make visual node")
        }
        visualNode.zPosition = 5
        visualNode.zRotation = 1.84 * .pi

        let healthComponent = HealthComponent(health: 10) { (health) in
            if !self.damaged && health <= 5 {
                self.damaged = true
                EntityManager.shared().scene.map.redrawWithBadMap()
                for tower in EntityManager.shared().scene.towers {
                    tower.redrawWithBadTexture()
                }
                visualNode.text = "Cdoe Ograniaztoni"
            } else if health <= 0 {
                EndGameEntity(text: "Your code broke").addToManager()
                EntityManager.shared().scene.isPaused = true
            }
        }
        addComponent(healthComponent)
    }

    public required convenience init?(coder: NSCoder) {
        self.init()
    }
}
