import SpriteKit
import GameplayKit

public class VisualComponent: GKComponent {
    public let node: SKNode

    public override func didAddToEntity() {
        node.entity = self.entity
    }

    public init(text: String) {
        let lbl = SKLabelNode(text: text)
        lbl.fontName = "Schoolbell"
        lbl.fontSize = 18
        lbl.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        node = lbl

        super.init()
    }

    public init(atlas: SKTextureAtlas) {
        var animatedFrames: [SKTexture] = []

        for name in atlas.textureNames.sorted() {
            let texture = atlas.textureNamed(name)
            texture.filteringMode = .nearest
            animatedFrames.append(texture)
        }

        let spriteNode = SKSpriteNode(texture: animatedFrames[0])
        atlas.preload {
            spriteNode.run(SKAction.repeatForever(
                SKAction.animate(with: animatedFrames, timePerFrame: 0.15)))
        }
        self.node = spriteNode
        super.init()
    }

    public init(texture: SKTexture) {
        node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        if let texture = coder.decodeObject(forKey: "texture") as? SKTexture {
            self.init(texture: texture)
        } else if let text = coder.decodeObject(forKey: "text") as? String {
            self.init(text: text)
        }
        return nil
    }
}
