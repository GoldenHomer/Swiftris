//
//  Array2D.swift
//  Swiftris
//
//  Created by Jose Contreras on 9/6/14.
//  Copyright (c) 2014 JLC. All rights reserved.
//

import Foundation

class Array2D<T> { /* <T> allows array to store any type of data */
    let columns: Int
    let rows: Int
    
    var array: Array<T?> /* with ? denotes an optional value */
    
    init(columns: Int, rows: Int){
        self.columns = columns
        self.rows = rows
        
        array = Array<T?>(count:rows * columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row:Int) -> T? {
        get {
            return array[(row*columns) + column]
        }
        set(newValue){
            array[(row*columns) + column] = newValue
        }
    }
}
