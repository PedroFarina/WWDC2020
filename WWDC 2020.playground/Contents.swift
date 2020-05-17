//: A code organization Tower Defense Playground

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
