import GameplayKit

public class SpawnerEntity: GKEntity {

    public init(rateOfSpawn: TimeInterval, numberOfBugs: Int, path: [CGPoint], completionHandler: @escaping () -> Void) {
        super.init()

        addComponent(SpawnComponent(path: path, rateOfSpawn: rateOfSpawn, numberOfBugs: numberOfBugs, completionHandler: completionHandler))
    }

    public required init?(coder: NSCoder) {
        return nil
    }
}
