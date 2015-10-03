//
//  LabelHelper.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/3/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit


var labelArray: [Label] = []

struct LabelHelper {
    static func addLabelNode(labelNode: Label) {
        labelArray.append(labelNode)
    }
    
    static func getLabelNodeWithGroupName(name: String) -> SKLabelNode {
        for var i = 0; i < labelArray.count; i++ {
            if (labelArray[i].groupName == name) {
                return labelArray[i]
            }
        }
        return labelArray[0]
    }
}
