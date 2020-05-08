import SpriteKit
import Foundation

public extension SKTileMapNode {
    static func getMyMap() -> SKTileMapNode {
        let map = SKTileMapNode(tileSet: DrawnTile.tileSet,
                                     columns: 15,
                                     rows: 15,
                                     tileSize: CGSize(width: 128, height: 64))
        map.enableAutomapping = true
        for coordinate in coordinatesForWalkableTiles()  {
            map.setTileGroup(DrawnTile.group, forColumn: coordinate.0, row: coordinate.1)
        }
        map.enableAutomapping = false
        map.setTileGroup(DrawnTile.group, forColumn: 4, row: 5)
        map.setTileGroup(DrawnTile.group, forColumn: 5, row: 5)
        map.setTileGroup(DrawnTile.group, andTileDefinition: DrawnTile.downRightInteriorDefinition, forColumn: 5, row: 6)

        map.setTileGroup(DrawnTile.group, andTileDefinition: DrawnTile.upLeftEdgeDefinition, forColumn: 3, row: 6)
        map.setTileGroup(DrawnTile.group, andTileDefinition: DrawnTile.upEdgeDefinition, forColumn: 4, row: 6)
        map.setTileGroup(DrawnTile.group, andTileDefinition: DrawnTile.leftEdgeDefinition, forColumn: 3, row: 5)

        return map
    }

    static func coordinatesForWalkableTiles() -> [(Int, Int)] {
        return [(4,2), (4,3), (4,4), (4,5), (5,5), (6,5), (6,6), (6,7), (6,8), (6,9), (6,10), (6,11), (6,12), (6,13)]
    }
}
