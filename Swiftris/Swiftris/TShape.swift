class TShape:Shape{
    
    /*
    Orientation 0
    
        | 0 |
    | 1 | 2 | 3 |
    
    Orientation 90
    
    | 1 |
    | 2 | 0 |
    | 3 |
    
    Orientation 180
    
    | 1 | 2 | 3 |
        | 0 |
    
    Orientation 270
    
        | 1 |
    | 0 | 2 |
        | 3 |
    
    */
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>]{
        return [
            Orientation.Zero: [(1,0), (0,1), (1,1), (2,1)],
            Orientation.Ninety: [(2,1), (1,0), (1,1), (1,2)],
            Orientation.OneEighty: [(1,2), (0,1), (1,1), (2,1)],
            Orientation.Zero: [(1,0), (0,1), (1,1), (2,1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>]{
        return [
            Orientation.Zero: [blocks[SecondBlockIndex], blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Ninety: [blocks[FristBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Zero: [blocks[FirstBlockIndex], blocks[SecondBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Zero: [blocks[FirstBlockIndex], blocks[FourthBlockIndex]]
            
        ]
    }
}