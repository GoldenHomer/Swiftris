import SpriteKit

let NumberOfColors: UInt32 = 6 /* Define 6 colors avail*/

enum BlockColor: Int, Printable {
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    static func random() -> BlockColor {
        return BlockColor.fromRaw(<#Int#>(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, Printable { /* Hashable allows class Block to be stored in Array2D */
    let color: BlockColor
    
    var column: Int /* column and row will represent location of block */
    var row: Int
    var sprite: SKSpriteNode? /* render and animate each Block */
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int{
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor){
        self.column = column
        self.row = row
        self.color = color
    }
}

func ==(lhs: Block, rhs: Block) -> Bool{ // Custom operator for ==; when comparing Blocks, returns true IFF both Blocks are of the same location and color
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}
