import GameplayKit

public class EndGameEntity: GKEntity {
    public init(text: String) {
        super.init()
        addComponent(VisualComponent(text: text))

        guard let visualNode = visualNode as? SKLabelNode else {
            return
        }
        visualNode.fontSize = 80
        visualNode.fontColor = .red
    }

    public required convenience init?(coder: NSCoder) {
        guard let text = coder.decodeObject(forKey: "text") as? String else {
            return nil
        }
        self.init(text: text)
    }
}

