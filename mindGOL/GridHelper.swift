//
//  GridHelper.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/3/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit

var gridArray: [Grid] = []

struct GridHelper {
    static func addGrid(grid: Grid) {
        gridArray.append(grid)
    }
    
    static func getGrid() -> Grid{
        return gridArray[0]
    }
}