import GameplayKit

public class BaseEntity: GKEntity {
    var damaged = false
    public override init() {
        super.init()
        addComponent(VisualComponent(text: "Code Organization"))
        guard let visualNode = visualNode as? SKLabelNode else {
            fatalError("Could not make visual node")
        }

        let healthComponent = HealthComponent(health: 10) { (health) in
            if !self.damaged && health <= 5 {
                self.damaged = true
                EntityManager.shared().scene.map.redrawWithBadMap()
                visualNode.text = "Cdoe Ograniaztoni"
            } else if health <= 0 {
                //End game
                EntityManager.shared().scene.isPaused = true
            }
        }
        addComponent(healthComponent)
    }

    public required convenience init?(coder: NSCoder) {
        self.init()
    }
}
