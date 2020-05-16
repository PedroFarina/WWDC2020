import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        setup()
    }

    @objc static override var supportsSecureCoding: Bool {
        get {
            return true
        }
    }

    let map = SKTileMapNode.getMyMap()
    private func setup() {
        scaleMode = .aspectFill
        
        self.backgroundColor = .white

        map.zPosition = -1
        addChild(map)
    }

    func touchDown(atPoint pos : CGPoint) {

    }

    func touchMoved(toPoint pos : CGPoint) {
    }

    func touchUp(atPoint pos : CGPoint) {
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override func update(_ currentTime: TimeInterval) {

    }
}
