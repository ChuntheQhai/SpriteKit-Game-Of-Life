//
//  Label.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/3/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit

class Label: SKLabelNode {
  
    
    var groupName: String!
   
    
    init(fontName:String, text:String, size:CGFloat, position:CGPoint, zPosition:CGFloat, groupName:String ){
        super.init()
        self.fontName = fontName
        self.text = text
        self.fontSize = size
        self.position = position
        self.zPosition = zPosition
        self.groupName = groupName
    }
    
    
    
    override init(fontNamed fontName: String?) {
        super.init(fontNamed: fontName)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}