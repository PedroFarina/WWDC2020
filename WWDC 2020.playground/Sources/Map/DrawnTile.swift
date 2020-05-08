import SpriteKit

public class DrawnTile {
    //MARK: C
    private static let centerEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Center.png"))
    private static let centerRule = SKTileGroupRule(adjacency: .adjacencyAll,
                                     tileDefinitions: [ centerEdgeDefinition ])

    //MARK: Simple Directional
    private static let upEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Up.png"))
    private static let upEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpEdge,
                                     tileDefinitions: [ upEdgeDefinition ])

    private static let downEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Down.png"))
    private static let downEdgeRule = SKTileGroupRule(adjacency: .adjacencyDownEdge,
                                       tileDefinitions: [ downEdgeDefinition ])

    private static let leftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Left.png"))
    private static let leftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLeftEdge,
                                                      tileDefinitions: [ leftEdgeDefinition ])

    private static let rightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Right.png"))
    private static let rightEdgeRule = SKTileGroupRule(adjacency: .adjacencyRightEdge,
                                                      tileDefinitions: [ rightEdgeDefinition ])

    //MARK: Directional Edges
    private static let upLeftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/UpLeft.png"))
    private static let upLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftEdge,
                                                    tileDefinitions: [ upLeftEdgeDefinition ])

    private static let upRightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/UpRight.png"))
    private static let upRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperRightEdge,
                                                      tileDefinitions: [ upRightEdgeDefinition ])

    private static let downLeftDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/DownLeft.png"))
    private static let downLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftEdge,
                                                      tileDefinitions: [ downLeftDefinition ])

    private static let downRightDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/DownRight.png"))
    private static let downRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightEdge,
                                                       tileDefinitions: [ downRightDefinition ])

    //MARK: Interiors
    private static let upLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/UpLeft Interior.png"))
    private static let upLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftCorner,
                                                        tileDefinitions: [ upLeftInteriorDefinition ])

    private static let upRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/UpRight Interior.png"))
    private static let upRightInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperRightCorner,
                                                         tileDefinitions: [ upRightInteriorDefinition ])

    private static let downLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/DownLeft Interior.png"))
    private static let downLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftCorner,
                                                          tileDefinitions: [ downLeftInteriorDefinition ])

    private static let downRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/DownRight Interior.png"))
    private static let downRightInteriorEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightCorner,
                                                           tileDefinitions: [ downRightInteriorDefinition ])

    //MARK: Tile group and set
    public static let group: SKTileGroup = {
        let group = SKTileGroup(rules: [centerRule, upEdgeRule, downEdgeRule, leftEdgeRule, rightEdgeRule, upLeftEdgeRule, upRightEdgeRule, downLeftEdgeRule, downRightEdgeRule, upLeftInteriorRule, upRightInteriorRule, downLeftInteriorRule, downRightInteriorEdgeRule])
        group.name = "DrawnGroup"
        return group
    }()

    public static let tileSet: SKTileSet = {
        let set = SKTileSet(tileGroups: [group])
        set.name = "DrawnTileSet"
        set.type = .isometric
        return set
    }()
}
