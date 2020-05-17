//: This is a code organization themed  Tower Defense game. When you're ready to begin your experience, just hit play and tap one of the spots to build your tower and unleash the bugs.

//#-hidden-code
import PlaygroundSupport
import SpriteKit


let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 700, height: 700))
sceneView.presentScene(EntityManager.shared().scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code

let numberOfBugs = /*#-editable-code Number of bugs*/30/*#-end-editable-code*/
let spawnRate = /*#-editable-code Spawn rate*/0.5/*#-end-editable-code*/

//#-hidden-code
var spawner = SpawnerEntity(rateOfSpawn: spawnRate, numberOfBugs: numberOfBugs, path: EntityManager.shared().walkablePath) {
    EntityManager.shared().noMoreBugs = true
}
EntityManager.shared().scene.spawner = spawner
//#-end-hidden-code
