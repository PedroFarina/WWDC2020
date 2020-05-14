import SpriteKit

public class BadDrawnTile {
    //MARK: C
    private static let centerEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Center.png"))
    private static let centerRule = SKTileGroupRule(adjacency: .adjacencyAll,
                                                    tileDefinitions: [ centerEdgeDefinition ])

    //MARK: Simple Directional
    public static let upEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/Up.png"))
    private static let upEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpEdge,
                                                    tileDefinitions: [ upEdgeDefinition ])

    public static let downEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/Down.png"))
    private static let downEdgeRule = SKTileGroupRule(adjacency: .adjacencyDownEdge,
                                                      tileDefinitions: [ downEdgeDefinition ])

    public static let leftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/Left.png"))
    private static let leftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLeftEdge,
                                                      tileDefinitions: [ leftEdgeDefinition ])

    public static let rightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/Right.png"))
    private static let rightEdgeRule = SKTileGroupRule(adjacency: .adjacencyRightEdge,
                                                       tileDefinitions: [ rightEdgeDefinition ])

    //MARK: Directional Edges
    public static let upLeftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/UpLeft.png"))
    private static let upLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftEdge,
                                                        tileDefinitions: [ upLeftEdgeDefinition ])

    public static let upRightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/UpRight.png"))
    private static let upRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperRightEdge,
                                                         tileDefinitions: [ upRightEdgeDefinition ])

    public static let downLeftDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/DownLeft.png"))
    private static let downLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftEdge,
                                                          tileDefinitions: [ downLeftDefinition ])

    public static let downRightDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/DownRight.png"))
    private static let downRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightEdge,
                                                           tileDefinitions: [ downRightDefinition ])

    //MARK: Interiors
    public static let upLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/UpLeft Interior.png"))
    private static let upLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftCorner,
                                                            tileDefinitions: [ upLeftInteriorDefinition ])

    public static let upRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/UpRight Interior.png"))
    private static let upRightInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperRightCorner,
                                                             tileDefinitions: [ upRightInteriorDefinition ])

    public static let downLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/DownLeft Interior.png"))
    private static let downLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftCorner,
                                                              tileDefinitions: [ downLeftInteriorDefinition ])

    public static let downRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Bad/DownRight Interior.png"))
    private static let downRightInteriorEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightCorner,
                                                                   tileDefinitions: [ downRightInteriorDefinition ])

    //MARK: Tile group and set
    public static let group: SKTileGroup = {
        let group = SKTileGroup(rules: [centerRule, upEdgeRule, downEdgeRule, leftEdgeRule, rightEdgeRule, upLeftEdgeRule, upRightEdgeRule, downLeftEdgeRule, downRightEdgeRule, upLeftInteriorRule, upRightInteriorRule, downLeftInteriorRule, downRightInteriorEdgeRule])
        group.name = "BadDrawnGroup"
        return group
    }()
}
