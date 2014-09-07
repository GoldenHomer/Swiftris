import SpriteKit

let NumOrientations: UInt32 = 4

enum Orientation: Int, Printable {
    case Zero = 0, Ninety, OneEighty, TwoSeventy
    
    var description: String {
        switch self {
            case .Zero:
                return "0"
            case .Ninety:
                return "90"
            case .OneEighty:
                return "180"
            case .TwoSeventy:
                return "270"
        }
    }
    
    static func rotate(orientation:Orientation, clockwise: Bool) -> Orientation {
        var rotated = orientation.toRaw() + (clockwise ? 1 : -1)
        if rotated > Orientation.TwoSeventy.toRaw(){
            rotated = Orientation.Zero.toRaw()
        }
        else if rotated < 0 {
            rotated = Orientation.TwoSeventy.toRaw()
        }
        return Orientation.fromRaw(rotated)!
    }
}
// Number of total shapes
let NumShapeTypes: UInt32 = 7

let FirstBlockIndex: Int = 0
let SecondBlockIndex: Int = 1
let ThirdBlockIndex: Int = 2
let FourthBlockIndex: Int = 3

class Shape: Hashable, Printable {
    let color:BlockColor
    
    var blocks = Array<Block>()
    
    var orientation: Orientation
    
    var column, row:Int
    
    var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>]{
        return [:]
    }
    
    var bottomBlocksForOrientations: [Orientation: Array<Block>]{
    return [:]
    }
    
    var bottomBlocks:Array<Block> {
        if let bottomBlocks = bottomBlocksForOrientations[orientation]{
                return bottomBlocks
        }
        return []
    }
    
    var hashValue:Int {
        return reduce(blocks, 0){$0.hashValue ^ $1.hashValue}
    }
    
    var description:String{
        return "\(color) block facing \(orientation): \(blocks[FirstBlockIndex]), \(blocks[SecondBlockIndex]), \(blocks[ThirdBlockIndex]), \(blocks[FourthBlockIndex])"
    }
    
    init(column:Int, row:Int, color: BlockColor, orientation:Orientation){
        self.color = color
        self.column = column
        self.row = row
        self.orientation = orientation
        initializeBlocks()
    }
    
    convenience init(column:Int, row:Int){
        self.init(column:column, row:row, color:BlockColor.random(), orientation:Orientation.random())
    }
    
    final func initializeBlocks(){ // final function that can't be overridden
        if let blockRowColumnTransactions = blockRowColumnPositions[orientation]{
            for i in 0..<blockRowColumnTranslations.count{
                let blockRow = row + blockRowColumnTranslations[i].rowDiff
                let blockColumn = column + blockRowColumnTranslations[i].columnDiff
                let newBlock = Block(column: blockColumn, row: blockRow, color: color)
                blocks.append(newBlock)
            }
        }
    }
}

func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.row == rhs.row && lhs.column == rhs.column
}