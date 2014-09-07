import SpriteKit

let TickLengthLevelOne = NSTimeInterval(600) /* 0.6 seconds to move block down 1 row */

class GameScene: SKScene {
   
    var tick:(() -> ())? /* This is a closure in Swift*/
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate?
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if lastTick == nil {
            return /* this is intentional */
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.00 /* ! is required if the object is considered optional with ? */
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?()
        }
    }
    
    func startTicking(){
        lastTick = NSDate.date()
    }
    
    func stopTicking(){
        lastTick = nil
    }
    
    init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0,y: 1.0)
        
        let background = SKSpriteNode(imageNamed:"background") /* let indicates background cannot be reassigned */
        background.position = CGPoint(x: 0,y: 0)
        background.anchorPoint = CGPoint(x:0, y:0)
        addChild(background)
    }
}