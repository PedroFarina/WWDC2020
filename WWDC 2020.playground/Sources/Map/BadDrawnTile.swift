import SpriteKit

public class BadDrawnTile {
    //MARK: C
    private static let centerEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Center.png"))
    private static let centerRule = SKTileGroupRule(adjacency: .adjacencyAll,
                                                    tileDefinitions: [ centerEdgeDefinition ])

    //MARK: Simple Directional
    public static let upEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadUp.png"))
    private static let upEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpEdge,
                                                    tileDefinitions: [ upEdgeDefinition ])

    public static let downEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadDown.png"))
    private static let downEdgeRule = SKTileGroupRule(adjacency: .adjacencyDownEdge,
                                                      tileDefinitions: [ downEdgeDefinition ])

    public static let leftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadLeft.png"))
    private static let leftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLeftEdge,
                                                      tileDefinitions: [ leftEdgeDefinition ])

    public static let rightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadRight.png"))
    private static let rightEdgeRule = SKTileGroupRule(adjacency: .adjacencyRightEdge,
                                                       tileDefinitions: [ rightEdgeDefinition ])

    //MARK: Directional Edges
    public static let upLeftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadUpLeft.png"))
    private static let upLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftEdge,
                                                        tileDefinitions: [ upLeftEdgeDefinition ])

    public static let upRightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadUpRight.png"))
    private static let upRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperRightEdge,
                                                         tileDefinitions: [ upRightEdgeDefinition ])

    public static let downLeftDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadDownLeft.png"))
    private static let downLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftEdge,
                                                          tileDefinitions: [ downLeftDefinition ])

    public static let downRightDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadDownRight.png"))
    private static let downRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightEdge,
                                                           tileDefinitions: [ downRightDefinition ])

    //MARK: Interiors
    public static let upLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadUpLeft Interior.png"))
    private static let upLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftCorner,
                                                            tileDefinitions: [ upLeftInteriorDefinition ])

    public static let upRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadUpRight Interior.png"))
    private static let upRightInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperRightCorner,
                                                             tileDefinitions: [ upRightInteriorDefinition ])

    public static let downLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadDownLeft Interior.png"))
    private static let downLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftCorner,
                                                              tileDefinitions: [ downLeftInteriorDefinition ])

    public static let downRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/BadDownRight Interior.png"))
    private static let downRightInteriorEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightCorner,
                                                                   tileDefinitions: [ downRightInteriorDefinition ])

    //MARK: Tile group and set
    public static let group: SKTileGroup = {
        let group = SKTileGroup(rules: [centerRule, upEdgeRule, downEdgeRule, leftEdgeRule, rightEdgeRule, upLeftEdgeRule, upRightEdgeRule, downLeftEdgeRule, downRightEdgeRule, upLeftInteriorRule, upRightInteriorRule, downLeftInteriorRule, downRightInteriorEdgeRule])
        group.name = "BadDrawnGroup"
        return group
    }()

    public static let tileSet: SKTileSet = {
        let set = SKTileSet(tileGroups: [group])
        set.name = "BadDrawnTileSet"
        set.type = .isometric
        return set
    }()
}
