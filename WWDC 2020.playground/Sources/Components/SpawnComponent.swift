import GameplayKit

public class SpawnComponent: GKComponent {
    var timeTillNextBug: TimeInterval = 0
    var rateOfSpawn: TimeInterval
    var numberOfBugs: Int
    var completionHandler: () -> Void

    var path: [CGPoint]

    public init(path: [CGPoint], rateOfSpawn: TimeInterval, numberOfBugs: Int, completionHandler: @escaping () -> Void) {
        self.rateOfSpawn = rateOfSpawn
        self.numberOfBugs = numberOfBugs
        self.path = path
        self.completionHandler = completionHandler

        super.init()
    }

    public required convenience init?(coder: NSCoder) {
        guard let rateOfSpawn = coder.decodeObject(forKey: "rateOfSpawn") as? TimeInterval,
            let path = coder.decodeObject(forKey: "path") as? [CGPoint],
            let completionHandler = coder.decodeObject(forKey: "completionHandler") as? () -> Void else {
            return nil
        }
        let numberOfBugs = coder.decodeInteger(forKey: "numberOfBugs")
        self.init(path: path, rateOfSpawn: rateOfSpawn, numberOfBugs: numberOfBugs, completionHandler: completionHandler)
    }

    public override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)

        timeTillNextBug -= seconds
        guard numberOfBugs > 0, let origin = path.first, timeTillNextBug < 0 else {
            return
        }
        timeTillNextBug = rateOfSpawn

        let bug = BugEntity(path: path)
        bug.addToSceneAt(origin)

        numberOfBugs -= 1
        if numberOfBugs <= 0 {
            completionHandler()
        }
    }
}

