//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 700))
sceneView.presentScene(EntityManager.shared().scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView



