import SpriteKit

public class DrawnTile {
    //MARK: C
    private static let centerEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Center.png"))
    private static let centerRule = SKTileGroupRule(adjacency: .adjacencyAll,
                                     tileDefinitions: [ centerEdgeDefinition ])

    //MARK: Simple Directional
    public static let upEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/Up.png"))
    private static let upEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpEdge,
                                     tileDefinitions: [ upEdgeDefinition ])

    public static let downEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/Down.png"))
    private static let downEdgeRule = SKTileGroupRule(adjacency: .adjacencyDownEdge,
                                       tileDefinitions: [ downEdgeDefinition ])

    public static let leftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/Left.png"))
    private static let leftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLeftEdge,
                                                      tileDefinitions: [ leftEdgeDefinition ])

    public static let rightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/Right.png"))
    private static let rightEdgeRule = SKTileGroupRule(adjacency: .adjacencyRightEdge,
                                                      tileDefinitions: [ rightEdgeDefinition ])

    //MARK: Directional Edges
    public static let upLeftEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/UpLeft.png"))
    private static let upLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftEdge,
                                                    tileDefinitions: [ upLeftEdgeDefinition ])

    public static let upRightEdgeDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/UpRight.png"))
    private static let upRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyUpperRightEdge,
                                                      tileDefinitions: [ upRightEdgeDefinition ])

    public static let downLeftDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/DownLeft.png"))
    private static let downLeftEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftEdge,
                                                      tileDefinitions: [ downLeftDefinition ])

    public static let downRightDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/DownRight.png"))
    private static let downRightEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightEdge,
                                                       tileDefinitions: [ downRightDefinition ])

    //MARK: Interiors
    public static let upLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/UpLeft Interior.png"))
    private static let upLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperLeftCorner,
                                                        tileDefinitions: [ upLeftInteriorDefinition ])

    public static let upRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/UpRight Interior.png"))
    private static let upRightInteriorRule = SKTileGroupRule(adjacency: .adjacencyUpperRightCorner,
                                                         tileDefinitions: [ upRightInteriorDefinition ])

    public static let downLeftInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/DownLeft Interior.png"))
    private static let downLeftInteriorRule = SKTileGroupRule(adjacency: .adjacencyLowerLeftCorner,
                                                          tileDefinitions: [ downLeftInteriorDefinition ])

    public static let downRightInteriorDefinition = SKTileDefinition(texture: SKTexture(imageNamed: "Tiles/Normal/DownRight Interior.png"))
    private static let downRightInteriorEdgeRule = SKTileGroupRule(adjacency: .adjacencyLowerRightCorner,
                                                           tileDefinitions: [ downRightInteriorDefinition ])

    //MARK: Tile group and set
    public static let group: SKTileGroup = {
        let group = SKTileGroup(rules: [centerRule, upEdgeRule, downEdgeRule, leftEdgeRule, rightEdgeRule, upLeftEdgeRule, upRightEdgeRule, downLeftEdgeRule, downRightEdgeRule, upLeftInteriorRule, upRightInteriorRule, downLeftInteriorRule, downRightInteriorEdgeRule])
        group.name = "NormalDrawnGroup"
        return group
    }()

    public static let tileSet: SKTileSet = {
        let set = SKTileSet(tileGroups: [group])
        set.name = "NormalDrawnTileSet"
        set.type = .isometric
        return set
    }()
}
