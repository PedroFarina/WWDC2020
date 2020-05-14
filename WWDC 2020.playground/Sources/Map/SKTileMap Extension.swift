import SpriteKit
import Foundation

public extension SKTileMapNode {
    static func getMyMap() -> SKTileMapNode {
        let map = SKTileMapNode(tileSet: SKTileSet.myTileSet,
                                     columns: 15,
                                     rows: 15,
                                     tileSize: CGSize(width: 128, height: 64))
        map.drawMyMapWith(NormalDrawnTile.group,
                      NormalDrawnTile.downRightInteriorDefinition,
                      NormalDrawnTile.upLeftEdgeDefinition,
                      NormalDrawnTile.upEdgeDefinition,
                      NormalDrawnTile.leftEdgeDefinition)

        return map
    }

    func redrawWithBadMap() {
        drawMyMapWith(BadDrawnTile.group,
                      BadDrawnTile.downRightInteriorDefinition,
                      BadDrawnTile.upLeftEdgeDefinition,
                      BadDrawnTile.upEdgeDefinition,
                      BadDrawnTile.leftEdgeDefinition)
    }

    static func coordinatesForWalkableTiles() -> [(Int, Int)] {
        return [(4,2), (4,3), (4,4), (4,5), (5,5), (6,5), (6,6), (6,7), (6,8), (6,9), (6,10), (6,11), (6,12), (6,13)]
    }
}

private extension SKTileMapNode {
    func drawMyMapWith(_ tileGroup: SKTileGroup,
                       _ downRightInteriorDefinition: SKTileDefinition,
                       _ upLeftEdgeDefinition: SKTileDefinition,
                       _ upEdgeDefinition: SKTileDefinition,
                       _ leftEdgeDefinition: SKTileDefinition) {
        fill(with: nil)
        enableAutomapping = true
        for coordinate in SKTileMapNode.coordinatesForWalkableTiles()  {
            setTileGroup(tileGroup, forColumn: coordinate.0, row: coordinate.1)
        }

        enableAutomapping = false
        setTileGroup(tileGroup, forColumn: 4, row: 5)
        setTileGroup(tileGroup, forColumn: 5, row: 5)
        setTileGroup(tileGroup, andTileDefinition: downRightInteriorDefinition, forColumn: 5, row: 6)

        setTileGroup(tileGroup, andTileDefinition: upLeftEdgeDefinition, forColumn: 3, row: 6)
        setTileGroup(tileGroup, andTileDefinition: upEdgeDefinition, forColumn: 4, row: 6)
        setTileGroup(tileGroup, andTileDefinition: leftEdgeDefinition, forColumn: 3, row: 5)

    }
}
