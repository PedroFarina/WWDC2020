import SpriteKit
import GameplayKit

public class VisualComponent: GKComponent {
    public let node: SKNode

    public override func didAddToEntity() {
        node.entity = self.entity
    }

    public init(text: String) {
        let lbl = SKLabelNode(text: text)
        if let fontURL = Bundle.main.url(forResource: "Fonts/Schoolbell", withExtension: "ttf") as CFURL? {
            CTFontManagerRegisterFontsForURL(fontURL, CTFontManagerScope.process, nil)
        }
        lbl.fontName = "Schoolbell"
        lbl.fontSize = 40
        lbl.fontColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        node = lbl

        super.init()
    }

    public init(animatedFrames: [SKTexture]) {
        let spriteNode = SKSpriteNode(texture: animatedFrames[0])
        spriteNode.run(SKAction.repeatForever(
        SKAction.animate(with: animatedFrames, timePerFrame: 0.15)))
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
