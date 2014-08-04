import SpriteKit

class GameScene:

SKScene {
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0,y: 1.0)
        
        let background = SKSpriteNode(imageNamed:"background")
        background.position = CGPoint(x: 0,y: 0)
        background.anchorPoint = CGPoint(x:0, y:0)
        addChild(background)
    }
}