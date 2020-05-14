import SpriteKit

public extension SKTileSet {
    static var myTileSet: SKTileSet {
        let set = SKTileSet(tileGroups: [NormalDrawnTile.group, BadDrawnTile.group])
        set.name = "DrawnTileSet"
        set.type = .isometric
        return set
    }
}
