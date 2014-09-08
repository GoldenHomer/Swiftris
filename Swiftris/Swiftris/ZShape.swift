class ZShape:Shape {
    /*
    
    Orientation 0
    
       ~| 0 |
    | 2 | 1 |
    | 3 |
    
    Orientation 90
    
    | 0 | 1~|
        | 2 | 3 |
    
    Orientation 180
    
       ~| 0 |
    | 2 | 1 |
    | 3 |
    
    Orientation 270
    
    | 0 | 1~|
        | 2 | 3 |
    
    */
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        return [
            Orientation.Zero:       [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orientation.Ninety:     [(-1,0), (0, 0), (0, 1), (1, 1)],
            Orientation.OneEighty:  [(1, 0), (1, 1), (0, 1), (0, 2)],
            Orientation.TwoSeventy: [(-1,0), (0, 0), (0, 1), (1, 1)]
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        return [
            Orientation.Zero:       [blocks[SecondBlockIndex], blocks[FourthBlockIndex]],
            Orientation.Ninety:     [blocks[FirstBlockIndex], blocks[ThirdBlockIndex], blocks[FourthBlockIndex]],
            Orientation.OneEighty:  [blocks[SecondBlockIndex], blocks[FourthBlockIndex]],
            Orientation.TwoSeventy: [blocks[FirstBlockIndex], blocks[ThirdBlockIndex], blocks[FourthBlockIndex]]
        ]
    }
}