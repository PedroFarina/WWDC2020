import SpriteKit

public class GameScene: SKScene {
    public override func didMove(to view: SKView) {
        setup()
    }

    @objc public static override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }
    private static let placeholderTexture = SKTexture(imageNamed: "Towers/Placeholder.png")

    public let base = BaseEntity()
    public let money = MoneyEntity()
    public let map = SKTileMapNode.getMyMap()
    private func setup() {
        scaleMode = .aspectFill
        
        self.backgroundColor = .white

        map.zPosition = -1
        addChild(map)

        var placeholder = makePlaceholder()
        placeholder.position = CGPoint(x: 150, y: 320)
        placeholder.zPosition = 1
        addChild(placeholder)
        placeholder = makePlaceholder()
        placeholder.position = CGPoint(x: -240, y: -150)
        placeholder.zPosition = 3
        addChild(placeholder)

        base.addToSceneAt(CGPoint(x: 425, y: 340))
        money.addToSceneAt(CGPoint(x: -420, y: 420))
    }

    private func makePlaceholder() -> SKSpriteNode {
        let placeholder = SKSpriteNode(texture: GameScene.placeholderTexture)
        placeholder.name = "placeholder"
        placeholder.setScale(0.3)
        return placeholder
    }

    func touchDown(atPoint pos : CGPoint) {
        if nodes(at: pos).first(where: { $0.name == "placeholder" }) != nil {

        }
    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    var previousTime: TimeInterval = 0
    public override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - previousTime
        for entity in EntityManager.shared().entities {
            entity.update(deltaTime: deltaTime)
        }
        previousTime = currentTime
    }
}
